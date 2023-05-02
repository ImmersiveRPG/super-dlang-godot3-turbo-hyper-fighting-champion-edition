

module verifiers;

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

public {
	import verify_normal : VerifyProjectVisitorPass;
	import verify_project_visitor_main_scene : VerifyProjectVisitorMainScene;
	import verify_scene_visitor_resource : VerifySceneVisitorResource;
	import verify_scene_visitor_signal_method_in_code : VerifySceneVisitorSignalMethodInCode;
	import verify_scene_visitor_scene_type_class_type_mismatch : VerifySceneVisitorSceneTypeClassTypeMismatch;
	import verify_script_visitor_native_library : VerifyScriptVisitorNativeLibrary;
	import verify_script_visitor_class_name : VerifyScriptVisitorClassName;
	import verify_script_visitors_script_class_in_code : VerifyScriptVisitorScriptClassInCode;
	import verify_library_visitor_symbol_prefix : VerifyLibraryVisitorSymbolPrefix;
	import verify_library_visitor_dll_path : VerifyLibraryVisitorDllPath;
}
