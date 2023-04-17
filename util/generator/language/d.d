module language.d;

import godotutil.string;
import api.util;
import api.classes, api.methods;

import language;

import std.algorithm.iteration;
import std.range;
import std.path;
import std.conv : text;
import std.string;

Language getDLanguage()
{
	Language ret;
	ret.classOutputFiles = [
		Language.ClassOutputFile(&generateClass),
		Language.ClassOutputFile(&generateGlobalConstants),
		Language.ClassOutputFile(&generateGlobalEnums),
		Language.ClassOutputFile(&generatePackage)
	];
	return ret;
}





private:

static immutable string copyrightNotice = 
`Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  `;

string[2] generatePackage(GodotClass c)
{
	if(c.name.godot == "GlobalConstants") return [null, null];
	
	if(c.descendant_ptrs.length == 0) return [null, null];
	
	string filename = buildPath("godot", c.name.moduleName, "all.d");
	string ret;
	
	ret ~= "module godot.";
	ret ~= c.name.moduleName;
	ret ~= ".all;\n\n";
	
	ret ~= "public import\n\tgodot."~c.name.moduleName;
	
	const(GodotClass)[] recursiveDescendants;
	void addDescendant(GodotClass d)
	{
		import std.algorithm.searching;
		if(!recursiveDescendants[].canFind(d)) recursiveDescendants ~= d;
		foreach(rd; d.descendant_ptrs[]) addDescendant(rd);
	}
	foreach(d; c.descendant_ptrs[]) addDescendant(d);
	
	foreach(di, d; recursiveDescendants[])
	{
		ret ~= ",\n\tgodot."~d.name.moduleName;
	}
	ret ~= ";\n";
	
	string[2] arr = [filename, ret];
	return arr;
}


string[2] generateClass(GodotClass c)
{
	if(c.name.godot == "GlobalConstants") return [null, null];
	
	string folder = "godot";
	string filename = (c.descendant_ptrs.length == 0) ?
		buildPath(folder, c.name.moduleName~".d") :
		buildPath(folder, c.name.moduleName, "package.d");
	string ret;
	
	ret ~= "/**\n"~c.ddocBrief~"\n\n";
	ret ~= "Copyright:\n"~copyrightNotice~"\n\n";
	ret ~= "License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)\n\n";
	ret ~= "\n*/\n";
	
	// module names should be all lowercase in D
	// https://dlang.org/dstyle.html
	ret ~= "module godot.";
	ret ~= c.name.moduleName;
	ret ~= ";\n";
	ret ~= "import std.meta : AliasSeq, staticIndexOf;\n";
	ret ~= "import std.traits : Unqual;\n";
	ret ~= "import godot.d.traits;\nimport godot.core;\nimport godot.c;\n";
	ret ~= "import godot.d.bind;\n";
	ret ~= "import godot.d.reference;\n";
	ret ~= "import godot.globalenums;\n";
	if(c.name.godot != "Object") ret ~= "import godot.object;\n";
	
	if(c.instanciable)
	{
		ret ~= "import godot.classdb;\n";
	}
	
	ret ~= c.source;
	
	string[2] arr = [filename, ret];
	return arr;
}

string[2] generateGlobalConstants(GodotClass c)
{
	import std.conv : text;
	import std.string;
	import std.meta;
	import std.algorithm.iteration, std.algorithm.searching, std.algorithm.sorting;
	import std.range : array;
	
	if(c.name.godot != "GlobalConstants") return [null, null];
	
	string filename = buildPath("godot", "globalconstants.d");
	string ret;
	
	ret ~= "/// \n";
	ret ~= "module godot.globalconstants;\n";
	ret ~= "public import godot.globalenums;\n";
	
	foreach(const string name, const int value; c.constants)
	{
		ret ~= "enum int "~name.snakeToCamel.escapeD~" = "~text(value)~";\n";
	}

	string[2] arr = [filename, ret];
	return arr;
}

string[2] generateGlobalEnums(GodotClass c)
{
	import std.conv : text;
	import std.string;
	import std.meta;
	import std.algorithm.iteration, std.algorithm.searching, std.algorithm.sorting;
	import std.range : array;

	if(c.name.godot != "GlobalConstants") return [null, null];

	string filename = buildPath("godot", "globalenums.d");
	string ret;

	ret ~= "/// \n";
	ret ~= "module godot.globalenums;\n";

	/// Try to put at least some of these in grouped enums
	static struct Group
	{
		string name; /// The name of the new enum
		string prefix; /// The prefix to strip from original name
	}
	
	alias groups = AliasSeq!(
		Group("Key", "KEY_"),
		Group("MouseButton", "BUTTON_"),
		Group("PropertyHint", "PROPERTY_HINT_"),
		Group("PropertyUsage", "PROPERTY_USAGE_"),
		Group("Type", "TYPE_")
	);
	
	foreach(g; groups)
	{
		ret ~= "enum "~g.name~" : int\n{\n";
		
		foreach(const string name; c.constants.keys[].filter!(k => k.startsWith(g.prefix))
			.array.sort!((a,b) => c.constants[a] < c.constants[b]))
		{
			ret ~= "\t" ~ name[g.prefix.length..$].snakeToCamel.escapeD
				~ " = " ~ text(c.constants[name]) ~ ",\n";
		}
		
		ret ~= "}\n";
	}

	// Godot itself never refers to these, but some modules like Goost do.
	// Allow bindings for them to compile by keeping the original names.
	string[2][] aliases = [["KeyList", "Key"], ["PropertyUsageFlags", "PropertyUsage"], ["ButtonList", "MouseButton"]];
	foreach(a; aliases)
	{
		ret ~= "alias " ~ a[0] ~ " = " ~ a[1] ~ ";\n";
	}

	string[2] arr = [filename, ret];
	return arr;
}

 
