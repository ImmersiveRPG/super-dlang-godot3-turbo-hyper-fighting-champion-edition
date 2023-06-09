// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition

module verify_script_visitor_class_name;

import helpers : dirName, buildPath;
import scan_d_code : KlassInfo;
import godot_project : ProjectInfo, NativeScriptFile;
import godot_project_verify : Verifications, runVerification, verifyProject;
import verifiers : VerifyScriptVisitor;



class VerifyScriptVisitorClassName : VerifyScriptVisitor {
	override string[] visit(NativeScriptFile script, string project_path, ProjectInfo project_info, KlassInfo[] class_infos) {
		string[] errors;

		// Make sure script has a class name
		if (script._class_name == null) {
			errors ~= `Script missing class_name`;
		}

		return errors;
	}
}

unittest {
	import BDD;

	describe("godot_project_verify#script",
		it("Should fail when script class_name is not specified", () {
			auto test_path = __FILE__.dirName.buildPath("tests/project_script_no_class_name") ~ "/";
			auto errors = runVerification(test_path, Verifications.ScriptClassName);
			errors.shouldEqual([`gdns: Player/Player.gdns`:
				[`Script missing class_name`]
			]);
		})
	);
}
