/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.opensimplexnoise;
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
import godot.image;
/**

*/
@GodotBaseClass struct OpenSimplexNoise
{
	package(godot) enum string _GODOT_internal_name = "OpenSimplexNoise";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Resource _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_image") GodotMethod!(Image, long, long, Vector2) getImage;
		@GodotName("get_lacunarity") GodotMethod!(double) getLacunarity;
		@GodotName("get_noise_1d") GodotMethod!(double, double) getNoise1d;
		@GodotName("get_noise_2d") GodotMethod!(double, double, double) getNoise2d;
		@GodotName("get_noise_2dv") GodotMethod!(double, Vector2) getNoise2dv;
		@GodotName("get_noise_3d") GodotMethod!(double, double, double, double) getNoise3d;
		@GodotName("get_noise_3dv") GodotMethod!(double, Vector3) getNoise3dv;
		@GodotName("get_noise_4d") GodotMethod!(double, double, double, double, double) getNoise4d;
		@GodotName("get_octaves") GodotMethod!(long) getOctaves;
		@GodotName("get_period") GodotMethod!(double) getPeriod;
		@GodotName("get_persistence") GodotMethod!(double) getPersistence;
		@GodotName("get_seamless_image") GodotMethod!(Image, long) getSeamlessImage;
		@GodotName("get_seed") GodotMethod!(long) getSeed;
		@GodotName("set_lacunarity") GodotMethod!(void, double) setLacunarity;
		@GodotName("set_octaves") GodotMethod!(void, long) setOctaves;
		@GodotName("set_period") GodotMethod!(void, double) setPeriod;
		@GodotName("set_persistence") GodotMethod!(void, double) setPersistence;
		@GodotName("set_seed") GodotMethod!(void, long) setSeed;
	}
	/// 
	pragma(inline, true) bool opEquals(in OpenSimplexNoise other) const
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
	/// Construct a new instance of OpenSimplexNoise.
	/// Note: use `memnew!OpenSimplexNoise` instead.
	static OpenSimplexNoise _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("OpenSimplexNoise");
		if(constructor is null) return typeof(this).init;
		return cast(OpenSimplexNoise)(constructor());
	}
	/**
	
	*/
	Ref!Image getImage(in long width, in long height, in Vector2 noise_offset = Vector2(0, 0)) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Image)(GDNativeClassBinding.getImage, _godot_object, width, height, noise_offset);
	}
	/**
	
	*/
	double getLacunarity() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getLacunarity, _godot_object);
	}
	/**
	
	*/
	double getNoise1d(in double x) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getNoise1d, _godot_object, x);
	}
	/**
	
	*/
	double getNoise2d(in double x, in double y) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getNoise2d, _godot_object, x, y);
	}
	/**
	
	*/
	double getNoise2dv(in Vector2 pos) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getNoise2dv, _godot_object, pos);
	}
	/**
	
	*/
	double getNoise3d(in double x, in double y, in double z) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getNoise3d, _godot_object, x, y, z);
	}
	/**
	
	*/
	double getNoise3dv(in Vector3 pos) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getNoise3dv, _godot_object, pos);
	}
	/**
	
	*/
	double getNoise4d(in double x, in double y, in double z, in double w) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getNoise4d, _godot_object, x, y, z, w);
	}
	/**
	
	*/
	long getOctaves() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getOctaves, _godot_object);
	}
	/**
	
	*/
	double getPeriod() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getPeriod, _godot_object);
	}
	/**
	
	*/
	double getPersistence() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getPersistence, _godot_object);
	}
	/**
	
	*/
	Ref!Image getSeamlessImage(in long size) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Image)(GDNativeClassBinding.getSeamlessImage, _godot_object, size);
	}
	/**
	
	*/
	long getSeed() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getSeed, _godot_object);
	}
	/**
	
	*/
	void setLacunarity(in double lacunarity)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setLacunarity, _godot_object, lacunarity);
	}
	/**
	
	*/
	void setOctaves(in long octave_count)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setOctaves, _godot_object, octave_count);
	}
	/**
	
	*/
	void setPeriod(in double period)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setPeriod, _godot_object, period);
	}
	/**
	
	*/
	void setPersistence(in double persistence)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setPersistence, _godot_object, persistence);
	}
	/**
	
	*/
	void setSeed(in long seed)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSeed, _godot_object, seed);
	}
	/**
	
	*/
	@property double lacunarity()
	{
		return getLacunarity();
	}
	/// ditto
	@property void lacunarity(double v)
	{
		setLacunarity(v);
	}
	/**
	
	*/
	@property long octaves()
	{
		return getOctaves();
	}
	/// ditto
	@property void octaves(long v)
	{
		setOctaves(v);
	}
	/**
	
	*/
	@property double period()
	{
		return getPeriod();
	}
	/// ditto
	@property void period(double v)
	{
		setPeriod(v);
	}
	/**
	
	*/
	@property double persistence()
	{
		return getPersistence();
	}
	/// ditto
	@property void persistence(double v)
	{
		setPersistence(v);
	}
	/**
	
	*/
	@property long seed()
	{
		return getSeed();
	}
	/// ditto
	@property void seed(long v)
	{
		setSeed(v);
	}
}
