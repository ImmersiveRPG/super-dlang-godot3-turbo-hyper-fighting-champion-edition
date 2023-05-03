// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition

module godot_project_verify;

import std.stdio : stdout, stderr;
import scan_d_code : KlassInfo;
import godot_project;
import scan_godot_files;

public import verifiers;

string[][string] verifyProject(string godot_project_path, ProjectInfo project_info, KlassInfo[] class_infos, Verifications vers = Verifications.All) {
	import std.string : format;
	import std.algorithm : filter;
	import std.array : assocArray, byPair;
	import helpers : sortBy;

	string[][string] retval;

	auto project_visitors = getProjectVisitors(vers);
	auto scene_visitors = getSceneVisitors(vers);
	auto script_visitors = getScriptVisitors(vers);
	auto library_visitors = getVerifyLibraryVisitor(vers);

	// Check projects
	ProjectFile project = project_info._project;
	if (project && ! project._error) {
		string[] errors;
		foreach (visitor ; project_visitors) {
			errors ~= visitor.visit(godot_project_path, project_info, class_infos);
		}
		if (errors.length) retval[project._path] = errors;
	}

	// Check scenes
	foreach (scene ; project_info._scenes.values.sortBy!("_path")) {
		if (scene._error) continue;
		string[] errors;
		foreach (visitor ; scene_visitors) {
			errors ~= visitor.visit(scene, godot_project_path, project_info, class_infos);
		}
		if (errors.length) retval["tscn: %s".format(scene._path)] = errors;
	}

	// Check scripts
	foreach (script ; project_info._scripts.values.sortBy!("_path")) {
		if (script._error) continue;
		string[] errors;
		foreach (visitor ; script_visitors) {
			errors ~= visitor.visit(script, godot_project_path, project_info, class_infos);
		}
		if (errors.length) retval["gdns: %s".format(script._path)] = errors;
	}

	// Check libraries
	foreach (library ; project_info._libraries.values.sortBy!("_path")) {
		if (library._error) continue;
		string[] errors;
		foreach (visitor ; library_visitors) {
			errors ~= visitor.visit(library, godot_project_path, project_info, class_infos);
		}
		if (errors.length) retval["gdnlib: %s".format(library._path)] = errors;
	}

	// Remove any empty error arrays
	retval = retval
			.byPair
			.filter!(pair => pair.value.length > 0)
			.assocArray;

	return retval;
}


string[][string] runVerification(string project_path, Verifications vers) {
	import scan_godot_files : scanProjectInfo;
	import scan_d_code : scanGodotScriptClasses;
	import helpers : absolutePath, buildPath;

	project_path = absolutePath(project_path);
	string godot_path = buildPath(project_path, `project/`);
	string src_path = buildPath(project_path, `src/`);

	auto project_info = scanProjectInfo(godot_path);
	auto class_infos = scanGodotScriptClasses(src_path);
	return verifyProject(godot_path, project_info, class_infos, vers);
}




