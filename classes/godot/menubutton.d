/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.menubutton;
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
import godot.canvasitem;
import godot.node;
import godot.inputevent;
import godot.popupmenu;
/**

*/
@GodotBaseClass struct MenuButton
{
	package(godot) enum string _GODOT_internal_name = "MenuButton";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Button _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_get_items") GodotMethod!(Array) _getItems;
		@GodotName("_set_items") GodotMethod!(void, Array) _setItems;
		@GodotName("_unhandled_key_input") GodotMethod!(void, InputEvent) _unhandledKeyInput;
		@GodotName("get_popup") GodotMethod!(PopupMenu) getPopup;
		@GodotName("is_switch_on_hover") GodotMethod!(bool) isSwitchOnHover;
		@GodotName("set_disable_shortcuts") GodotMethod!(void, bool) setDisableShortcuts;
		@GodotName("set_switch_on_hover") GodotMethod!(void, bool) setSwitchOnHover;
	}
	/// 
	pragma(inline, true) bool opEquals(in MenuButton other) const
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
	/// Construct a new instance of MenuButton.
	/// Note: use `memnew!MenuButton` instead.
	static MenuButton _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("MenuButton");
		if(constructor is null) return typeof(this).init;
		return cast(MenuButton)(constructor());
	}
	/**
	
	*/
	Array _getItems() const
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_get_items");
		return this.callv(_GODOT_method_name, _GODOT_args).as!(RefOrT!Array);
	}
	/**
	
	*/
	void _setItems(in Array arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_set_items");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _unhandledKeyInput(InputEvent arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_unhandled_key_input");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	PopupMenu getPopup() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(PopupMenu)(GDNativeClassBinding.getPopup, _godot_object);
	}
	/**
	
	*/
	bool isSwitchOnHover()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isSwitchOnHover, _godot_object);
	}
	/**
	
	*/
	void setDisableShortcuts(in bool disabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDisableShortcuts, _godot_object, disabled);
	}
	/**
	
	*/
	void setSwitchOnHover(in bool enable)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSwitchOnHover, _godot_object, enable);
	}
	/**
	
	*/
	@property Array items()
	{
		return _getItems();
	}
	/// ditto
	@property void items(Array v)
	{
		_setItems(v);
	}
	/**
	
	*/
	@property bool switchOnHover()
	{
		return isSwitchOnHover();
	}
	/// ditto
	@property void switchOnHover(bool v)
	{
		setSwitchOnHover(v);
	}
}
