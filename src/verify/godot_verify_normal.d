// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition


import scan_d_code : KlassInfo;
import godot_project : ProjectInfo, NativeScriptFile;
import godot_project_verify : Verifications, runVerification, verifyProject, VerifyProjectVisitor;



class VerifyProjectVisitorPass : VerifyProjectVisitor {
	override string[] visit(string project_path, ProjectInfo project_info, KlassInfo[] class_infos) {
		string[] errors;

		return errors;
	}
}

unittest {
	import BDD;

	describe("godot_project_verify#project",
		it("Should succeed on working project", () {
			auto errors = runVerification(`test/project_normal/`, Verifications.All);
			errors.shouldEqual((string[][string]).init);
		})
	);
}
