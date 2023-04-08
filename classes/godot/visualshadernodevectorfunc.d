/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.visualshadernodevectorfunc;
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
import godot.visualshadernode;
import godot.resource;
import godot.reference;
/**

*/
@GodotBaseClass struct VisualShaderNodeVectorFunc
{
	package(godot) enum string _GODOT_internal_name = "VisualShaderNodeVectorFunc";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ VisualShaderNode _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_function") GodotMethod!(VisualShaderNodeVectorFunc.Function) getFunction;
		@GodotName("set_function") GodotMethod!(void, long) setFunction;
	}
	/// 
	pragma(inline, true) bool opEquals(in VisualShaderNodeVectorFunc other) const
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
	/// Construct a new instance of VisualShaderNodeVectorFunc.
	/// Note: use `memnew!VisualShaderNodeVectorFunc` instead.
	static VisualShaderNodeVectorFunc _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("VisualShaderNodeVectorFunc");
		if(constructor is null) return typeof(this).init;
		return cast(VisualShaderNodeVectorFunc)(constructor());
	}
	@disable new(size_t s);
	/// 
	enum Function : int
	{
		/** */
		funcNormalize = 0,
		/** */
		funcSaturate = 1,
		/** */
		funcNegate = 2,
		/** */
		funcReciprocal = 3,
		/** */
		funcRgb2hsv = 4,
		/** */
		funcHsv2rgb = 5,
		/** */
		funcAbs = 6,
		/** */
		funcAcos = 7,
		/** */
		funcAcosh = 8,
		/** */
		funcAsin = 9,
		/** */
		funcAsinh = 10,
		/** */
		funcAtan = 11,
		/** */
		funcAtanh = 12,
		/** */
		funcCeil = 13,
		/** */
		funcCos = 14,
		/** */
		funcCosh = 15,
		/** */
		funcDegrees = 16,
		/** */
		funcExp = 17,
		/** */
		funcExp2 = 18,
		/** */
		funcFloor = 19,
		/** */
		funcFrac = 20,
		/** */
		funcInverseSqrt = 21,
		/** */
		funcLog = 22,
		/** */
		funcLog2 = 23,
		/** */
		funcRadians = 24,
		/** */
		funcRound = 25,
		/** */
		funcRoundeven = 26,
		/** */
		funcSign = 27,
		/** */
		funcSin = 28,
		/** */
		funcSinh = 29,
		/** */
		funcSqrt = 30,
		/** */
		funcTan = 31,
		/** */
		funcTanh = 32,
		/** */
		funcTrunc = 33,
		/** */
		funcOneminus = 34,
	}
	/// 
	enum Constants : int
	{
		funcNormalize = 0,
		funcSaturate = 1,
		funcNegate = 2,
		funcReciprocal = 3,
		funcRgb2hsv = 4,
		funcHsv2rgb = 5,
		funcAbs = 6,
		funcAcos = 7,
		funcAcosh = 8,
		funcAsin = 9,
		funcAsinh = 10,
		funcAtan = 11,
		funcAtanh = 12,
		funcCeil = 13,
		funcCos = 14,
		funcCosh = 15,
		funcDegrees = 16,
		funcExp = 17,
		funcExp2 = 18,
		funcFloor = 19,
		funcFrac = 20,
		funcInverseSqrt = 21,
		funcLog = 22,
		funcLog2 = 23,
		funcRadians = 24,
		funcRound = 25,
		funcRoundeven = 26,
		funcSign = 27,
		funcSin = 28,
		funcSinh = 29,
		funcSqrt = 30,
		funcTan = 31,
		funcTanh = 32,
		funcTrunc = 33,
		funcOneminus = 34,
	}
	/**
	
	*/
	VisualShaderNodeVectorFunc.Function getFunction() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(VisualShaderNodeVectorFunc.Function)(GDNativeClassBinding.getFunction, _godot_object);
	}
	/**
	
	*/
	void setFunction(in long func)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFunction, _godot_object, func);
	}
	/**
	
	*/
	@property VisualShaderNodeVectorFunc.Function _function()
	{
		return getFunction();
	}
	/// ditto
	@property void _function(long v)
	{
		setFunction(v);
	}
}
