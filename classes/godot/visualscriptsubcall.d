/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.visualscriptsubcall;
import std.meta : AliasSeq, staticIndexOf;
import std.traits : Unqual;
import godot.d.traits;
import godot.core;
import godot.c;
import godot.d.bind;
import godot.d.reference;
import godot.globalenums;
import godot.object;
import godot.classdb;
import godot.visualscriptnode;
import godot.resource;
import godot.reference;
/**

*/
@GodotBaseClass struct VisualScriptSubCall
{
	package(godot) enum string _GODOT_internal_name = "VisualScriptSubCall";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ VisualScriptNode _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_subcall") GodotMethod!(Variant, Variant) _subcall;
	}
	/// 
	pragma(inline, true) bool opEquals(in VisualScriptSubCall other) const
	{ return _godot_object.ptr is other._godot_object.ptr; }
	/// 
	pragma(inline, true) typeof(null) opAssign(typeof(null) n)
	{ _godot_object.ptr = n; return null; }
	/// 
	pragma(inline, true) bool opEquals(typeof(null) n) const
	{ return _godot_object.ptr is n; }
	/// 
	size_t toHash() const @trusted { return cast(size_t)_godot_object.ptr; }
	mixin baseCasts;
	/// Construct a new instance of VisualScriptSubCall.
	/// Note: use `memnew!VisualScriptSubCall` instead.
	static VisualScriptSubCall _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("VisualScriptSubCall");
		if(constructor is null) return typeof(this).init;
		return cast(VisualScriptSubCall)(constructor());
	}
	/**
	
	*/
	Variant _subcall(VariantArg0)(in VariantArg0 arguments)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arguments);
		String _GODOT_method_name = String("_subcall");
		return this.callv(_GODOT_method_name, _GODOT_args);
	}
}