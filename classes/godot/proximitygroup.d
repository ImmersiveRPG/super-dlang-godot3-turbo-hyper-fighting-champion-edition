/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.proximitygroup;
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
import godot.spatial;
/**

*/
@GodotBaseClass struct ProximityGroup
{
	package(godot) enum string _GODOT_internal_name = "ProximityGroup";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Spatial _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_proximity_group_broadcast") GodotMethod!(void, String, Variant) _proximityGroupBroadcast;
		@GodotName("broadcast") GodotMethod!(void, String, Variant) broadcast;
		@GodotName("get_dispatch_mode") GodotMethod!(ProximityGroup.DispatchMode) getDispatchMode;
		@GodotName("get_grid_radius") GodotMethod!(Vector3) getGridRadius;
		@GodotName("get_group_name") GodotMethod!(String) getGroupName;
		@GodotName("set_dispatch_mode") GodotMethod!(void, long) setDispatchMode;
		@GodotName("set_grid_radius") GodotMethod!(void, Vector3) setGridRadius;
		@GodotName("set_group_name") GodotMethod!(void, String) setGroupName;
	}
	/// 
	pragma(inline, true) bool opEquals(in ProximityGroup other) const
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
	/// Construct a new instance of ProximityGroup.
	/// Note: use `memnew!ProximityGroup` instead.
	static ProximityGroup _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("ProximityGroup");
		if(constructor is null) return typeof(this).init;
		return cast(ProximityGroup)(constructor());
	}
	/// 
	enum DispatchMode : int
	{
		/** */
		modeProxy = 0,
		/** */
		modeSignal = 1,
	}
	/// 
	enum Constants : int
	{
		modeProxy = 0,
		modeSignal = 1,
	}
	/**
	
	*/
	void _proximityGroupBroadcast(VariantArg1)(in String method, in VariantArg1 parameters)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(method);
		_GODOT_args.append(parameters);
		String _GODOT_method_name = String("_proximity_group_broadcast");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void broadcast(VariantArg1)(in String method, in VariantArg1 parameters)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.broadcast, _godot_object, method, parameters);
	}
	/**
	
	*/
	ProximityGroup.DispatchMode getDispatchMode() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(ProximityGroup.DispatchMode)(GDNativeClassBinding.getDispatchMode, _godot_object);
	}
	/**
	
	*/
	Vector3 getGridRadius() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector3)(GDNativeClassBinding.getGridRadius, _godot_object);
	}
	/**
	
	*/
	String getGroupName() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getGroupName, _godot_object);
	}
	/**
	
	*/
	void setDispatchMode(in long mode)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDispatchMode, _godot_object, mode);
	}
	/**
	
	*/
	void setGridRadius(in Vector3 radius)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setGridRadius, _godot_object, radius);
	}
	/**
	
	*/
	void setGroupName(in String name)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setGroupName, _godot_object, name);
	}
	/**
	
	*/
	@property ProximityGroup.DispatchMode dispatchMode()
	{
		return getDispatchMode();
	}
	/// ditto
	@property void dispatchMode(long v)
	{
		setDispatchMode(v);
	}
	/**
	
	*/
	@property Vector3 gridRadius()
	{
		return getGridRadius();
	}
	/// ditto
	@property void gridRadius(Vector3 v)
	{
		setGridRadius(v);
	}
	/**
	
	*/
	@property String groupName()
	{
		return getGroupName();
	}
	/// ditto
	@property void groupName(String v)
	{
		setGroupName(v);
	}
}
