/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.segmentshape2d;
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
import godot.shape2d;
/**

*/
@GodotBaseClass struct SegmentShape2D
{
	package(godot) enum string _GODOT_internal_name = "SegmentShape2D";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Shape2D _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_a") GodotMethod!(Vector2) getA;
		@GodotName("get_b") GodotMethod!(Vector2) getB;
		@GodotName("set_a") GodotMethod!(void, Vector2) setA;
		@GodotName("set_b") GodotMethod!(void, Vector2) setB;
	}
	/// 
	pragma(inline, true) bool opEquals(in SegmentShape2D other) const
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
	/// Construct a new instance of SegmentShape2D.
	/// Note: use `memnew!SegmentShape2D` instead.
	static SegmentShape2D _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("SegmentShape2D");
		if(constructor is null) return typeof(this).init;
		return cast(SegmentShape2D)(constructor());
	}
	/**
	
	*/
	Vector2 getA() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getA, _godot_object);
	}
	/**
	
	*/
	Vector2 getB() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getB, _godot_object);
	}
	/**
	
	*/
	void setA(in Vector2 a)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setA, _godot_object, a);
	}
	/**
	
	*/
	void setB(in Vector2 b)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setB, _godot_object, b);
	}
	/**
	
	*/
	@property Vector2 a()
	{
		return getA();
	}
	/// ditto
	@property void a(Vector2 v)
	{
		setA(v);
	}
	/**
	
	*/
	@property Vector2 b()
	{
		return getB();
	}
	/// ditto
	@property void b(Vector2 v)
	{
		setB(v);
	}
}
