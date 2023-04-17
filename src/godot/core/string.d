/**
Godot's ref-counted wchar_t String class.

Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.core.string;

import core.stdc.stddef : wchar_t;
import godot.c;
import std.traits;

import godot.core.variant;

struct CharString
{
	@nogc nothrow:
	
	package(godot) godot_char_string _char_string;
	
	immutable(char)* ptr() const
	{
		return cast(typeof(return))_godot_api.godot_char_string_get_data(&_char_string);
	}
	
	size_t length() const
	{
		return _godot_api.godot_char_string_length(&_char_string);
	}

	bool empty() const
	{
		return length == 0;
	}
	
	immutable(char)[] data() const
	{
		return ptr[0..length];
	}
	
	~this()
	{
		_godot_api.godot_char_string_destroy(&_char_string);
	}
}

/**
This is the built-in string class (and the one used by GDScript). It supports Unicode and provides all necessary means for string handling. Strings are reference counted and use a copy-on-write approach, so passing them around is cheap in resources.
*/
struct String
{
	@nogc nothrow:
	
	package(godot) godot_string _godot_string;
	
	/// postblit (Vector is CoW, so no data copying is done)
	this(this)
	{
		godot_string other = _godot_string;
		_godot_api.godot_string_new_copy(&_godot_string, &other);
	}
	
	package(godot) this(in godot_string str)
	{
		_godot_string = str;
	}
	
	/++
	wchar_t constructor. S can be a slice or a null-terminated pointer.
	+/
	this(S)(in S str) if(isImplicitlyConvertible!(S, const(wchar_t)[]) ||
		isImplicitlyConvertible!(S, const(wchar_t)*))
	{
		static if(isImplicitlyConvertible!(S, const(wchar_t)[]))
		{
			const(wchar_t)[] contents = str;
			_godot_api.godot_string_new_with_wide_string(&_godot_string, contents.ptr, cast(int)contents.length);
		}
		else
		{
			import core.stdc.wchar_ : wcslen;
			const(wchar_t)* contents = str;
			_godot_api.godot_string_new_with_wide_string(&_godot_string, contents, cast(int)wcslen(contents));
		}
	}
	
	/++
	UTF-8 constructor. S can be a slice (like `string`) or a null-terminated pointer.
	+/
	this(S)(in S str) if(isImplicitlyConvertible!(S, const(char)[]) ||
		isImplicitlyConvertible!(S, const(char)*))
	{
		static if(isImplicitlyConvertible!(S, const(char)[]))
		{
			const(char)[] contents = str;
			_godot_api.godot_string_parse_utf8_with_len(&_godot_string, contents.ptr, cast(int)contents.length);
		}
		else
		{
			const(char)* contents = str;
			_godot_api.godot_string_parse_utf8(&_godot_string, contents);
		}
	}
	
	~this()
	{
		_godot_api.godot_string_destroy(&_godot_string);
	}
	
	
	void opAssign(in String other)
	{
		_godot_api.godot_string_destroy(&_godot_string);
		_godot_api.godot_string_new_copy(&_godot_string, &other._godot_string);
	}
	
	
	/+String substr(int p_from,int p_chars) const
	{
		return String.empty; // todo
	}
	
	alias opSlice = substr;+/
	
	
	ref wchar_t opIndex(in size_t idx)
	{
		return *_godot_api.godot_string_operator_index(&_godot_string, cast(int)idx);
	}
	
	wchar_t opIndex(in size_t idx) const
	{
		return *_godot_api.godot_string_operator_index(cast(godot_string*) &_godot_string, cast(int)idx);
	}
	
	/// Returns the length of the wchar_t array, minus the zero terminator.
	size_t length() const
	{
		return _godot_api.godot_string_length(&_godot_string);
	}
	
	/// Returns: $(D true) if length is 0
	bool empty() const
	{
		return length == 0;
	}
	
	int opCmp(in String s) const
	{
		if(_godot_string == s._godot_string) return true;
		auto equal = _godot_api.godot_string_operator_equal(&_godot_string, &s._godot_string);
		if(equal) return 0;
		auto less = _godot_api.godot_string_operator_less(&_godot_string, &s._godot_string);
		return less?(-1):1;
	}
	bool opEquals(in String other) const
	{
		if(_godot_string == other._godot_string) return true;
		return _godot_api.godot_string_operator_equal(&_godot_string, &other._godot_string);
	}
	
	String opBinary(string op)(in String other) const if(op == "~" || op == "+")
	{
		String ret = void;
		ret._godot_string = _godot_api.godot_string_operator_plus(&_godot_string, &other._godot_string);
		
		return ret;
	}
	
	void opOpAssign(string op)(in String other) if(op == "~" || op == "+")
	{
		_godot_string = _godot_api.godot_string_operator_plus(&_godot_string, &other._godot_string);
	}
	
	/// Returns a pointer to the wchar_t data. Always zero-terminated.
	immutable(wchar_t)* ptr() const
	{
		return cast(typeof(return))_godot_api.godot_string_wide_str(&_godot_string);
	}

	/// Returns a slice of the wchar_t data without the zero terminator.
	immutable(wchar_t)[] data() const
	{
		return ptr[0..length];
	}
	alias toString = data;
	
	CharString utf8() const
	{
		CharString ret = void;
		ret._char_string = _godot_api.godot_string_utf8(&_godot_string);
		return ret;
	}

	String format(V)(V values) const if(is(V : Variant) || Variant.compatibleToGodot!V)
	{
		const Variant v = values;
		String new_string = void;
		new_string._godot_string = _godot_api.godot_string_format(&_godot_string, cast(godot_variant *)&v);

		return new_string;
	}

	String format(V)(V values, String placeholder) const if(is(V : Variant) || Variant.compatibleToGodot!V)
	{
		const Variant v = values;
		String new_string = void;
		CharString contents = placeholder.utf8;
		new_string._godot_string = _godot_api.godot_string_format_with_custom_placeholder(&_godot_string, cast(godot_variant *)&v, contents.ptr);

		return new_string;
	}

	@trusted
	hash_t toHash() const
	{
		static if(hash_t.sizeof == uint.sizeof) return _godot_api.godot_string_hash(&_godot_string);
		else return _godot_api.godot_string_hash64(&_godot_string);
	}
}

struct GodotStringLiteral(string data)
{
	private __gshared godot_string gs;
	String str() const
	{
		static if(data.length) if(gs == godot_string.init)
		{
			synchronized
			{
				if(gs == godot_string.init) _godot_api.godot_string_parse_utf8_with_len(&gs, data.ptr, cast(int)data.length);
			}
		}
		String ret = void;
		_godot_api.godot_string_new_copy(&ret._godot_string, &gs);
		return ret;
	}
	static if(data.length)
	{
		shared static ~this()
		{
			if(gs != godot_string.init) _godot_api.godot_string_destroy(&gs);
		}
	}
	alias str this;
}

/++
Create a GodotStringLiteral.

D $(D string) to Godot $(D String) conversion is expensive and cannot be done
at compile time. This literal does the conversion once the first time it's
needed, then caches the String, allowing it to implicitly convert to String at
no run time cost.
+/
enum gs(string str) = GodotStringLiteral!str.init;






