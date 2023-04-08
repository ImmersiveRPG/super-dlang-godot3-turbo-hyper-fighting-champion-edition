/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.joint;
import std.meta : AliasSeq, staticIndexOf;
import std.traits : Unqual;
import godot.d.traits;
import godot.core;
import godot.c;
import godot.d.bind;
import godot.d.reference;
import godot.globalenums;
import godot.object;
import godot.spatial;
/**

*/
@GodotBaseClass struct Joint
{
	package(godot) enum string _GODOT_internal_name = "Joint";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Spatial _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_body_exit_tree") GodotMethod!(void) _bodyExitTree;
		@GodotName("get_exclude_nodes_from_collision") GodotMethod!(bool) getExcludeNodesFromCollision;
		@GodotName("get_node_a") GodotMethod!(NodePath) getNodeA;
		@GodotName("get_node_b") GodotMethod!(NodePath) getNodeB;
		@GodotName("get_solver_priority") GodotMethod!(long) getSolverPriority;
		@GodotName("set_exclude_nodes_from_collision") GodotMethod!(void, bool) setExcludeNodesFromCollision;
		@GodotName("set_node_a") GodotMethod!(void, NodePath) setNodeA;
		@GodotName("set_node_b") GodotMethod!(void, NodePath) setNodeB;
		@GodotName("set_solver_priority") GodotMethod!(void, long) setSolverPriority;
	}
	/// 
	pragma(inline, true) bool opEquals(in Joint other) const
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
	/// Construct a new instance of Joint.
	/// Note: use `memnew!Joint` instead.
	static Joint _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("Joint");
		if(constructor is null) return typeof(this).init;
		return cast(Joint)(constructor());
	}
	/**
	
	*/
	void _bodyExitTree()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_body_exit_tree");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	bool getExcludeNodesFromCollision() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.getExcludeNodesFromCollision, _godot_object);
	}
	/**
	
	*/
	NodePath getNodeA() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(NodePath)(GDNativeClassBinding.getNodeA, _godot_object);
	}
	/**
	
	*/
	NodePath getNodeB() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(NodePath)(GDNativeClassBinding.getNodeB, _godot_object);
	}
	/**
	
	*/
	long getSolverPriority() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getSolverPriority, _godot_object);
	}
	/**
	
	*/
	void setExcludeNodesFromCollision(in bool enable)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setExcludeNodesFromCollision, _godot_object, enable);
	}
	/**
	
	*/
	void setNodeA(NodePathArg0)(in NodePathArg0 node)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setNodeA, _godot_object, node);
	}
	/**
	
	*/
	void setNodeB(NodePathArg0)(in NodePathArg0 node)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setNodeB, _godot_object, node);
	}
	/**
	
	*/
	void setSolverPriority(in long priority)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSolverPriority, _godot_object, priority);
	}
	/**
	
	*/
	@property bool collisionExcludeNodes()
	{
		return getExcludeNodesFromCollision();
	}
	/// ditto
	@property void collisionExcludeNodes(bool v)
	{
		setExcludeNodesFromCollision(v);
	}
	/**
	
	*/
	@property NodePath nodesNodeA()
	{
		return getNodeA();
	}
	/// ditto
	@property void nodesNodeA(NodePath v)
	{
		setNodeA(v);
	}
	/**
	
	*/
	@property NodePath nodesNodeB()
	{
		return getNodeB();
	}
	/// ditto
	@property void nodesNodeB(NodePath v)
	{
		setNodeB(v);
	}
	/**
	
	*/
	@property long solverPriority()
	{
		return getSolverPriority();
	}
	/// ditto
	@property void solverPriority(long v)
	{
		setSolverPriority(v);
	}
}
