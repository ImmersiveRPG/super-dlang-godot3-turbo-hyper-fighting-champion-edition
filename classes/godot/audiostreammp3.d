/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.audiostreammp3;
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
import godot.audiostream;
import godot.resource;
/**

*/
@GodotBaseClass struct AudioStreamMP3
{
	package(godot) enum string _GODOT_internal_name = "AudioStreamMP3";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ AudioStream _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_data") GodotMethod!(PoolByteArray) getData;
		@GodotName("get_loop_offset") GodotMethod!(double) getLoopOffset;
		@GodotName("has_loop") GodotMethod!(bool) hasLoop;
		@GodotName("set_data") GodotMethod!(void, PoolByteArray) setData;
		@GodotName("set_loop") GodotMethod!(void, bool) setLoop;
		@GodotName("set_loop_offset") GodotMethod!(void, double) setLoopOffset;
	}
	/// 
	pragma(inline, true) bool opEquals(in AudioStreamMP3 other) const
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
	/// Construct a new instance of AudioStreamMP3.
	/// Note: use `memnew!AudioStreamMP3` instead.
	static AudioStreamMP3 _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("AudioStreamMP3");
		if(constructor is null) return typeof(this).init;
		return cast(AudioStreamMP3)(constructor());
	}
	@disable new(size_t s);
	/**
	
	*/
	PoolByteArray getData() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(PoolByteArray)(GDNativeClassBinding.getData, _godot_object);
	}
	/**
	
	*/
	double getLoopOffset() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getLoopOffset, _godot_object);
	}
	/**
	
	*/
	bool hasLoop() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.hasLoop, _godot_object);
	}
	/**
	
	*/
	void setData(in PoolByteArray data)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setData, _godot_object, data);
	}
	/**
	
	*/
	void setLoop(in bool enable)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setLoop, _godot_object, enable);
	}
	/**
	
	*/
	void setLoopOffset(in double seconds)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setLoopOffset, _godot_object, seconds);
	}
	/**
	
	*/
	@property PoolByteArray data()
	{
		return getData();
	}
	/// ditto
	@property void data(PoolByteArray v)
	{
		setData(v);
	}
	/**
	
	*/
	@property bool loop()
	{
		return hasLoop();
	}
	/// ditto
	@property void loop(bool v)
	{
		setLoop(v);
	}
	/**
	
	*/
	@property double loopOffset()
	{
		return getLoopOffset();
	}
	/// ditto
	@property void loopOffset(double v)
	{
		setLoopOffset(v);
	}
}
