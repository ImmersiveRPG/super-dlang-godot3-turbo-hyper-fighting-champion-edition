/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.parallaxbackground;
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
import godot.canvaslayer;
import godot.node;
/**

*/
@GodotBaseClass struct ParallaxBackground
{
	package(godot) enum string _GODOT_internal_name = "ParallaxBackground";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ CanvasLayer _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_camera_moved") GodotMethod!(void, Transform2D, Vector2) _cameraMoved;
		@GodotName("get_limit_begin") GodotMethod!(Vector2) getLimitBegin;
		@GodotName("get_limit_end") GodotMethod!(Vector2) getLimitEnd;
		@GodotName("get_scroll_base_offset") GodotMethod!(Vector2) getScrollBaseOffset;
		@GodotName("get_scroll_base_scale") GodotMethod!(Vector2) getScrollBaseScale;
		@GodotName("get_scroll_offset") GodotMethod!(Vector2) getScrollOffset;
		@GodotName("is_ignore_camera_zoom") GodotMethod!(bool) isIgnoreCameraZoom;
		@GodotName("set_ignore_camera_zoom") GodotMethod!(void, bool) setIgnoreCameraZoom;
		@GodotName("set_limit_begin") GodotMethod!(void, Vector2) setLimitBegin;
		@GodotName("set_limit_end") GodotMethod!(void, Vector2) setLimitEnd;
		@GodotName("set_scroll_base_offset") GodotMethod!(void, Vector2) setScrollBaseOffset;
		@GodotName("set_scroll_base_scale") GodotMethod!(void, Vector2) setScrollBaseScale;
		@GodotName("set_scroll_offset") GodotMethod!(void, Vector2) setScrollOffset;
	}
	/// 
	pragma(inline, true) bool opEquals(in ParallaxBackground other) const
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
	/// Construct a new instance of ParallaxBackground.
	/// Note: use `memnew!ParallaxBackground` instead.
	static ParallaxBackground _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("ParallaxBackground");
		if(constructor is null) return typeof(this).init;
		return cast(ParallaxBackground)(constructor());
	}
	/**
	
	*/
	void _cameraMoved(in Transform2D arg0, in Vector2 arg1)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		_GODOT_args.append(arg1);
		String _GODOT_method_name = String("_camera_moved");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	Vector2 getLimitBegin() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getLimitBegin, _godot_object);
	}
	/**
	
	*/
	Vector2 getLimitEnd() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getLimitEnd, _godot_object);
	}
	/**
	
	*/
	Vector2 getScrollBaseOffset() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getScrollBaseOffset, _godot_object);
	}
	/**
	
	*/
	Vector2 getScrollBaseScale() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getScrollBaseScale, _godot_object);
	}
	/**
	
	*/
	Vector2 getScrollOffset() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getScrollOffset, _godot_object);
	}
	/**
	
	*/
	bool isIgnoreCameraZoom()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isIgnoreCameraZoom, _godot_object);
	}
	/**
	
	*/
	void setIgnoreCameraZoom(in bool ignore)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setIgnoreCameraZoom, _godot_object, ignore);
	}
	/**
	
	*/
	void setLimitBegin(in Vector2 ofs)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setLimitBegin, _godot_object, ofs);
	}
	/**
	
	*/
	void setLimitEnd(in Vector2 ofs)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setLimitEnd, _godot_object, ofs);
	}
	/**
	
	*/
	void setScrollBaseOffset(in Vector2 ofs)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setScrollBaseOffset, _godot_object, ofs);
	}
	/**
	
	*/
	void setScrollBaseScale(in Vector2 scale)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setScrollBaseScale, _godot_object, scale);
	}
	/**
	
	*/
	void setScrollOffset(in Vector2 ofs)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setScrollOffset, _godot_object, ofs);
	}
	/**
	
	*/
	@property Vector2 scrollBaseOffset()
	{
		return getScrollBaseOffset();
	}
	/// ditto
	@property void scrollBaseOffset(Vector2 v)
	{
		setScrollBaseOffset(v);
	}
	/**
	
	*/
	@property Vector2 scrollBaseScale()
	{
		return getScrollBaseScale();
	}
	/// ditto
	@property void scrollBaseScale(Vector2 v)
	{
		setScrollBaseScale(v);
	}
	/**
	
	*/
	@property bool scrollIgnoreCameraZoom()
	{
		return isIgnoreCameraZoom();
	}
	/// ditto
	@property void scrollIgnoreCameraZoom(bool v)
	{
		setIgnoreCameraZoom(v);
	}
	/**
	
	*/
	@property Vector2 scrollLimitBegin()
	{
		return getLimitBegin();
	}
	/// ditto
	@property void scrollLimitBegin(Vector2 v)
	{
		setLimitBegin(v);
	}
	/**
	
	*/
	@property Vector2 scrollLimitEnd()
	{
		return getLimitEnd();
	}
	/// ditto
	@property void scrollLimitEnd(Vector2 v)
	{
		setLimitEnd(v);
	}
	/**
	
	*/
	@property Vector2 scrollOffset()
	{
		return getScrollOffset();
	}
	/// ditto
	@property void scrollOffset(Vector2 v)
	{
		setScrollOffset(v);
	}
}
