

module verifiers;

import scan_d_code : KlassInfo;
import godot_project : ProjectInfo, SceneFile, NativeScriptFile, NativeLibraryFile;
import helpers : u32;


enum Verifications : u32 {
	None                        = 1 << 0,
	ProjectMainScene            = 1 << 1,
	SceneResource               = 1 << 2,
	SceneSignalMethodInCode     = 1 << 3,
	SceneTypeClassTypeMismatch  = 1 << 4,
	ScriptNativeLibrary         = 1 << 5,
	ScriptClassName             = 1 << 6,
	ScriptScriptClassInCode     = 1 << 7,
	LibrarySymbolPrefix         = 1 << 8,
	LibraryDllPath              = 1 << 9,
	All                         = u32.max,
}

abstract class VerifyProjectVisitor {
	string[] visit(string project_path, ProjectInfo project_info, KlassInfo[] class_infos);
}

abstract class VerifySceneVisitor {
	string[] visit(SceneFile scene, string project_path, ProjectInfo project_info, KlassInfo[] class_infos);
}

abstract class VerifyScriptVisitor {
	string[] visit(NativeScriptFile script, string project_path, ProjectInfo project_info, KlassInfo[] class_infos);
}

abstract class VerifyLibraryVisitor {
	string[] visit(NativeLibraryFile library, string project_path, ProjectInfo project_info, KlassInfo[] class_infos);
}

VerifyProjectVisitor[] getProjectVisitors(Verifications vers) {
	import verify_normal : VerifyProjectVisitorPass;
	import verify_project_visitor_main_scene : VerifyProjectVisitorMainScene;

	VerifyProjectVisitor[] visitors = [];
	visitors ~= new VerifyProjectVisitorPass();
	if (vers & Verifications.ProjectMainScene) visitors ~= new VerifyProjectVisitorMainScene();
	return visitors;
}

VerifySceneVisitor[] getSceneVisitors(Verifications vers) {
	import verify_scene_visitor_resource : VerifySceneVisitorResource;
	import verify_scene_visitor_signal_method_in_code : VerifySceneVisitorSignalMethodInCode;
	import verify_scene_visitor_scene_type_class_type_mismatch : VerifySceneVisitorSceneTypeClassTypeMismatch;

	VerifySceneVisitor[] visitors = [];
	if (vers & Verifications.SceneResource) visitors ~= new VerifySceneVisitorResource();
	if (vers & Verifications.SceneSignalMethodInCode) visitors ~= new VerifySceneVisitorSignalMethodInCode();
	if (vers & Verifications.SceneTypeClassTypeMismatch) visitors ~= new VerifySceneVisitorSceneTypeClassTypeMismatch();
	return visitors;
}

VerifyScriptVisitor[] getScriptVisitors(Verifications vers) {
	import verify_script_visitor_native_library : VerifyScriptVisitorNativeLibrary;
	import verify_script_visitor_class_name : VerifyScriptVisitorClassName;
	import verify_script_visitors_script_class_in_code : VerifyScriptVisitorScriptClassInCode;

	VerifyScriptVisitor[] visitors = [];
	if (vers & Verifications.ScriptNativeLibrary) visitors ~= new VerifyScriptVisitorNativeLibrary();
	if (vers & Verifications.ScriptClassName) visitors ~= new VerifyScriptVisitorClassName();
	if (vers & Verifications.ScriptScriptClassInCode) visitors ~= new VerifyScriptVisitorScriptClassInCode();
	return visitors;
}

VerifyLibraryVisitor[] getVerifyLibraryVisitor(Verifications vers) {
	import verify_library_visitor_symbol_prefix : VerifyLibraryVisitorSymbolPrefix;
	import verify_library_visitor_dll_path : VerifyLibraryVisitorDllPath;

	VerifyLibraryVisitor[] visitors = [];
	if (vers & Verifications.LibrarySymbolPrefix) visitors ~= new VerifyLibraryVisitorSymbolPrefix();
	if (vers & Verifications.LibraryDllPath) visitors ~= new VerifyLibraryVisitorDllPath();
	return visitors;
}
