/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.csgshape;
import std.meta : AliasSeq, staticIndexOf;
import std.traits : Unqual;
import godot.d.traits;
import godot.core;
import godot.c;
import godot.d.bind;
import godot.d.reference;
import godot.globalenums;
import godot.object;
import godot.geometryinstance;
/**

*/
@GodotBaseClass struct CSGShape
{
	package(godot) enum string _GODOT_internal_name = "CSGShape";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ GeometryInstance _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_update_shape") GodotMethod!(void) _updateShape;
		@GodotName("get_collision_layer") GodotMethod!(long) getCollisionLayer;
		@GodotName("get_collision_layer_bit") GodotMethod!(bool, long) getCollisionLayerBit;
		@GodotName("get_collision_mask") GodotMethod!(long) getCollisionMask;
		@GodotName("get_collision_mask_bit") GodotMethod!(bool, long) getCollisionMaskBit;
		@GodotName("get_meshes") GodotMethod!(Array) getMeshes;
		@GodotName("get_operation") GodotMethod!(CSGShape.Operation) getOperation;
		@GodotName("get_snap") GodotMethod!(double) getSnap;
		@GodotName("is_calculating_tangents") GodotMethod!(bool) isCalculatingTangents;
		@GodotName("is_root_shape") GodotMethod!(bool) isRootShape;
		@GodotName("is_using_collision") GodotMethod!(bool) isUsingCollision;
		@GodotName("set_calculate_tangents") GodotMethod!(void, bool) setCalculateTangents;
		@GodotName("set_collision_layer") GodotMethod!(void, long) setCollisionLayer;
		@GodotName("set_collision_layer_bit") GodotMethod!(void, long, bool) setCollisionLayerBit;
		@GodotName("set_collision_mask") GodotMethod!(void, long) setCollisionMask;
		@GodotName("set_collision_mask_bit") GodotMethod!(void, long, bool) setCollisionMaskBit;
		@GodotName("set_operation") GodotMethod!(void, long) setOperation;
		@GodotName("set_snap") GodotMethod!(void, double) setSnap;
		@GodotName("set_use_collision") GodotMethod!(void, bool) setUseCollision;
	}
	/// 
	pragma(inline, true) bool opEquals(in CSGShape other) const
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
	/// Construct a new instance of CSGShape.
	/// Note: use `memnew!CSGShape` instead.
	static CSGShape _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("CSGShape");
		if(constructor is null) return typeof(this).init;
		return cast(CSGShape)(constructor());
	}
	/// 
	enum Operation : int
	{
		/** */
		operationUnion = 0,
		/** */
		operationIntersection = 1,
		/** */
		operationSubtraction = 2,
	}
	/// 
	enum Constants : int
	{
		operationUnion = 0,
		operationIntersection = 1,
		operationSubtraction = 2,
	}
	/**
	
	*/
	void _updateShape()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_update_shape");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	long getCollisionLayer() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getCollisionLayer, _godot_object);
	}
	/**
	
	*/
	bool getCollisionLayerBit(in long bit) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.getCollisionLayerBit, _godot_object, bit);
	}
	/**
	
	*/
	long getCollisionMask() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getCollisionMask, _godot_object);
	}
	/**
	
	*/
	bool getCollisionMaskBit(in long bit) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.getCollisionMaskBit, _godot_object, bit);
	}
	/**
	
	*/
	Array getMeshes() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Array)(GDNativeClassBinding.getMeshes, _godot_object);
	}
	/**
	
	*/
	CSGShape.Operation getOperation() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(CSGShape.Operation)(GDNativeClassBinding.getOperation, _godot_object);
	}
	/**
	
	*/
	double getSnap() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSnap, _godot_object);
	}
	/**
	
	*/
	bool isCalculatingTangents() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isCalculatingTangents, _godot_object);
	}
	/**
	
	*/
	bool isRootShape() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isRootShape, _godot_object);
	}
	/**
	
	*/
	bool isUsingCollision() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isUsingCollision, _godot_object);
	}
	/**
	
	*/
	void setCalculateTangents(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setCalculateTangents, _godot_object, enabled);
	}
	/**
	
	*/
	void setCollisionLayer(in long layer)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setCollisionLayer, _godot_object, layer);
	}
	/**
	
	*/
	void setCollisionLayerBit(in long bit, in bool value)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setCollisionLayerBit, _godot_object, bit, value);
	}
	/**
	
	*/
	void setCollisionMask(in long mask)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setCollisionMask, _godot_object, mask);
	}
	/**
	
	*/
	void setCollisionMaskBit(in long bit, in bool value)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setCollisionMaskBit, _godot_object, bit, value);
	}
	/**
	
	*/
	void setOperation(in long operation)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setOperation, _godot_object, operation);
	}
	/**
	
	*/
	void setSnap(in double snap)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSnap, _godot_object, snap);
	}
	/**
	
	*/
	void setUseCollision(in bool operation)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setUseCollision, _godot_object, operation);
	}
	/**
	
	*/
	@property bool calculateTangents()
	{
		return isCalculatingTangents();
	}
	/// ditto
	@property void calculateTangents(bool v)
	{
		setCalculateTangents(v);
	}
	/**
	
	*/
	@property long collisionLayer()
	{
		return getCollisionLayer();
	}
	/// ditto
	@property void collisionLayer(long v)
	{
		setCollisionLayer(v);
	}
	/**
	
	*/
	@property long collisionMask()
	{
		return getCollisionMask();
	}
	/// ditto
	@property void collisionMask(long v)
	{
		setCollisionMask(v);
	}
	/**
	
	*/
	@property CSGShape.Operation operation()
	{
		return getOperation();
	}
	/// ditto
	@property void operation(long v)
	{
		setOperation(v);
	}
	/**
	
	*/
	@property double snap()
	{
		return getSnap();
	}
	/// ditto
	@property void snap(double v)
	{
		setSnap(v);
	}
	/**
	
	*/
	@property bool useCollision()
	{
		return isUsingCollision();
	}
	/// ditto
	@property void useCollision(bool v)
	{
		setUseCollision(v);
	}
}
