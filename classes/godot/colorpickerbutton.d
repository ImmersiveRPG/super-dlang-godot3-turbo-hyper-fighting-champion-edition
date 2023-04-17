/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.colorpickerbutton;
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
import godot.button;
import godot.basebutton;
import godot.control;
import godot.colorpicker;
import godot.popuppanel;
/**

*/
@GodotBaseClass struct ColorPickerButton
{
	package(godot) enum string _GODOT_internal_name = "ColorPickerButton";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Button _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_about_to_show") GodotMethod!(void) _aboutToShow;
		@GodotName("_color_changed") GodotMethod!(void, Color) _colorChanged;
		@GodotName("_modal_closed") GodotMethod!(void) _modalClosed;
		@GodotName("get_pick_color") GodotMethod!(Color) getPickColor;
		@GodotName("get_picker") GodotMethod!(ColorPicker) getPicker;
		@GodotName("get_popup") GodotMethod!(PopupPanel) getPopup;
		@GodotName("is_editing_alpha") GodotMethod!(bool) isEditingAlpha;
		@GodotName("set_edit_alpha") GodotMethod!(void, bool) setEditAlpha;
		@GodotName("set_pick_color") GodotMethod!(void, Color) setPickColor;
	}
	/// 
	pragma(inline, true) bool opEquals(in ColorPickerButton other) const
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
	/// Construct a new instance of ColorPickerButton.
	/// Note: use `memnew!ColorPickerButton` instead.
	static ColorPickerButton _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("ColorPickerButton");
		if(constructor is null) return typeof(this).init;
		return cast(ColorPickerButton)(constructor());
	}
	/**
	
	*/
	void _aboutToShow()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_about_to_show");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _colorChanged(in Color arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_color_changed");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _modalClosed()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_modal_closed");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	Color getPickColor() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Color)(GDNativeClassBinding.getPickColor, _godot_object);
	}
	/**
	
	*/
	ColorPicker getPicker()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(ColorPicker)(GDNativeClassBinding.getPicker, _godot_object);
	}
	/**
	
	*/
	PopupPanel getPopup()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(PopupPanel)(GDNativeClassBinding.getPopup, _godot_object);
	}
	/**
	
	*/
	bool isEditingAlpha() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isEditingAlpha, _godot_object);
	}
	/**
	
	*/
	void setEditAlpha(in bool show)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setEditAlpha, _godot_object, show);
	}
	/**
	
	*/
	void setPickColor(in Color color)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setPickColor, _godot_object, color);
	}
	/**
	
	*/
	@property Color color()
	{
		return getPickColor();
	}
	/// ditto
	@property void color(Color v)
	{
		setPickColor(v);
	}
	/**
	
	*/
	@property bool editAlpha()
	{
		return isEditingAlpha();
	}
	/// ditto
	@property void editAlpha(bool v)
	{
		setEditAlpha(v);
	}
}
