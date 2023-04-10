/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.optionbutton;
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
import godot.texture;
import godot.popupmenu;
/**

*/
@GodotBaseClass struct OptionButton
{
	package(godot) enum string _GODOT_internal_name = "OptionButton";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Button _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_focused") GodotMethod!(void, long) _focused;
		@GodotName("_get_items") GodotMethod!(Array) _getItems;
		@GodotName("_select_int") GodotMethod!(void, long) _selectInt;
		@GodotName("_selected") GodotMethod!(void, long) _selected;
		@GodotName("_set_items") GodotMethod!(void, Array) _setItems;
		@GodotName("add_icon_item") GodotMethod!(void, Texture, String, long) addIconItem;
		@GodotName("add_item") GodotMethod!(void, String, long) addItem;
		@GodotName("add_separator") GodotMethod!(void) addSeparator;
		@GodotName("clear") GodotMethod!(void) clear;
		@GodotName("get_item_count") GodotMethod!(long) getItemCount;
		@GodotName("get_item_icon") GodotMethod!(Texture, long) getItemIcon;
		@GodotName("get_item_id") GodotMethod!(long, long) getItemId;
		@GodotName("get_item_index") GodotMethod!(long, long) getItemIndex;
		@GodotName("get_item_metadata") GodotMethod!(Variant, long) getItemMetadata;
		@GodotName("get_item_text") GodotMethod!(String, long) getItemText;
		@GodotName("get_item_tooltip") GodotMethod!(String, long) getItemTooltip;
		@GodotName("get_popup") GodotMethod!(PopupMenu) getPopup;
		@GodotName("get_selected") GodotMethod!(long) getSelected;
		@GodotName("get_selected_id") GodotMethod!(long) getSelectedId;
		@GodotName("get_selected_metadata") GodotMethod!(Variant) getSelectedMetadata;
		@GodotName("is_item_disabled") GodotMethod!(bool, long) isItemDisabled;
		@GodotName("remove_item") GodotMethod!(void, long) removeItem;
		@GodotName("select") GodotMethod!(void, long) select;
		@GodotName("set_item_disabled") GodotMethod!(void, long, bool) setItemDisabled;
		@GodotName("set_item_icon") GodotMethod!(void, long, Texture) setItemIcon;
		@GodotName("set_item_id") GodotMethod!(void, long, long) setItemId;
		@GodotName("set_item_metadata") GodotMethod!(void, long, Variant) setItemMetadata;
		@GodotName("set_item_text") GodotMethod!(void, long, String) setItemText;
		@GodotName("set_item_tooltip") GodotMethod!(void, long, String) setItemTooltip;
	}
	/// 
	pragma(inline, true) bool opEquals(in OptionButton other) const
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
	/// Construct a new instance of OptionButton.
	/// Note: use `memnew!OptionButton` instead.
	static OptionButton _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("OptionButton");
		if(constructor is null) return typeof(this).init;
		return cast(OptionButton)(constructor());
	}
	/**
	
	*/
	void _focused(in long arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_focused");
		this.callv(_GODOT_method_name, _GODOT_args);
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
	void _selectInt(in long arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_select_int");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _selected(in long arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_selected");
		this.callv(_GODOT_method_name, _GODOT_args);
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
	void addIconItem(Texture texture, in String label, in long id = -1)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.addIconItem, _godot_object, texture, label, id);
	}
	/**
	
	*/
	void addItem(in String label, in long id = -1)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.addItem, _godot_object, label, id);
	}
	/**
	
	*/
	void addSeparator()
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.addSeparator, _godot_object);
	}
	/**
	
	*/
	void clear()
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.clear, _godot_object);
	}
	/**
	
	*/
	long getItemCount() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getItemCount, _godot_object);
	}
	/**
	
	*/
	Ref!Texture getItemIcon(in long idx) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Texture)(GDNativeClassBinding.getItemIcon, _godot_object, idx);
	}
	/**
	
	*/
	long getItemId(in long idx) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getItemId, _godot_object, idx);
	}
	/**
	
	*/
	long getItemIndex(in long id) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getItemIndex, _godot_object, id);
	}
	/**
	
	*/
	Variant getItemMetadata(in long idx) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Variant)(GDNativeClassBinding.getItemMetadata, _godot_object, idx);
	}
	/**
	
	*/
	String getItemText(in long idx) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getItemText, _godot_object, idx);
	}
	/**
	
	*/
	String getItemTooltip(in long idx) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getItemTooltip, _godot_object, idx);
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
	long getSelected() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getSelected, _godot_object);
	}
	/**
	
	*/
	long getSelectedId() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getSelectedId, _godot_object);
	}
	/**
	
	*/
	Variant getSelectedMetadata() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Variant)(GDNativeClassBinding.getSelectedMetadata, _godot_object);
	}
	/**
	
	*/
	bool isItemDisabled(in long idx) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isItemDisabled, _godot_object, idx);
	}
	/**
	
	*/
	void removeItem(in long idx)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.removeItem, _godot_object, idx);
	}
	/**
	
	*/
	void select(in long idx)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.select, _godot_object, idx);
	}
	/**
	
	*/
	void setItemDisabled(in long idx, in bool disabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setItemDisabled, _godot_object, idx, disabled);
	}
	/**
	
	*/
	void setItemIcon(in long idx, Texture texture)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setItemIcon, _godot_object, idx, texture);
	}
	/**
	
	*/
	void setItemId(in long idx, in long id)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setItemId, _godot_object, idx, id);
	}
	/**
	
	*/
	void setItemMetadata(VariantArg1)(in long idx, in VariantArg1 metadata)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setItemMetadata, _godot_object, idx, metadata);
	}
	/**
	
	*/
	void setItemText(in long idx, in String text)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setItemText, _godot_object, idx, text);
	}
	/**
	
	*/
	void setItemTooltip(in long idx, in String tooltip)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setItemTooltip, _godot_object, idx, tooltip);
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
	@property long selected()
	{
		return getSelected();
	}
	/// ditto
	@property void selected(long v)
	{
		_selectInt(v);
	}
}
