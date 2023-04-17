/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.touchscreenbutton;
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
import godot.node2d;
import godot.canvasitem;
import godot.node;
import godot.inputevent;
import godot.bitmap;
import godot.shape2d;
import godot.texture;
/**

*/
@GodotBaseClass struct TouchScreenButton
{
	package(godot) enum string _GODOT_internal_name = "TouchScreenButton";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Node2D _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_input") GodotMethod!(void, InputEvent) _input;
		@GodotName("get_action") GodotMethod!(String) getAction;
		@GodotName("get_bitmask") GodotMethod!(BitMap) getBitmask;
		@GodotName("get_shape") GodotMethod!(Shape2D) getShape;
		@GodotName("get_texture") GodotMethod!(Texture) getTexture;
		@GodotName("get_texture_pressed") GodotMethod!(Texture) getTexturePressed;
		@GodotName("get_visibility_mode") GodotMethod!(TouchScreenButton.VisibilityMode) getVisibilityMode;
		@GodotName("is_passby_press_enabled") GodotMethod!(bool) isPassbyPressEnabled;
		@GodotName("is_pressed") GodotMethod!(bool) isPressed;
		@GodotName("is_shape_centered") GodotMethod!(bool) isShapeCentered;
		@GodotName("is_shape_visible") GodotMethod!(bool) isShapeVisible;
		@GodotName("set_action") GodotMethod!(void, String) setAction;
		@GodotName("set_bitmask") GodotMethod!(void, BitMap) setBitmask;
		@GodotName("set_passby_press") GodotMethod!(void, bool) setPassbyPress;
		@GodotName("set_shape") GodotMethod!(void, Shape2D) setShape;
		@GodotName("set_shape_centered") GodotMethod!(void, bool) setShapeCentered;
		@GodotName("set_shape_visible") GodotMethod!(void, bool) setShapeVisible;
		@GodotName("set_texture") GodotMethod!(void, Texture) setTexture;
		@GodotName("set_texture_pressed") GodotMethod!(void, Texture) setTexturePressed;
		@GodotName("set_visibility_mode") GodotMethod!(void, long) setVisibilityMode;
	}
	/// 
	pragma(inline, true) bool opEquals(in TouchScreenButton other) const
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
	/// Construct a new instance of TouchScreenButton.
	/// Note: use `memnew!TouchScreenButton` instead.
	static TouchScreenButton _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("TouchScreenButton");
		if(constructor is null) return typeof(this).init;
		return cast(TouchScreenButton)(constructor());
	}
	/// 
	enum VisibilityMode : int
	{
		/** */
		visibilityAlways = 0,
		/** */
		visibilityTouchscreenOnly = 1,
	}
	/// 
	enum Constants : int
	{
		visibilityAlways = 0,
		visibilityTouchscreenOnly = 1,
	}
	/**
	
	*/
	void _input(InputEvent arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_input");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	String getAction() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getAction, _godot_object);
	}
	/**
	
	*/
	Ref!BitMap getBitmask() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(BitMap)(GDNativeClassBinding.getBitmask, _godot_object);
	}
	/**
	
	*/
	Ref!Shape2D getShape() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Shape2D)(GDNativeClassBinding.getShape, _godot_object);
	}
	/**
	
	*/
	Ref!Texture getTexture() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Texture)(GDNativeClassBinding.getTexture, _godot_object);
	}
	/**
	
	*/
	Ref!Texture getTexturePressed() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Texture)(GDNativeClassBinding.getTexturePressed, _godot_object);
	}
	/**
	
	*/
	TouchScreenButton.VisibilityMode getVisibilityMode() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(TouchScreenButton.VisibilityMode)(GDNativeClassBinding.getVisibilityMode, _godot_object);
	}
	/**
	
	*/
	bool isPassbyPressEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isPassbyPressEnabled, _godot_object);
	}
	/**
	
	*/
	bool isPressed() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isPressed, _godot_object);
	}
	/**
	
	*/
	bool isShapeCentered() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isShapeCentered, _godot_object);
	}
	/**
	
	*/
	bool isShapeVisible() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isShapeVisible, _godot_object);
	}
	/**
	
	*/
	void setAction(in String action)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setAction, _godot_object, action);
	}
	/**
	
	*/
	void setBitmask(BitMap bitmask)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setBitmask, _godot_object, bitmask);
	}
	/**
	
	*/
	void setPassbyPress(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setPassbyPress, _godot_object, enabled);
	}
	/**
	
	*/
	void setShape(Shape2D shape)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setShape, _godot_object, shape);
	}
	/**
	
	*/
	void setShapeCentered(in bool _bool)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setShapeCentered, _godot_object, _bool);
	}
	/**
	
	*/
	void setShapeVisible(in bool _bool)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setShapeVisible, _godot_object, _bool);
	}
	/**
	
	*/
	void setTexture(Texture texture)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setTexture, _godot_object, texture);
	}
	/**
	
	*/
	void setTexturePressed(Texture texture_pressed)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setTexturePressed, _godot_object, texture_pressed);
	}
	/**
	
	*/
	void setVisibilityMode(in long mode)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setVisibilityMode, _godot_object, mode);
	}
	/**
	
	*/
	@property String action()
	{
		return getAction();
	}
	/// ditto
	@property void action(String v)
	{
		setAction(v);
	}
	/**
	
	*/
	@property BitMap bitmask()
	{
		return getBitmask();
	}
	/// ditto
	@property void bitmask(BitMap v)
	{
		setBitmask(v);
	}
	/**
	
	*/
	@property Texture normal()
	{
		return getTexture();
	}
	/// ditto
	@property void normal(Texture v)
	{
		setTexture(v);
	}
	/**
	
	*/
	@property bool passbyPress()
	{
		return isPassbyPressEnabled();
	}
	/// ditto
	@property void passbyPress(bool v)
	{
		setPassbyPress(v);
	}
	/**
	
	*/
	@property Texture pressed()
	{
		return getTexturePressed();
	}
	/// ditto
	@property void pressed(Texture v)
	{
		setTexturePressed(v);
	}
	/**
	
	*/
	@property Shape2D shape()
	{
		return getShape();
	}
	/// ditto
	@property void shape(Shape2D v)
	{
		setShape(v);
	}
	/**
	
	*/
	@property bool shapeCentered()
	{
		return isShapeCentered();
	}
	/// ditto
	@property void shapeCentered(bool v)
	{
		setShapeCentered(v);
	}
	/**
	
	*/
	@property bool shapeVisible()
	{
		return isShapeVisible();
	}
	/// ditto
	@property void shapeVisible(bool v)
	{
		setShapeVisible(v);
	}
	/**
	
	*/
	@property TouchScreenButton.VisibilityMode visibilityMode()
	{
		return getVisibilityMode();
	}
	/// ditto
	@property void visibilityMode(long v)
	{
		setVisibilityMode(v);
	}
}
