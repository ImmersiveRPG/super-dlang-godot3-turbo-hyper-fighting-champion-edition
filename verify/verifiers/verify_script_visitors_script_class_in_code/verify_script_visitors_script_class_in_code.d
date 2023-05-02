// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition

module verify_script_visitors_script_class_in_code;

import helpers : dirName, buildPath;
import scan_d_code : KlassInfo;
import godot_project : ProjectInfo, NativeScriptFile;
import godot_project_verify : Verifications, runVerification, verifyProject, VerifyScriptVisitor;



class VerifyScriptVisitorScriptClassInCode : VerifyScriptVisitor {
	override string[] visit(NativeScriptFile script, string project_path, ProjectInfo project_info, KlassInfo[] class_infos) {
		import std.string : format;
		import std.algorithm : filter;
		import helpers : sortBy;
		string[] errors;

		// Make sure the script class is in the D code
		if (script._class_name) {
			bool has_class = ! class_infos
				.filter!(c => c.full_class_name == script._class_name)
				.empty;

			if (! has_class) {
				errors ~= `Script missing class "%s"`.format(script._class_name);
			}
		}

		return errors;
	}
}

unittest {
	import BDD;

	describe("godot_project_verify#script",
		it("Should fail when script class does not exist in code", () {
			auto test_path = __FILE__.dirName.buildPath("tests/project_script_no_code_class") ~ "/";
			auto errors = runVerification(test_path, Verifications.ScriptScriptClassInCode);
			errors.shouldEqual([`gdns: Player/Player.gdns`:
				[`Script missing class "player.Player"`]
			]);
		})
	);
}
