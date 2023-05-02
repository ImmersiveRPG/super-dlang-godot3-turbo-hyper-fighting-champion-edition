// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition


import helpers : dirName, buildPath;
import scan_d_code : KlassInfo;
import godot_project : ProjectInfo, NativeScriptFile;
import godot_project_verify : Verifications, runVerification, verifyProject, VerifyScriptVisitor;



class VerifyScriptVisitorNativeLibrary : VerifyScriptVisitor {
	override string[] visit(NativeScriptFile script, string project_path, ProjectInfo project_info, KlassInfo[] class_infos) {
		import std.string : format;
		import std.file : exists;
		string[] errors;

		// Make sure the resource files exists
		if (script._native_library is null) {
			errors ~= `Script missing native library`;
		} else {
			if (! exists(project_path ~ script._native_library._path)) {
				errors ~= `Script resource file not found: "%s"`.format(script._native_library._path);
			}
		}

		return errors;
	}
}

unittest {
	import BDD;

	describe("godot_project_verify#script",
		it("Should fail when script native library is not specified", () {
			auto test_path = __FILE__.dirName.buildPath("tests/project_script_resource_no_entry") ~ "/";
			auto errors = runVerification(`tests/project_script_resource_no_entry/`, Verifications.ScriptNativeLibrary);
			errors.shouldEqual([`gdns: Player/Player.gdns`:
				[`Script missing native library`]
			]);
		}),
		it("Should fail when script native library file is not found", () {
			auto test_path = __FILE__.dirName.buildPath("tests/project_script_resource_no_file") ~ "/";
			auto errors = runVerification(`tests/project_script_resource_no_file/`, Verifications.ScriptNativeLibrary);
			errors.shouldEqual([`gdns: Player/Player.gdns`:
				[`Script resource file not found: "XXX.gdnlib"`]
			]);
		})
	);
}
