// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition


import scan_d_code : KlassInfo;
import godot_project : ProjectInfo, SceneFile;
import godot_project_verify : Verifications, runVerification, verifyProject, VerifySceneVisitor;



class VerifySceneVisitorSceneTypeClassTypeMismatch : VerifySceneVisitor {
	override string[] visit(SceneFile scene, string project_path, ProjectInfo project_info, KlassInfo[] class_infos) {
		import std.string : format;
		import std.file : exists;
		import std.path : extension;
		import std.algorithm : filter;
		import helpers : sortBy;
		string[] errors;

		// Find all the nodes that have a script
		foreach (node ; scene._nodes.filter!(n => n._script)) {
			// Find all the resources with the same id
			auto resources = scene._resources
				.filter!(r => r._id == node._script.id)
				.filter!(r => r._path.extension == ".gdns")
				.filter!(r => r._path in project_info._scripts);

			// Make sure the node is referencing an existing resource
			if (resources.empty) {
				//errors ~= `Node script resource %s was not found`.format(node._script.id);
				continue;
			}
			auto resource = resources.front;

			auto script = project_info._scripts[resource._path];
			string class_name = script._class_name;

			// Find all the classes with same type
			auto classes = class_infos
				.filter!(c => c.base_class_name == "GodotScript")
				.filter!(c => c.full_class_name == class_name);
				//.filter!(c => c.base_class_template == node._type)

			foreach (class_info ; classes) {
				if (class_info.base_class_template != node._type) {
					errors ~= `Scene "%s" is type "%s" but attached script "%s" is type "%s"`
						.format(node._name, node._type, class_info.class_name, class_info.full_base_class_name);
				}
			}
		}

		return errors;
	}
}

unittest {
	import BDD;

	describe("godot_project_verify#scene",
		it("Should fail when scene type is not same as script code type", () {
			auto errors = runVerification(`test/project_script_code_class_wrong_type/`, Verifications.SceneTypeClassTypeMismatch);
			errors.shouldEqual([`tscn: Player/Player.tscn`:
				[`Scene "Player" is type "Spatial" but attached script "Player" is type "GodotScript!Area"`]
			]);
		})
	);
}
