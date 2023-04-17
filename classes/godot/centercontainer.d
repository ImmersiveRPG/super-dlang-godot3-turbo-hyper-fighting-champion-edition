/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.centercontainer;
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
import godot.container;
/**

*/
@GodotBaseClass struct CenterContainer
{
	package(godot) enum string _GODOT_internal_name = "CenterContainer";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Container _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("is_using_top_left") GodotMethod!(bool) isUsingTopLeft;
		@GodotName("set_use_top_left") GodotMethod!(void, bool) setUseTopLeft;
	}
	/// 
	pragma(inline, true) bool opEquals(in CenterContainer other) const
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
	/// Construct a new instance of CenterContainer.
	/// Note: use `memnew!CenterContainer` instead.
	static CenterContainer _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("CenterContainer");
		if(constructor is null) return typeof(this).init;
		return cast(CenterContainer)(constructor());
	}
	/**
	
	*/
	bool isUsingTopLeft() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isUsingTopLeft, _godot_object);
	}
	/**
	
	*/
	void setUseTopLeft(in bool enable)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setUseTopLeft, _godot_object, enable);
	}
	/**
	
	*/
	@property bool useTopLeft()
	{
		return isUsingTopLeft();
	}
	/// ditto
	@property void useTopLeft(bool v)
	{
		setUseTopLeft(v);
	}
}
