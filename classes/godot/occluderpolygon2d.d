/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.occluderpolygon2d;
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
import godot.resource;
/**

*/
@GodotBaseClass struct OccluderPolygon2D
{
	package(godot) enum string _GODOT_internal_name = "OccluderPolygon2D";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Resource _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_cull_mode") GodotMethod!(OccluderPolygon2D.CullMode) getCullMode;
		@GodotName("get_polygon") GodotMethod!(PoolVector2Array) getPolygon;
		@GodotName("is_closed") GodotMethod!(bool) isClosed;
		@GodotName("set_closed") GodotMethod!(void, bool) setClosed;
		@GodotName("set_cull_mode") GodotMethod!(void, long) setCullMode;
		@GodotName("set_polygon") GodotMethod!(void, PoolVector2Array) setPolygon;
	}
	/// 
	pragma(inline, true) bool opEquals(in OccluderPolygon2D other) const
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
	/// Construct a new instance of OccluderPolygon2D.
	/// Note: use `memnew!OccluderPolygon2D` instead.
	static OccluderPolygon2D _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("OccluderPolygon2D");
		if(constructor is null) return typeof(this).init;
		return cast(OccluderPolygon2D)(constructor());
	}
	/// 
	enum CullMode : int
	{
		/** */
		cullDisabled = 0,
		/** */
		cullClockwise = 1,
		/** */
		cullCounterClockwise = 2,
	}
	/// 
	enum Constants : int
	{
		cullDisabled = 0,
		cullClockwise = 1,
		cullCounterClockwise = 2,
	}
	/**
	
	*/
	OccluderPolygon2D.CullMode getCullMode() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(OccluderPolygon2D.CullMode)(GDNativeClassBinding.getCullMode, _godot_object);
	}
	/**
	
	*/
	PoolVector2Array getPolygon() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(PoolVector2Array)(GDNativeClassBinding.getPolygon, _godot_object);
	}
	/**
	
	*/
	bool isClosed() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isClosed, _godot_object);
	}
	/**
	
	*/
	void setClosed(in bool closed)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setClosed, _godot_object, closed);
	}
	/**
	
	*/
	void setCullMode(in long cull_mode)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setCullMode, _godot_object, cull_mode);
	}
	/**
	
	*/
	void setPolygon(in PoolVector2Array polygon)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setPolygon, _godot_object, polygon);
	}
	/**
	
	*/
	@property bool closed()
	{
		return isClosed();
	}
	/// ditto
	@property void closed(bool v)
	{
		setClosed(v);
	}
	/**
	
	*/
	@property OccluderPolygon2D.CullMode cullMode()
	{
		return getCullMode();
	}
	/// ditto
	@property void cullMode(long v)
	{
		setCullMode(v);
	}
	/**
	
	*/
	@property PoolVector2Array polygon()
	{
		return getPolygon();
	}
	/// ditto
	@property void polygon(PoolVector2Array v)
	{
		setPolygon(v);
	}
}
