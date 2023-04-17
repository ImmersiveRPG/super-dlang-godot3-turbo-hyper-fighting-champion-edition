/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.canvaslayer;
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
import godot.node;
/**

*/
@GodotBaseClass struct CanvasLayer
{
	package(godot) enum string _GODOT_internal_name = "CanvasLayer";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Node _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_canvas") GodotMethod!(RID) getCanvas;
		@GodotName("get_custom_viewport") GodotMethod!(Node) getCustomViewport;
		@GodotName("get_follow_viewport_scale") GodotMethod!(double) getFollowViewportScale;
		@GodotName("get_layer") GodotMethod!(long) getLayer;
		@GodotName("get_offset") GodotMethod!(Vector2) getOffset;
		@GodotName("get_rotation") GodotMethod!(double) getRotation;
		@GodotName("get_rotation_degrees") GodotMethod!(double) getRotationDegrees;
		@GodotName("get_scale") GodotMethod!(Vector2) getScale;
		@GodotName("get_transform") GodotMethod!(Transform2D) getTransform;
		@GodotName("hide") GodotMethod!(void) hide;
		@GodotName("is_following_viewport") GodotMethod!(bool) isFollowingViewport;
		@GodotName("is_visible") GodotMethod!(bool) isVisible;
		@GodotName("set_custom_viewport") GodotMethod!(void, Node) setCustomViewport;
		@GodotName("set_follow_viewport") GodotMethod!(void, bool) setFollowViewport;
		@GodotName("set_follow_viewport_scale") GodotMethod!(void, double) setFollowViewportScale;
		@GodotName("set_layer") GodotMethod!(void, long) setLayer;
		@GodotName("set_offset") GodotMethod!(void, Vector2) setOffset;
		@GodotName("set_rotation") GodotMethod!(void, double) setRotation;
		@GodotName("set_rotation_degrees") GodotMethod!(void, double) setRotationDegrees;
		@GodotName("set_scale") GodotMethod!(void, Vector2) setScale;
		@GodotName("set_transform") GodotMethod!(void, Transform2D) setTransform;
		@GodotName("set_visible") GodotMethod!(void, bool) setVisible;
		@GodotName("show") GodotMethod!(void) show;
	}
	/// 
	pragma(inline, true) bool opEquals(in CanvasLayer other) const
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
	/// Construct a new instance of CanvasLayer.
	/// Note: use `memnew!CanvasLayer` instead.
	static CanvasLayer _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("CanvasLayer");
		if(constructor is null) return typeof(this).init;
		return cast(CanvasLayer)(constructor());
	}
	/**
	
	*/
	RID getCanvas() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(RID)(GDNativeClassBinding.getCanvas, _godot_object);
	}
	/**
	
	*/
	Node getCustomViewport() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Node)(GDNativeClassBinding.getCustomViewport, _godot_object);
	}
	/**
	
	*/
	double getFollowViewportScale() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getFollowViewportScale, _godot_object);
	}
	/**
	
	*/
	long getLayer() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getLayer, _godot_object);
	}
	/**
	
	*/
	Vector2 getOffset() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getOffset, _godot_object);
	}
	/**
	
	*/
	double getRotation() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getRotation, _godot_object);
	}
	/**
	
	*/
	double getRotationDegrees() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getRotationDegrees, _godot_object);
	}
	/**
	
	*/
	Vector2 getScale() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getScale, _godot_object);
	}
	/**
	
	*/
	Transform2D getTransform() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Transform2D)(GDNativeClassBinding.getTransform, _godot_object);
	}
	/**
	
	*/
	void hide()
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.hide, _godot_object);
	}
	/**
	
	*/
	bool isFollowingViewport() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isFollowingViewport, _godot_object);
	}
	/**
	
	*/
	bool isVisible() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isVisible, _godot_object);
	}
	/**
	
	*/
	void setCustomViewport(Node viewport)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setCustomViewport, _godot_object, viewport);
	}
	/**
	
	*/
	void setFollowViewport(in bool enable)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFollowViewport, _godot_object, enable);
	}
	/**
	
	*/
	void setFollowViewportScale(in double scale)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFollowViewportScale, _godot_object, scale);
	}
	/**
	
	*/
	void setLayer(in long layer)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setLayer, _godot_object, layer);
	}
	/**
	
	*/
	void setOffset(in Vector2 offset)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setOffset, _godot_object, offset);
	}
	/**
	
	*/
	void setRotation(in double radians)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setRotation, _godot_object, radians);
	}
	/**
	
	*/
	void setRotationDegrees(in double degrees)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setRotationDegrees, _godot_object, degrees);
	}
	/**
	
	*/
	void setScale(in Vector2 scale)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setScale, _godot_object, scale);
	}
	/**
	
	*/
	void setTransform(in Transform2D transform)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setTransform, _godot_object, transform);
	}
	/**
	
	*/
	void setVisible(in bool visible)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setVisible, _godot_object, visible);
	}
	/**
	
	*/
	void show()
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.show, _godot_object);
	}
	/**
	
	*/
	@property Node customViewport()
	{
		return getCustomViewport();
	}
	/// ditto
	@property void customViewport(Node v)
	{
		setCustomViewport(v);
	}
	/**
	
	*/
	@property bool followViewportEnable()
	{
		return isFollowingViewport();
	}
	/// ditto
	@property void followViewportEnable(bool v)
	{
		setFollowViewport(v);
	}
	/**
	
	*/
	@property double followViewportScale()
	{
		return getFollowViewportScale();
	}
	/// ditto
	@property void followViewportScale(double v)
	{
		setFollowViewportScale(v);
	}
	/**
	
	*/
	@property long layer()
	{
		return getLayer();
	}
	/// ditto
	@property void layer(long v)
	{
		setLayer(v);
	}
	/**
	
	*/
	@property Vector2 offset()
	{
		return getOffset();
	}
	/// ditto
	@property void offset(Vector2 v)
	{
		setOffset(v);
	}
	/**
	
	*/
	@property double rotation()
	{
		return getRotation();
	}
	/// ditto
	@property void rotation(double v)
	{
		setRotation(v);
	}
	/**
	
	*/
	@property double rotationDegrees()
	{
		return getRotationDegrees();
	}
	/// ditto
	@property void rotationDegrees(double v)
	{
		setRotationDegrees(v);
	}
	/**
	
	*/
	@property Vector2 scale()
	{
		return getScale();
	}
	/// ditto
	@property void scale(Vector2 v)
	{
		setScale(v);
	}
	/**
	
	*/
	@property Transform2D transform()
	{
		return getTransform();
	}
	/// ditto
	@property void transform(Transform2D v)
	{
		setTransform(v);
	}
	/**
	
	*/
	@property bool visible()
	{
		return isVisible();
	}
	/// ditto
	@property void visible(bool v)
	{
		setVisible(v);
	}
}
