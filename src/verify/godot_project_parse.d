// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition

module godot_project_parse;


import std.stdio : stdout;
import std.parallelism : Task, task, TaskPool, totalCPUs;
import std.sumtype : SumType, match;
import std.algorithm.comparison : clamp;

import helpers;
import godot_project;

void listGodotFiles(string full_godot_project_path, void delegate(string full_file_path) cb) {
	import std.path : extension;
	import std.array : replace, array;
	import std.algorithm : canFind;
	import std.string : chompPrefix, stripLeft;
	import helpers : baseName, dirName, dirEntries, SpanMode;

	// Get the paths of all the files to scan
	immutable string[] extensions = [".gdns", ".tscn", ".gdnlib", ".gd", ".godot"];
	auto entries = dirEntries(full_godot_project_path, SpanMode.breadth);

	foreach (e ; entries) {
		if (! e.isFile) continue;
		if (! extensions.canFind(e.name.extension)) continue;
		if (e.name.extension == ".godot" && baseName(e.name) != "project.godot") continue;

		auto f = e.name
			.replace(`\`, `/`)
			.chompPrefix(full_godot_project_path)
			.stripLeft(`/`);
		cb(f);
	}
}

alias GodotFile = SumType!(ProjectFile, SceneFile, NativeScriptFile, GDScriptFile, NativeLibraryFile);

GodotFile parseGodotFile(string name) {
	import std.string : format;
	import std.path : extension;

	switch (extension(name)) {
		case ".godot":
			return GodotFile(new ProjectFile(name));
		case ".tscn":
			return GodotFile(new SceneFile(name));
		case ".gdns":
			return GodotFile(new NativeScriptFile(name));
		case ".gd":
			return GodotFile(new GDScriptFile(name));
		case ".gdnlib":
			return GodotFile(new NativeLibraryFile(name));
		default:
			throw new Exception(`Unexpected file type: "%s"`.format(name));
	}
}

ProjectInfo parseProjectInfo(string full_godot_project_path) {
	import std.path : extension;
	import std.array : replace, array;
	import std.algorithm : filter, map, canFind;
	import std.string : chompPrefix, stripLeft;
	import helpers : getcwd, chdir, baseName, dirName, dirEntries, SpanMode;

	s64 start, end;

	string prev_dir = getcwd();
	chdir(full_godot_project_path);
	//stdout.writefln(`!!!! prev_dir: %s`, prev_dir); stdout.flush();
	scope (exit) chdir(prev_dir);

	// Setup task pool to use 1 to 4 threads
	u32 cpu_count = clamp(totalCPUs, 1, 4);
	auto task_pool = new TaskPool(cpu_count);
	scope(exit) task_pool.stop();

	// Start parsing each file in a task pool
	start = GetCpuTicksNS();
	Task!(parseGodotFile, string)*[] _parse_tasks;
	listGodotFiles(full_godot_project_path, (string name) {
		//stdout.writefln(`!!!! name: %s`, name); stdout.flush();
		auto t = task!(parseGodotFile)(name);
		_parse_tasks ~= t;
		task_pool.put(t);
	});
	end = GetCpuTicksNS();
	stdout.writefln(`1 !!!! listGodotFiles time: %s`, end - start); stdout.flush();

	// Complete all tasks in the pool
	start = GetCpuTicksNS();
	task_pool.finish();
	end = GetCpuTicksNS();
	stdout.writefln(`2 !!!! finish time: %s`, end - start); stdout.flush();

	// Copy all parsed files into project
	start = GetCpuTicksNS();
	ProjectInfo info = new ProjectInfo();
	foreach (t ; _parse_tasks) {
		GodotFile godot_file = t.yieldForce();
		//stdout.writefln(`!!!! godot_file: %s`, godot_file); stdout.flush();
		godot_file.match!(
			(ProjectFile p) { info._project = p; },
			(SceneFile s) { info._scenes[s._path] = s; },
			(NativeScriptFile ns) { info._scripts[ns._path] = ns; },
			(GDScriptFile gs) { info._gdscripts[gs._path] = gs; },
			(NativeLibraryFile nl) { info._libraries[nl._path] = nl; }
		);
	}
	end = GetCpuTicksNS();
	stdout.writefln(`3 !!!! ProjectInfo time: %s`, end - start); stdout.flush();

	return info;
}

unittest {
	import BDD;
	import std.algorithm : map;
	import std.array : array;
	import helpers : absolutePath;
	import scan_d_code : getGodotScriptClasses;

	describe("godot_project_parse#SceneSignal",
		it("Should parse basic project", delegate() {
			string project_path = absolutePath(`test/project_signal/`);
			string godot_path = buildPath(project_path, `project/`);
			string src_path = buildPath(project_path, `src/`);

			// Make sure there is a project
			auto info = parseProjectInfo(godot_path);
			info._project.shouldNotBeNull();

			// Make sure there is a scene
			info._scenes.keys.shouldEqual(["Level/Level.tscn"]);
			auto scene = info._scenes["Level/Level.tscn"];
			scene.shouldNotBeNull();

			// Make sure the scene has a signal
			scene._connections.length.shouldEqual(1);
			auto connection = scene._connections[0];
			connection.isValid.shouldEqual(true);

			// Make sure the scene has a resource
			scene._resources.map!(r => r._path).array.shouldEqual(["Level/Level.gdns"]);
			auto resource = scene._resources[0];

			// Make sure the scene has a script
			info._scripts.keys.shouldEqual(["Level/Level.gdns"]);
			auto script = info._scripts["Level/Level.gdns"];
			scene._connections.length.shouldEqual(1);

			// Make sure there is D code
			auto class_infos = getGodotScriptClasses(src_path);
			class_infos.map!(c => c.class_name).array.shouldEqual(["Level"]);
		}),
		it("Should parse project with unreferenced files", delegate() {
			string project_path = absolutePath(`test/project_unreferenced_files/`);
			string godot_path = buildPath(project_path, `project/`);
			string src_path = buildPath(project_path, `src/`);

			// Make sure there is a project
			auto info = parseProjectInfo(godot_path);
			info.shouldNotBeNull();

			// Make sure all scenes, scripts, and libraries were found
			info._scenes.keys.shouldEqual(["Player/Player.tscn", "Box2/Box2.tscn", "Level/Level.tscn"]);
			info._gdscripts.keys.shouldEqual(["Box2/Box2.gd"]);
			info._scripts.keys.shouldEqual(["Player/Player.gdns"]);
			info._libraries.keys.shouldEqual(["libgame.gdnlib"]);

			// Make sure the D code was found
			auto class_infos = getGodotScriptClasses(src_path);
			class_infos.map!(c => c.class_name).array.shouldEqual(["Player"]);
		})
	);
}
