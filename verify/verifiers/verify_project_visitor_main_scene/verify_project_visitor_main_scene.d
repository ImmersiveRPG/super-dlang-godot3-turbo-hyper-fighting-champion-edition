// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition

module verify_project_visitor_main_scene;

import helpers : dirName, buildPath;
import scan_d_code : KlassInfo;
import godot_project : ProjectInfo;
import godot_project_verify : Verifications, runVerification, verifyProject;
import verifiers : VerifyProjectVisitor;


class VerifyProjectVisitorMainScene : VerifyProjectVisitor {
	override string[] visit(string project_path, ProjectInfo project_info, KlassInfo[] class_infos) {
		import std.string : format;
		import std.file : exists;
		string[] errors;

		if (project_info._project._main_scene_path == null) {
			errors ~= `Project missing main_scene`;
		} else if (! exists(project_path ~ project_info._project._main_scene_path)) {
			errors ~= `Project main_scene file not found: "%s"`.format(project_info._project._main_scene_path);
		}

		return errors;
	}
}

unittest {
	import BDD;

	describe("godot_project_verify#project",
		it("Should fail when project main scene is not specified", () {
			auto test_path = __FILE__.dirName.buildPath("tests/project_main_scene_no_entry") ~ "/";
			auto errors = runVerification(test_path, Verifications.ProjectMainScene);
			errors.shouldEqual([`project.godot`:
				[`Project missing main_scene`]
			]);
		}),
		it("Should fail when project main scene file is not found", () {
			auto test_path = __FILE__.dirName.buildPath("tests/project_main_scene_no_file") ~ "/";
			auto errors = runVerification(test_path, Verifications.ProjectMainScene);
			errors.shouldEqual([`project.godot`:
				[`Project main_scene file not found: "Level/XXX.tscn"`]
			]);
		})
	);
}
