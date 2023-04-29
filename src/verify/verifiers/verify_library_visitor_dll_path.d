// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition


import scan_d_code : KlassInfo;
import godot_project : ProjectInfo, NativeLibraryFile;
import godot_project_verify : Verifications, runVerification, verifyProject, VerifyLibraryVisitor;


class VerifyLibraryVisitorDllPath : VerifyLibraryVisitor {
	override string[] visit(NativeLibraryFile library, string project_path, ProjectInfo project_info, KlassInfo[] class_infos) {
		string[] errors;

		// Make sure the dll/so is specified
		version (Windows) {
			if (library._dll_windows_path == null) {
				errors ~= `Library missing path for Windows.64`;
			}
		} else version (linux) {
			if (library._dll_linux_path == null) {
				errors ~= `Library missing path for X11.64`;
			}
		}

		return errors;
	}
}

unittest {
	import BDD;

	describe("godot_project_verify#library",
		it("Should fail when native library dll/so file is not specified", () {
			auto errors = runVerification(`test/project_library_no_dll_entry/`, Verifications.LibraryDllPath);

			version (Windows) {
				errors.shouldEqual([`gdnlib: libsimple.gdnlib`:
					[`Library missing path for Windows.64`]
				]);
			} else version (linux) {
				errors.shouldEqual([`gdnlib: libsimple.gdnlib`:
					[`Library missing path for X11.64`]
				]);
			}
		})
	);
}
