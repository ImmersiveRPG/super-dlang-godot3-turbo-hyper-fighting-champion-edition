/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.viewporttexture;
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
import godot.resource;
import godot.reference;
/**

*/
@GodotBaseClass struct ViewportTexture
{
	package(godot) enum string _GODOT_internal_name = "ViewportTexture";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Texture _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_viewport_path_in_scene") GodotMethod!(NodePath) getViewportPathInScene;
		@GodotName("set_viewport_path_in_scene") GodotMethod!(void, NodePath) setViewportPathInScene;
	}
	/// 
	pragma(inline, true) bool opEquals(in ViewportTexture other) const
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
	/// Construct a new instance of ViewportTexture.
	/// Note: use `memnew!ViewportTexture` instead.
	static ViewportTexture _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("ViewportTexture");
		if(constructor is null) return typeof(this).init;
		return cast(ViewportTexture)(constructor());
	}
	/**
	
	*/
	NodePath getViewportPathInScene() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(NodePath)(GDNativeClassBinding.getViewportPathInScene, _godot_object);
	}
	/**
	
	*/
	void setViewportPathInScene(NodePathArg0)(in NodePathArg0 path)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setViewportPathInScene, _godot_object, path);
	}
	/**
	
	*/
	@property NodePath viewportPath()
	{
		return getViewportPathInScene();
	}
	/// ditto
	@property void viewportPath(NodePath v)
	{
		setViewportPathInScene(v);
	}
}
