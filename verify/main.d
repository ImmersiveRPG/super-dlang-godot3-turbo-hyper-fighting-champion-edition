// Copyright (c) 2021-2023 Matthew Brennan Jones <matthew.brennan.jones@gmail.com>
// MIT License
// Verify Godot 3 projects that use the D Programming Language
// https://github.com/ImmersiveRPG/super-dlang-godot3-turbo-hyper-fighting-champion-edition

import helpers;
import godot_project;
import scan_godot_files : scanProjectInfo;
import godot_project_verify : verifyProject;
import scan_d_code : scanGodotScriptClasses;

import std.stdio : stdout, stderr, File;

bool is_printing_time = false;

int main(string[] args) {
	import std.file : chdir, exists;
	import std.getopt : getopt, config;

	s64 start, end;
	start = getCpuTicksNS();

	// Change the dir to the location of the current exe
	chdir(dirName(args[0]));

	// Get the options
	string project_path = null;
	string source_path = null;
	bool generate_script_list = false;
	bool is_help = false;
	string getopt_error = null;
	try {
		auto result = getopt(args,
		config.required, "project", &project_path,
		config.required, "source", &source_path,
		"generate_script_list", &generate_script_list);
		is_help = result.helpWanted;
	} catch (Exception err) {
		getopt_error = err.msg;
		is_help = true;
	}

	// If there was an error, print the help and quit
	if (is_help) {
		stdout.writefln(
		"Verify Godot 3 Dlang project\n" ~
		"--project               Directory containing Godot project file. Required:\n" ~
		"--source                Directory containing D source code. Required:\n" ~
		"--generate_script_list  Will generate a list of classes that are GodotScript. Optional:\n" ~
		"--help                  This help information.\n"); stdout.flush();

		if (getopt_error) {
			stderr.writefln("Error: %s", getopt_error); stderr.flush();
		}
		return 1;
	}

	// Check paths
	project_path = toPosixPath(project_path);
	if (! exists(project_path)) {
		stderr.writefln(`Error: Godot project directory not found: %s`, project_path); stderr.flush();
		return 1;
	}
	project_path = absolutePath(project_path);

	source_path = toPosixPath(source_path);
	if (! exists(source_path)) {
		stderr.writefln(`Error: D source code directory not found: %s`, source_path); stderr.flush();
		return 1;
	}
	source_path = absolutePath(source_path);

	// Get the project info
	stdout.writefln(`Verifying Godot 3 Dlang project:`); stdout.flush();
	stdout.writefln(`Project file path: %s`, project_path); stdout.flush();
	stdout.writefln(`Dlang source path: %s`, source_path); stdout.flush();
	end = getCpuTicksNS();
	if (is_printing_time) {
		stdout.writefln(`!!!! setup time: %s`, end - start); stdout.flush();
	}

	// Get the godot project info
	start = getCpuTicksNS();
	auto project_info = scanProjectInfo(project_path);
	end = getCpuTicksNS();
	if (is_printing_time) {
		stdout.writefln(`!!!! parse time: %s`, end - start); stdout.flush();
	}

	// Get source code info
	start = getCpuTicksNS();
	auto class_infos = scanGodotScriptClasses(source_path);
	end = getCpuTicksNS();
	if (is_printing_time) {
		stdout.writefln(`!!!! get script classes time: %s`, end - start); stdout.flush();
	}

	// Find and print any errors
	start = getCpuTicksNS();
	auto project_errors = verifyProject(project_path, project_info, class_infos);
	int error_count;
	foreach (name, errors ; project_errors) {
		stdout.writeln(name);
		foreach (error ; errors) {
			error_count++;
			stdout.writeln("    ", error);
		}
	}
	if (error_count > 0) {
		stdout.writefln(`Verification failed! Found %s error(s)!`, error_count); stdout.flush();
		return 1;
	}
	end = getCpuTicksNS();
	if (is_printing_time) {
		stdout.writefln(`!!!! verify time: %s`, end - start); stdout.flush();
	}

	// Generate a list of classes that are GodotScript
	start = getCpuTicksNS();
	if (generate_script_list) {
		string file_name = "generated_gdnative_info.d";
		string script_list_file = buildPath(source_path, file_name);
		stdout.writefln(`Generating script list file: %s`, script_list_file); stdout.flush();
		File file = File(script_list_file, "w");
		scope (exit) file.close();

		file.writefln("\n");
		file.writefln("struct GDNInfo {");
		file.writefln("	string symbol_prefix;");
		file.writefln("	string[string] script_class_list;");
		file.writefln("}");

		file.writefln(`enum auto infos = [`);
		foreach (library ; project_info._libraries) {
			file.writefln(`	"%s" : `, library._path);
			file.writefln(`		GDNInfo("%s", [`, library._symbol_prefix);
			foreach (class_info ; class_infos) {
				file.writefln(`			"%s" : "%s",`, class_info._module, class_info.class_name);
			}
			file.writefln("		])");
		}
		file.writefln("];");
	}
	end = getCpuTicksNS();
	if (is_printing_time) {
		stdout.writefln(`!!!! generated_gdnative_info time: %s`, end - start); stdout.flush();
	}

	stdout.writefln(`All verification checks were successful.`); stdout.flush();
	return 0;
}
