/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.thread;
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
import godot.reference;
/**

*/
@GodotBaseClass struct Thread
{
	package(godot) enum string _GODOT_internal_name = "_Thread";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Reference _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_id") GodotMethod!(String) getId;
		@GodotName("is_active") GodotMethod!(bool) isActive;
		@GodotName("is_alive") GodotMethod!(bool) isAlive;
		@GodotName("start") GodotMethod!(GodotError, GodotObject, String, Variant, long) start;
		@GodotName("wait_to_finish") GodotMethod!(Variant) waitToFinish;
	}
	/// 
	pragma(inline, true) bool opEquals(in Thread other) const
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
	/// Construct a new instance of Thread.
	/// Note: use `memnew!Thread` instead.
	static Thread _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("_Thread");
		if(constructor is null) return typeof(this).init;
		return cast(Thread)(constructor());
	}
	/// 
	enum Priority : int
	{
		/** */
		priorityLow = 0,
		/** */
		priorityNormal = 1,
		/** */
		priorityHigh = 2,
	}
	/// 
	enum Constants : int
	{
		priorityLow = 0,
		priorityNormal = 1,
		priorityHigh = 2,
	}
	/**
	
	*/
	String getId() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getId, _godot_object);
	}
	/**
	
	*/
	bool isActive() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isActive, _godot_object);
	}
	/**
	
	*/
	bool isAlive() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isAlive, _godot_object);
	}
	/**
	
	*/
	GodotError start(VariantArg2)(GodotObject instance, in String method, in VariantArg2 userdata = Variant.nil, in long priority = 1)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(GodotError)(GDNativeClassBinding.start, _godot_object, instance, method, userdata, priority);
	}
	/**
	
	*/
	Variant waitToFinish()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Variant)(GDNativeClassBinding.waitToFinish, _godot_object);
	}
}