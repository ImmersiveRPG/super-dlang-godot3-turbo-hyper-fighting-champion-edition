/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.atlastexture;
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
import godot.texture;
/**

*/
@GodotBaseClass struct AtlasTexture
{
	package(godot) enum string _GODOT_internal_name = "AtlasTexture";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Texture _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_atlas") GodotMethod!(Texture) getAtlas;
		@GodotName("get_margin") GodotMethod!(Rect2) getMargin;
		@GodotName("get_region") GodotMethod!(Rect2) getRegion;
		@GodotName("has_filter_clip") GodotMethod!(bool) hasFilterClip;
		@GodotName("set_atlas") GodotMethod!(void, Texture) setAtlas;
		@GodotName("set_filter_clip") GodotMethod!(void, bool) setFilterClip;
		@GodotName("set_margin") GodotMethod!(void, Rect2) setMargin;
		@GodotName("set_region") GodotMethod!(void, Rect2) setRegion;
	}
	/// 
	pragma(inline, true) bool opEquals(in AtlasTexture other) const
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
	/// Construct a new instance of AtlasTexture.
	/// Note: use `memnew!AtlasTexture` instead.
	static AtlasTexture _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("AtlasTexture");
		if(constructor is null) return typeof(this).init;
		return cast(AtlasTexture)(constructor());
	}
	/**
	
	*/
	Ref!Texture getAtlas() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Texture)(GDNativeClassBinding.getAtlas, _godot_object);
	}
	/**
	
	*/
	Rect2 getMargin() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Rect2)(GDNativeClassBinding.getMargin, _godot_object);
	}
	/**
	
	*/
	Rect2 getRegion() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Rect2)(GDNativeClassBinding.getRegion, _godot_object);
	}
	/**
	
	*/
	bool hasFilterClip() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.hasFilterClip, _godot_object);
	}
	/**
	
	*/
	void setAtlas(Texture atlas)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setAtlas, _godot_object, atlas);
	}
	/**
	
	*/
	void setFilterClip(in bool enable)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFilterClip, _godot_object, enable);
	}
	/**
	
	*/
	void setMargin(in Rect2 margin)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setMargin, _godot_object, margin);
	}
	/**
	
	*/
	void setRegion(in Rect2 region)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setRegion, _godot_object, region);
	}
	/**
	
	*/
	@property Texture atlas()
	{
		return getAtlas();
	}
	/// ditto
	@property void atlas(Texture v)
	{
		setAtlas(v);
	}
	/**
	
	*/
	@property bool filterClip()
	{
		return hasFilterClip();
	}
	/// ditto
	@property void filterClip(bool v)
	{
		setFilterClip(v);
	}
	/**
	
	*/
	@property Rect2 margin()
	{
		return getMargin();
	}
	/// ditto
	@property void margin(Rect2 v)
	{
		setMargin(v);
	}
	/**
	
	*/
	@property Rect2 region()
	{
		return getRegion();
	}
	/// ditto
	@property void region(Rect2 v)
	{
		setRegion(v);
	}
}
