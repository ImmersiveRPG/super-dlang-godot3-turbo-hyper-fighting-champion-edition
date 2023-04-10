/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.funcref;
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
import godot.reference;
/**

*/
@GodotBaseClass struct FuncRef
{
	package(godot) enum string _GODOT_internal_name = "FuncRef";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Reference _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("call_func") GodotMethod!(Variant, GodotVarArgs) callFunc;
		@GodotName("call_funcv") GodotMethod!(Variant, Array) callFuncv;
		@GodotName("get_function") GodotMethod!(String) getFunction;
		@GodotName("is_valid") GodotMethod!(bool) isValid;
		@GodotName("set_function") GodotMethod!(void, String) setFunction;
		@GodotName("set_instance") GodotMethod!(void, GodotObject) setInstance;
	}
	/// 
	pragma(inline, true) bool opEquals(in FuncRef other) const
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
	/// Construct a new instance of FuncRef.
	/// Note: use `memnew!FuncRef` instead.
	static FuncRef _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("FuncRef");
		if(constructor is null) return typeof(this).init;
		return cast(FuncRef)(constructor());
	}
	/**
	
	*/
	Variant callFunc(VarArgs...)(VarArgs varArgs)
	{
		Array _GODOT_args = Array.make();
		foreach(vai, VA; VarArgs)
		{
			_GODOT_args.append(varArgs[vai]);
		}
		String _GODOT_method_name = String("call_func");
		return this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	Variant callFuncv(in Array arg_array)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Variant)(GDNativeClassBinding.callFuncv, _godot_object, arg_array);
	}
	/**
	
	*/
	String getFunction()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getFunction, _godot_object);
	}
	/**
	
	*/
	bool isValid() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isValid, _godot_object);
	}
	/**
	
	*/
	void setFunction(in String name)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFunction, _godot_object, name);
	}
	/**
	
	*/
	void setInstance(GodotObject instance)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setInstance, _godot_object, instance);
	}
	/**
	
	*/
	@property String _function()
	{
		return getFunction();
	}
	/// ditto
	@property void _function(String v)
	{
		setFunction(v);
	}
}
