// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition


import helpers : dirName, buildPath;
import scan_d_code : KlassInfo;
import godot_project : ProjectInfo, SceneFile;
import godot_project_verify : Verifications, runVerification, verifyProject, VerifySceneVisitor;


class VerifySceneVisitorResource : VerifySceneVisitor {
	override string[] visit(SceneFile scene, string project_path, ProjectInfo project_info, KlassInfo[] class_infos) {
		import std.string : format;
		import std.file : exists;
		import std.algorithm : filter, sort;
		import helpers : sortBy;
		string[] errors;

		// Make sure the resource files exists
		auto resources = scene._resources
			.sort!((a, b) => a._path < b._path)
			.filter!(r => ! exists(project_path ~ r._path));

		foreach (resource ; resources) {
			errors ~= `Scene resource file not found: "%s"`.format(resource._path);
		}

		return errors;
	}
}

unittest {
	import BDD;

	describe("godot_project_verify#scene",
		it("Should fail when scene resource file is not found", () {
			auto test_path = __FILE__.dirName.buildPath("tests/project_scene_resource_missing") ~ "/";
			auto errors = runVerification(`tests/project_scene_resource_missing/`, Verifications.SceneResource);
			errors.shouldEqual([`tscn: Level/Level.tscn`:
				[`Scene resource file not found: "Player/XXX.tscn"`]
			]);
		})
	);
}
