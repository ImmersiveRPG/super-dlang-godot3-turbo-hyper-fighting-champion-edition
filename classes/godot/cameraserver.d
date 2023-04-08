/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.cameraserver;
import std.meta : AliasSeq, staticIndexOf;
import std.traits : Unqual;
import godot.d.traits;
import godot.core;
import godot.c;
import godot.d.bind;
import godot.d.reference;
import godot.globalenums;
import godot.object;
import godot.camerafeed;
/**

*/
@GodotBaseClass struct CameraServerSingleton
{
	package(godot) enum string _GODOT_internal_name = "CameraServer";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ GodotObject _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		godot_object _singleton;
		immutable char* _singletonName = "CameraServer";
		@GodotName("add_feed") GodotMethod!(void, CameraFeed) addFeed;
		@GodotName("feeds") GodotMethod!(Array) feeds;
		@GodotName("get_feed") GodotMethod!(CameraFeed, long) getFeed;
		@GodotName("get_feed_count") GodotMethod!(long) getFeedCount;
		@GodotName("remove_feed") GodotMethod!(void, CameraFeed) removeFeed;
	}
	/// 
	pragma(inline, true) bool opEquals(in CameraServerSingleton other) const
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
	/// Construct a new instance of CameraServerSingleton.
	/// Note: use `memnew!CameraServerSingleton` instead.
	static CameraServerSingleton _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("CameraServer");
		if(constructor is null) return typeof(this).init;
		return cast(CameraServerSingleton)(constructor());
	}
	@disable new(size_t s);
	/// 
	enum FeedImage : int
	{
		/** */
		feedRgbaImage = 0,
		/** */
		feedYcbcrImage = 0,
		/** */
		feedYImage = 0,
		/** */
		feedCbcrImage = 1,
	}
	/// 
	enum Constants : int
	{
		feedRgbaImage = 0,
		feedYcbcrImage = 0,
		feedYImage = 0,
		feedCbcrImage = 1,
	}
	/**
	
	*/
	void addFeed(CameraFeed feed)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.addFeed, _godot_object, feed);
	}
	/**
	
	*/
	Array feeds()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Array)(GDNativeClassBinding.feeds, _godot_object);
	}
	/**
	
	*/
	Ref!CameraFeed getFeed(in long index)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(CameraFeed)(GDNativeClassBinding.getFeed, _godot_object, index);
	}
	/**
	
	*/
	long getFeedCount()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getFeedCount, _godot_object);
	}
	/**
	
	*/
	void removeFeed(CameraFeed feed)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.removeFeed, _godot_object, feed);
	}
}
/// Returns: the CameraServerSingleton
@property @nogc nothrow pragma(inline, true)
CameraServerSingleton CameraServer()
{
	checkClassBinding!CameraServerSingleton();
	return CameraServerSingleton(CameraServerSingleton.GDNativeClassBinding._singleton);
}
