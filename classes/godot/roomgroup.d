/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.roomgroup;
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
@GodotBaseClass struct RoomGroup
{
	package(godot) enum string _GODOT_internal_name = "RoomGroup";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Spatial _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_roomgroup_priority") GodotMethod!(long) getRoomgroupPriority;
		@GodotName("set_roomgroup_priority") GodotMethod!(void, long) setRoomgroupPriority;
	}
	/// 
	pragma(inline, true) bool opEquals(in RoomGroup other) const
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
	/// Construct a new instance of RoomGroup.
	/// Note: use `memnew!RoomGroup` instead.
	static RoomGroup _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("RoomGroup");
		if(constructor is null) return typeof(this).init;
		return cast(RoomGroup)(constructor());
	}
	/**
	
	*/
	long getRoomgroupPriority() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getRoomgroupPriority, _godot_object);
	}
	/**
	
	*/
	void setRoomgroupPriority(in long p_priority)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setRoomgroupPriority, _godot_object, p_priority);
	}
	/**
	
	*/
	@property long roomgroupPriority()
	{
		return getRoomgroupPriority();
	}
	/// ditto
	@property void roomgroupPriority(long v)
	{
		setRoomgroupPriority(v);
	}
}
