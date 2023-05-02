// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition


import helpers : dirName, buildPath;
import scan_d_code : KlassInfo;
import godot_project : ProjectInfo, SceneFile;
import godot_project_verify : Verifications, runVerification, verifyProject, VerifySceneVisitor;


class VerifySceneVisitorSignalMethodInCode : VerifySceneVisitor {
	override string[] visit(SceneFile scene, string project_path, ProjectInfo project_info, KlassInfo[] class_infos) {
		import std.string : format;
		import std.algorithm : canFind, filter, map;
		import std.array : assocArray, byPair;
		import std.path : extension;
		import helpers : sortBy;
		string[] errors;

		// Get the class name from scene -> node -> resource -> script -> class_name
		string class_name = null;
		{
			// Get all the node script ids
			auto ids = scene._nodes
				.filter!(n => n._script)
				.map!(n => n._script.id);
			if (ids.empty) return errors;

			// Get all the resources with the script id
			int id = ids.front;
			auto resources = scene._resources
				.sortBy!("_path")
				.filter!(r => r._id == id)
				.filter!(r => r._type == "Script")
				.filter!(r => r._path.extension == ".gdns");
			if (resources.empty) return errors;

			// Get all the scripts with the same paths as the resources
			auto resource = resources.front;
			auto scripts = project_info._scripts
				.byPair
				.filter!(pair => pair.key == resource._path)
				.map!(pair => pair.value);
			if (scripts.empty) return errors;

			auto script = scripts.front;
			class_name = script._class_name;
			if (class_name == null) return errors;
		}

		// Get the signal method names
		auto methods = scene._connections
			.map!(c => c._method);
		if (methods.empty) return errors;

		// Get the classes with the same names
		auto classes = class_infos
			.sortBy!("class_name")
			.filter!(c => c.full_class_name == class_name);
		if (classes.empty) return errors;

		// Make sure the classes have the methods
		foreach (class_info ; classes) {
			foreach (method ; methods) {
				bool is_method_found = ! class_info.methods
					.filter!(m => m.name == method)
					.empty;

				bool is_attribute_found = ! class_info.methods
					.filter!(m => m.name == method)
					.filter!(m => m.attributes.canFind("Method"))
					.empty;

				// found but missing attribute
				if (is_method_found && ! is_attribute_found) {
					errors ~= `Signal method "%s" found in class "%s" but missing @Method attribute`.format(method, class_name);
				// not found
				} else if (! is_method_found) {
					errors ~= `Signal method "%s" not found in class "%s"`.format(method, class_name);
				}
			}
		}

		return errors;
	}
}

unittest {
	import BDD;

	describe("godot_project_verify#scene",
		it("Should fail when signal method doesn't exists in code", () {
			auto test_path = __FILE__.dirName.buildPath("tests/project_scene_signal_no_code_method") ~ "/";
			auto errors = runVerification(`tests/project_scene_signal_no_code_method/`, Verifications.SceneSignalMethodInCode);
			errors.shouldEqual([`tscn: Level/Level.tscn`:
				[`Signal method "xxx" not found in class "level.Level"`]
			]);
		}),
		it("Should fail when signal method exists but missing Method attribute", () {
			auto test_path = __FILE__.dirName.buildPath("tests/project_scene_signal_no_method_attribute") ~ "/";
			auto errors = runVerification(`tests/project_scene_signal_no_method_attribute/`, Verifications.SceneSignalMethodInCode);
			errors.shouldEqual([`tscn: Level/Level.tscn`:
				[`Signal method "on_button_pressed" found in class "level.Level" but missing @Method attribute`]
			]);
		})
	);
}
