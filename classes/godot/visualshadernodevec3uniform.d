/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.visualshadernodevec3uniform;
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
import godot.visualshadernodeuniform;
import godot.visualshadernode;
import godot.resource;
import godot.reference;
/**

*/
@GodotBaseClass struct VisualShaderNodeVec3Uniform
{
	package(godot) enum string _GODOT_internal_name = "VisualShaderNodeVec3Uniform";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ VisualShaderNodeUniform _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_default_value") GodotMethod!(Vector3) getDefaultValue;
		@GodotName("is_default_value_enabled") GodotMethod!(bool) isDefaultValueEnabled;
		@GodotName("set_default_value") GodotMethod!(void, Vector3) setDefaultValue;
		@GodotName("set_default_value_enabled") GodotMethod!(void, bool) setDefaultValueEnabled;
	}
	/// 
	pragma(inline, true) bool opEquals(in VisualShaderNodeVec3Uniform other) const
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
	/// Construct a new instance of VisualShaderNodeVec3Uniform.
	/// Note: use `memnew!VisualShaderNodeVec3Uniform` instead.
	static VisualShaderNodeVec3Uniform _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("VisualShaderNodeVec3Uniform");
		if(constructor is null) return typeof(this).init;
		return cast(VisualShaderNodeVec3Uniform)(constructor());
	}
	/**
	
	*/
	Vector3 getDefaultValue() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector3)(GDNativeClassBinding.getDefaultValue, _godot_object);
	}
	/**
	
	*/
	bool isDefaultValueEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isDefaultValueEnabled, _godot_object);
	}
	/**
	
	*/
	void setDefaultValue(in Vector3 value)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDefaultValue, _godot_object, value);
	}
	/**
	
	*/
	void setDefaultValueEnabled(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDefaultValueEnabled, _godot_object, enabled);
	}
	/**
	
	*/
	@property Vector3 defaultValue()
	{
		return getDefaultValue();
	}
	/// ditto
	@property void defaultValue(Vector3 v)
	{
		setDefaultValue(v);
	}
	/**
	
	*/
	@property bool defaultValueEnabled()
	{
		return isDefaultValueEnabled();
	}
	/// ditto
	@property void defaultValueEnabled(bool v)
	{
		setDefaultValueEnabled(v);
	}
}
