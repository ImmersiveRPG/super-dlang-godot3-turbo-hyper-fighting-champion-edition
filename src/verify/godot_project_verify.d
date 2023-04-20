// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition

module godot_project_verify;

import std.stdio : stdout, stderr;
import scan_d_code : KlassInfo;
import godot_project;
import godot_project_parse;
import helpers : u32;


enum Verifications : u32 {
	None                        = 1 << 0,
	ProjectMainScene            = 1 << 1,
	SceneResource               = 1 << 2,
	SceneSignalMethodInCode     = 1 << 3,
	SceneTypeClassTypeMismatch  = 1 << 4,
	ScriptNativeLibrary         = 1 << 5,
	ScriptClassName             = 1 << 6,
	ScriptScriptClassInCode     = 1 << 7,
	LibrarySymbolPrefix         = 1 << 8,
	LibraryDllPath              = 1 << 9,
	All                         = u32.max,
}


string[][string] verifyProject(string godot_project_path, ProjectInfo project_info, KlassInfo[] class_infos, Verifications vers = Verifications.All) {
	import std.string : format;
	import std.algorithm : filter;
	import std.array : assocArray, byPair;
	import helpers : sortBy;

	string[][string] retval;

	import godot_verify_normal : VerifyProjectVisitorPass;
	import godot_verify_project_visitor_main_scene : VerifyProjectVisitorMainScene;
	import godot_verify_scene_visitor_resource : VerifySceneVisitorResource;
	import godot_verify_scene_visitor_signal_method_in_code : VerifySceneVisitorSignalMethodInCode;
	import godot_verify_scene_visitor_scene_type_class_type_mismatch : VerifySceneVisitorSceneTypeClassTypeMismatch;
	import godot_verify_script_visitor_native_library : VerifyScriptVisitorNativeLibrary;
	import godot_verify_script_visitor_class_name : VerifyScriptVisitorClassName;
	import godot_verify_script_visitors_script_class_in_code : VerifyScriptVisitorScriptClassInCode;
	import godot_verify_library_visitor_symbol_prefix : VerifyLibraryVisitorSymbolPrefix;
	import godot_verify_library_visitor_dll_path : VerifyLibraryVisitorDllPath;

	VerifyProjectVisitor[] project_visitors = [];
	project_visitors ~= new VerifyProjectVisitorPass();
	if (vers & Verifications.ProjectMainScene) project_visitors ~= new VerifyProjectVisitorMainScene();

	VerifySceneVisitor[] scene_visitors = [];
	if (vers & Verifications.SceneResource) scene_visitors ~= new VerifySceneVisitorResource();
	if (vers & Verifications.SceneSignalMethodInCode) scene_visitors ~= new VerifySceneVisitorSignalMethodInCode();
	if (vers & Verifications.SceneTypeClassTypeMismatch) scene_visitors ~= new VerifySceneVisitorSceneTypeClassTypeMismatch();

	VerifyScriptVisitor[] script_visitors = [];
	if (vers & Verifications.ScriptNativeLibrary) script_visitors ~= new VerifyScriptVisitorNativeLibrary();
	if (vers & Verifications.ScriptClassName) script_visitors ~= new VerifyScriptVisitorClassName();
	if (vers & Verifications.ScriptScriptClassInCode) script_visitors ~= new VerifyScriptVisitorScriptClassInCode();

	VerifyLibraryVisitor[] library_visitors = [];
	if (vers & Verifications.LibrarySymbolPrefix) library_visitors ~= new VerifyLibraryVisitorSymbolPrefix();
	if (vers & Verifications.LibraryDllPath) library_visitors ~= new VerifyLibraryVisitorDllPath();

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
	import godot_project_parse : getProjectInfo;
	import scan_d_code : getGodotScriptClasses;
	import helpers : absolutePath, buildPath;

	project_path = absolutePath(project_path);
	string godot_path = buildPath(project_path, `project/`);
	string src_path = buildPath(project_path, `src/`);

	auto project_info = getProjectInfo(godot_path);
	auto class_infos = getGodotScriptClasses(src_path);
	return verifyProject(godot_path, project_info, class_infos, vers);
}

abstract class VerifyProjectVisitor {
	string[] visit(string project_path, ProjectInfo project_info, KlassInfo[] class_infos);
}

abstract class VerifySceneVisitor {
	string[] visit(SceneFile scene, string project_path, ProjectInfo project_info, KlassInfo[] class_infos);
}

abstract class VerifyScriptVisitor {
	string[] visit(NativeScriptFile script, string project_path, ProjectInfo project_info, KlassInfo[] class_infos);
}

abstract class VerifyLibraryVisitor {
	string[] visit(NativeLibraryFile library, string project_path, ProjectInfo project_info, KlassInfo[] class_infos);
}


