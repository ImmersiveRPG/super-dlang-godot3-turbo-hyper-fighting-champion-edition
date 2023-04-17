/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.audioeffectlimiter;
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
import godot.audioeffect;
import godot.resource;
/**

*/
@GodotBaseClass struct AudioEffectLimiter
{
	package(godot) enum string _GODOT_internal_name = "AudioEffectLimiter";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ AudioEffect _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_ceiling_db") GodotMethod!(double) getCeilingDb;
		@GodotName("get_soft_clip_db") GodotMethod!(double) getSoftClipDb;
		@GodotName("get_soft_clip_ratio") GodotMethod!(double) getSoftClipRatio;
		@GodotName("get_threshold_db") GodotMethod!(double) getThresholdDb;
		@GodotName("set_ceiling_db") GodotMethod!(void, double) setCeilingDb;
		@GodotName("set_soft_clip_db") GodotMethod!(void, double) setSoftClipDb;
		@GodotName("set_soft_clip_ratio") GodotMethod!(void, double) setSoftClipRatio;
		@GodotName("set_threshold_db") GodotMethod!(void, double) setThresholdDb;
	}
	/// 
	pragma(inline, true) bool opEquals(in AudioEffectLimiter other) const
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
	/// Construct a new instance of AudioEffectLimiter.
	/// Note: use `memnew!AudioEffectLimiter` instead.
	static AudioEffectLimiter _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("AudioEffectLimiter");
		if(constructor is null) return typeof(this).init;
		return cast(AudioEffectLimiter)(constructor());
	}
	/**
	
	*/
	double getCeilingDb() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getCeilingDb, _godot_object);
	}
	/**
	
	*/
	double getSoftClipDb() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSoftClipDb, _godot_object);
	}
	/**
	
	*/
	double getSoftClipRatio() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSoftClipRatio, _godot_object);
	}
	/**
	
	*/
	double getThresholdDb() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getThresholdDb, _godot_object);
	}
	/**
	
	*/
	void setCeilingDb(in double ceiling)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setCeilingDb, _godot_object, ceiling);
	}
	/**
	
	*/
	void setSoftClipDb(in double soft_clip)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSoftClipDb, _godot_object, soft_clip);
	}
	/**
	
	*/
	void setSoftClipRatio(in double soft_clip)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSoftClipRatio, _godot_object, soft_clip);
	}
	/**
	
	*/
	void setThresholdDb(in double threshold)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setThresholdDb, _godot_object, threshold);
	}
	/**
	
	*/
	@property double ceilingDb()
	{
		return getCeilingDb();
	}
	/// ditto
	@property void ceilingDb(double v)
	{
		setCeilingDb(v);
	}
	/**
	
	*/
	@property double softClipDb()
	{
		return getSoftClipDb();
	}
	/// ditto
	@property void softClipDb(double v)
	{
		setSoftClipDb(v);
	}
	/**
	
	*/
	@property double softClipRatio()
	{
		return getSoftClipRatio();
	}
	/// ditto
	@property void softClipRatio(double v)
	{
		setSoftClipRatio(v);
	}
	/**
	
	*/
	@property double thresholdDb()
	{
		return getThresholdDb();
	}
	/// ditto
	@property void thresholdDb(double v)
	{
		setThresholdDb(v);
	}
}
