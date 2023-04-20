// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition


import scan_d_code : KlassInfo;
import godot_project : ProjectInfo;
import godot_project_verify : Verifications, runVerification, verifyProject, VerifyProjectVisitor;


class VerifyProjectVisitorMainScene : VerifyProjectVisitor {
	override string[] visit(string project_path, ProjectInfo project_info, KlassInfo[] class_infos) {
		import std.string : format;
		import std.file : exists;
		string[] errors;

		if (project_info._project._main_scene_path == null) {
			errors ~= `Project missing main scene`;
		} else if (! exists(project_path ~ project_info._project._main_scene_path)) {
			errors ~= `Project main scene file not found: "%s"`.format(project_info._project._main_scene_path);
		}

		return errors;
	}
}

unittest {
	import BDD;

	describe("godot_project_verify#project",
		it("Should fail when project main scene is not specified", () {
			auto errors = runVerification(`test/project_main_scene_no_entry/`, Verifications.ProjectMainScene);
			errors.shouldEqual([`project.godot`:
				[`Project missing main scene`]
			]);
		}),
		it("Should fail when project main scene file is not found", () {
			auto errors = runVerification(`test/project_main_scene_no_file/`, Verifications.ProjectMainScene);
			errors.shouldEqual([`project.godot`:
				[`Project main scene file not found: "Level/XXX.tscn"`]
			]);
		})
	);
}
