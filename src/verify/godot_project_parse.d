// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/workhorsy/godot-d-verify

module godot_project_parse;


import std.stdio : stdout;
import std.parallelism : Task, task, TaskPool, totalCPUs;
import std.sumtype : SumType, match;
import std.algorithm.comparison : clamp;

import helpers;
import godot_project;

void getProjectFiles(string full_project_path, void delegate(string full_file_path) cb) {
	import std.path : extension;
	import std.array : replace, array;
	import std.algorithm : canFind;
	import std.string : chompPrefix, stripLeft;
	import helpers : getcwd, chdir, baseName, dirName, dirEntries, SpanMode;

	string prev_dir = getcwd();
	scope (exit) chdir(prev_dir);

	// Get the directory path
	string project_file = baseName(full_project_path);
	string project_dir = dirName(full_project_path);
	chdir(project_dir);

	// Get the paths of all the files to scan
	immutable string[] extensions = [".gdns", ".tscn", ".gdnlib", ".gd"];
	auto entries = dirEntries(project_dir, SpanMode.breadth);

	cb("project.godot");
	foreach (e ; entries) {
		if (! e.isFile || ! extensions.canFind(e.name.extension)) continue;

		auto f = e.name
			.replace(`\`, `/`)
			.chompPrefix(project_dir)
			.stripLeft(`/`);
		cb(f);
	}
}

alias GodotFile = SumType!(Project, Scene, NativeScript, GDScript, NativeLibrary);

GodotFile parseGodotFile(string name) {
	import std.string : format;
	import std.path : extension;

	switch (extension(name)) {
		case ".godot":
			return GodotFile(new Project(name));
		case ".tscn":
			return GodotFile(new Scene(name));
		case ".gdns":
			return GodotFile(new NativeScript(name));
		case ".gd":
			return GodotFile(new GDScript(name));
		case ".gdnlib":
			return GodotFile(new NativeLibrary(name));
		default:
			throw new Exception(`Unexpected file type: "%s"`.format(name));
	}
}

Info parseProjectInfoSync(string full_project_path) {
	import std.path : extension;
	import std.array : replace, array;
	import std.algorithm : filter, map, canFind;
	import std.string : chompPrefix, stripLeft;
	import helpers : getcwd, chdir, baseName, dirName, dirEntries, SpanMode;

	string prev_dir = getcwd();
	scope (exit) chdir(prev_dir);

	// Get the directory path
	string project_file = baseName(full_project_path);
	string project_dir = dirName(full_project_path);
	chdir(project_dir);

	// Get the paths of all the files to scan
	immutable string[] extensions = [".gdns", ".tscn", ".gdnlib", ".gd"];
	string[] files_to_scan = "project.godot" ~
			dirEntries(project_dir, SpanMode.breadth)
			.filter!(e => extensions.canFind(e.name.extension))
			.filter!(e => e.isFile)
			.map!(e => e.name.replace(`\`, `/`))
			.map!(e => e.chompPrefix(project_dir))
			.map!(e => e.stripLeft(`/`))
			.array;

	// Scan each file
	Info info = new Info();
	foreach (name ; files_to_scan) {
		switch (extension(name)) {
			case ".godot":
				info._project = new Project(name);
				break;
			case ".tscn":
				info._scenes[name] = new Scene(name);
				break;
			case ".gdns":
				info._scripts[name] = new NativeScript(name);
				break;
			case ".gd":
				info._gdscripts[name] = new GDScript(name);
				break;
			case ".gdnlib":
				info._libraries[name] = new NativeLibrary(name);
				break;
			default:
				break;
		}
	}

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

			// Make sure there is a project
			auto info = parseProjectInfoSync(project_path ~ `project/project.godot`);
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
			auto class_infos = getGodotScriptClasses(project_path ~ `src/`);
			class_infos.map!(c => c.class_name).array.shouldEqual(["Level"]);
		}),
		it("Should parse project with unreferenced files", delegate() {
			string project_path = absolutePath(`test/project_unreferenced_files/`);

			// Make sure there is a project
			auto info = parseProjectInfoSync(project_path ~ `project/project.godot`);
			info.shouldNotBeNull();

			// Make sure all scenes, scripts, and libraries were found
			info._scenes.keys.shouldEqual(["Player/Player.tscn", "Box2/Box2.tscn", "Level/Level.tscn"]);
			info._gdscripts.keys.shouldEqual(["Box2/Box2.gd"]);
			info._scripts.keys.shouldEqual(["Player/Player.gdns"]);
			info._libraries.keys.shouldEqual(["libgame.gdnlib"]);

			// Make sure the D code was found
			auto class_infos = getGodotScriptClasses(project_path ~ `src/`);
			class_infos.map!(c => c.class_name).array.shouldEqual(["Player"]);
		})
	);
}
