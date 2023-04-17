/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.visualscriptpropertyget;
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
import godot.visualscriptnode;
import godot.resource;
import godot.reference;
/**

*/
@GodotBaseClass struct VisualScriptPropertyGet
{
	package(godot) enum string _GODOT_internal_name = "VisualScriptPropertyGet";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ VisualScriptNode _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_get_type_cache") GodotMethod!(Variant.Type) _getTypeCache;
		@GodotName("_set_type_cache") GodotMethod!(void, long) _setTypeCache;
		@GodotName("get_base_path") GodotMethod!(NodePath) getBasePath;
		@GodotName("get_base_script") GodotMethod!(String) getBaseScript;
		@GodotName("get_base_type") GodotMethod!(String) getBaseType;
		@GodotName("get_basic_type") GodotMethod!(Variant.Type) getBasicType;
		@GodotName("get_call_mode") GodotMethod!(VisualScriptPropertyGet.CallMode) getCallMode;
		@GodotName("get_index") GodotMethod!(String) getIndex;
		@GodotName("get_property") GodotMethod!(String) getProperty;
		@GodotName("set_base_path") GodotMethod!(void, NodePath) setBasePath;
		@GodotName("set_base_script") GodotMethod!(void, String) setBaseScript;
		@GodotName("set_base_type") GodotMethod!(void, String) setBaseType;
		@GodotName("set_basic_type") GodotMethod!(void, long) setBasicType;
		@GodotName("set_call_mode") GodotMethod!(void, long) setCallMode;
		@GodotName("set_index") GodotMethod!(void, String) setIndex;
		@GodotName("set_property") GodotMethod!(void, String) setProperty;
	}
	/// 
	pragma(inline, true) bool opEquals(in VisualScriptPropertyGet other) const
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
	/// Construct a new instance of VisualScriptPropertyGet.
	/// Note: use `memnew!VisualScriptPropertyGet` instead.
	static VisualScriptPropertyGet _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("VisualScriptPropertyGet");
		if(constructor is null) return typeof(this).init;
		return cast(VisualScriptPropertyGet)(constructor());
	}
	/// 
	enum CallMode : int
	{
		/** */
		callModeSelf = 0,
		/** */
		callModeNodePath = 1,
		/** */
		callModeInstance = 2,
		/** */
		callModeBasicType = 3,
	}
	/// 
	enum Constants : int
	{
		callModeSelf = 0,
		callModeNodePath = 1,
		callModeInstance = 2,
		callModeBasicType = 3,
	}
	/**
	
	*/
	Variant.Type _getTypeCache() const
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_get_type_cache");
		return this.callv(_GODOT_method_name, _GODOT_args).as!(RefOrT!Variant.Type);
	}
	/**
	
	*/
	void _setTypeCache(in long type_cache)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(type_cache);
		String _GODOT_method_name = String("_set_type_cache");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	NodePath getBasePath() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(NodePath)(GDNativeClassBinding.getBasePath, _godot_object);
	}
	/**
	
	*/
	String getBaseScript() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getBaseScript, _godot_object);
	}
	/**
	
	*/
	String getBaseType() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getBaseType, _godot_object);
	}
	/**
	
	*/
	Variant.Type getBasicType() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Variant.Type)(GDNativeClassBinding.getBasicType, _godot_object);
	}
	/**
	
	*/
	VisualScriptPropertyGet.CallMode getCallMode() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(VisualScriptPropertyGet.CallMode)(GDNativeClassBinding.getCallMode, _godot_object);
	}
	/**
	
	*/
	String getIndex() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getIndex, _godot_object);
	}
	/**
	
	*/
	String getProperty() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(String)(GDNativeClassBinding.getProperty, _godot_object);
	}
	/**
	
	*/
	void setBasePath(NodePathArg0)(in NodePathArg0 base_path)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setBasePath, _godot_object, base_path);
	}
	/**
	
	*/
	void setBaseScript(in String base_script)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setBaseScript, _godot_object, base_script);
	}
	/**
	
	*/
	void setBaseType(in String base_type)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setBaseType, _godot_object, base_type);
	}
	/**
	
	*/
	void setBasicType(in long basic_type)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setBasicType, _godot_object, basic_type);
	}
	/**
	
	*/
	void setCallMode(in long mode)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setCallMode, _godot_object, mode);
	}
	/**
	
	*/
	void setIndex(in String index)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setIndex, _godot_object, index);
	}
	/**
	
	*/
	void setProperty(in String property)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setProperty, _godot_object, property);
	}
	/**
	
	*/
	@property String baseScript()
	{
		return getBaseScript();
	}
	/// ditto
	@property void baseScript(String v)
	{
		setBaseScript(v);
	}
	/**
	
	*/
	@property String baseType()
	{
		return getBaseType();
	}
	/// ditto
	@property void baseType(String v)
	{
		setBaseType(v);
	}
	/**
	
	*/
	@property Variant.Type basicType()
	{
		return getBasicType();
	}
	/// ditto
	@property void basicType(long v)
	{
		setBasicType(v);
	}
	/**
	
	*/
	@property String index()
	{
		return getIndex();
	}
	/// ditto
	@property void index(String v)
	{
		setIndex(v);
	}
	/**
	
	*/
	@property NodePath nodePath()
	{
		return getBasePath();
	}
	/// ditto
	@property void nodePath(NodePath v)
	{
		setBasePath(v);
	}
	/**
	
	*/
	@property String property()
	{
		return getProperty();
	}
	/// ditto
	@property void property(String v)
	{
		setProperty(v);
	}
	/**
	
	*/
	@property VisualScriptPropertyGet.CallMode setMode()
	{
		return getCallMode();
	}
	/// ditto
	@property void setMode(long v)
	{
		setCallMode(v);
	}
	/**
	
	*/
	@property Variant.Type typeCache()
	{
		return _getTypeCache();
	}
	/// ditto
	@property void typeCache(long v)
	{
		_setTypeCache(v);
	}
}
