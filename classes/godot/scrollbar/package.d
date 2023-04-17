/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.scrollbar;
import std.meta : AliasSeq, staticIndexOf;
import std.traits : Unqual;
import godot.d.traits;
import godot.core;
import godot.c;
import godot.d.bind;
import godot.d.reference;
import godot.globalenums;
import godot.object;
import godot.range;
import godot.control;
import godot.canvasitem;
import godot.node;
import godot.inputevent;
/**

*/
@GodotBaseClass struct ScrollBar
{
	package(godot) enum string _GODOT_internal_name = "ScrollBar";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Range _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_drag_node_exit") GodotMethod!(void) _dragNodeExit;
		@GodotName("_drag_node_input") GodotMethod!(void, InputEvent) _dragNodeInput;
		@GodotName("_gui_input") GodotMethod!(void, InputEvent) _guiInput;
		@GodotName("get_custom_step") GodotMethod!(double) getCustomStep;
		@GodotName("set_custom_step") GodotMethod!(void, double) setCustomStep;
	}
	/// 
	pragma(inline, true) bool opEquals(in ScrollBar other) const
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
	/// Construct a new instance of ScrollBar.
	/// Note: use `memnew!ScrollBar` instead.
	static ScrollBar _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("ScrollBar");
		if(constructor is null) return typeof(this).init;
		return cast(ScrollBar)(constructor());
	}
	/**
	
	*/
	void _dragNodeExit()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_drag_node_exit");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _dragNodeInput(InputEvent arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_drag_node_input");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _guiInput(InputEvent arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_gui_input");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	double getCustomStep() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getCustomStep, _godot_object);
	}
	/**
	
	*/
	void setCustomStep(in double step)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setCustomStep, _godot_object, step);
	}
	/**
	
	*/
	@property double customStep()
	{
		return getCustomStep();
	}
	/// ditto
	@property void customStep(double v)
	{
		setCustomStep(v);
	}
}
