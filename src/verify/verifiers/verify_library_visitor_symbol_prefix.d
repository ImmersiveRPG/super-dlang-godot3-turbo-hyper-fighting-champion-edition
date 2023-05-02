// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition


import scan_d_code : KlassInfo;
import godot_project : ProjectInfo, NativeLibraryFile;
import godot_project_verify : Verifications, runVerification, verifyProject, VerifyLibraryVisitor;


class VerifyLibraryVisitorSymbolPrefix : VerifyLibraryVisitor {
	override string[] visit(NativeLibraryFile library, string project_path, ProjectInfo project_info, KlassInfo[] class_infos) {
		string[] errors;

		// Make sure library has symbol_prefix
		if (library._symbol_prefix == null) {
			errors ~= `Library missing symbol_prefix`;
		}

		return errors;
	}
}

unittest {
	import BDD;

	describe("godot_project_verify#library",
		it("Should fail when native library symbol_prefix is not specified", () {
			auto errors = runVerification(`tests/project_library_no_symbol_prefix_entry/`, Verifications.LibrarySymbolPrefix);
			errors.shouldEqual([`gdnlib: libsimple.gdnlib`:
				[`Library missing symbol_prefix`]
			]);
		})
	);
}
