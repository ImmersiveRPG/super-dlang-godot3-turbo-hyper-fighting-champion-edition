/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.inputeventjoypadmotion;
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
import godot.inputevent;
import godot.resource;
/**

*/
@GodotBaseClass struct InputEventJoypadMotion
{
	package(godot) enum string _GODOT_internal_name = "InputEventJoypadMotion";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ InputEvent _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_axis") GodotMethod!(long) getAxis;
		@GodotName("get_axis_value") GodotMethod!(double) getAxisValue;
		@GodotName("set_axis") GodotMethod!(void, long) setAxis;
		@GodotName("set_axis_value") GodotMethod!(void, double) setAxisValue;
	}
	/// 
	pragma(inline, true) bool opEquals(in InputEventJoypadMotion other) const
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
	/// Construct a new instance of InputEventJoypadMotion.
	/// Note: use `memnew!InputEventJoypadMotion` instead.
	static InputEventJoypadMotion _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("InputEventJoypadMotion");
		if(constructor is null) return typeof(this).init;
		return cast(InputEventJoypadMotion)(constructor());
	}
	/**
	
	*/
	long getAxis() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getAxis, _godot_object);
	}
	/**
	
	*/
	double getAxisValue() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getAxisValue, _godot_object);
	}
	/**
	
	*/
	void setAxis(in long axis)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setAxis, _godot_object, axis);
	}
	/**
	
	*/
	void setAxisValue(in double axis_value)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setAxisValue, _godot_object, axis_value);
	}
	/**
	
	*/
	@property long axis()
	{
		return getAxis();
	}
	/// ditto
	@property void axis(long v)
	{
		setAxis(v);
	}
	/**
	
	*/
	@property double axisValue()
	{
		return getAxisValue();
	}
	/// ditto
	@property void axisValue(double v)
	{
		setAxisValue(v);
	}
}
