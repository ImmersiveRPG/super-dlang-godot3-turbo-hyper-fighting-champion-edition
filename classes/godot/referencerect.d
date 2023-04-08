/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.referencerect;
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
import godot.control;
import godot.canvasitem;
import godot.node;
/**

*/
@GodotBaseClass struct ReferenceRect
{
	package(godot) enum string _GODOT_internal_name = "ReferenceRect";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Control _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_border_color") GodotMethod!(Color) getBorderColor;
		@GodotName("get_border_width") GodotMethod!(double) getBorderWidth;
		@GodotName("get_editor_only") GodotMethod!(bool) getEditorOnly;
		@GodotName("set_border_color") GodotMethod!(void, Color) setBorderColor;
		@GodotName("set_border_width") GodotMethod!(void, double) setBorderWidth;
		@GodotName("set_editor_only") GodotMethod!(void, bool) setEditorOnly;
	}
	/// 
	pragma(inline, true) bool opEquals(in ReferenceRect other) const
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
	/// Construct a new instance of ReferenceRect.
	/// Note: use `memnew!ReferenceRect` instead.
	static ReferenceRect _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("ReferenceRect");
		if(constructor is null) return typeof(this).init;
		return cast(ReferenceRect)(constructor());
	}
	/**
	
	*/
	Color getBorderColor() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Color)(GDNativeClassBinding.getBorderColor, _godot_object);
	}
	/**
	
	*/
	double getBorderWidth() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getBorderWidth, _godot_object);
	}
	/**
	
	*/
	bool getEditorOnly() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.getEditorOnly, _godot_object);
	}
	/**
	
	*/
	void setBorderColor(in Color color)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setBorderColor, _godot_object, color);
	}
	/**
	
	*/
	void setBorderWidth(in double width)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setBorderWidth, _godot_object, width);
	}
	/**
	
	*/
	void setEditorOnly(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setEditorOnly, _godot_object, enabled);
	}
	/**
	
	*/
	@property Color borderColor()
	{
		return getBorderColor();
	}
	/// ditto
	@property void borderColor(Color v)
	{
		setBorderColor(v);
	}
	/**
	
	*/
	@property double borderWidth()
	{
		return getBorderWidth();
	}
	/// ditto
	@property void borderWidth(double v)
	{
		setBorderWidth(v);
	}
	/**
	
	*/
	@property bool editorOnly()
	{
		return getEditorOnly();
	}
	/// ditto
	@property void editorOnly(bool v)
	{
		setEditorOnly(v);
	}
}
