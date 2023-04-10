module godot.c.api;

import godot.c.core;

import godot.c.nativescript;
import godot.c.pluginscript;
import godot.c.android;
import godot.c.arvr;
import godot.c.videodecoder;
import godot.c.net;
import std.meta : AliasSeq, staticIndexOf;
import std.format : format;
import std.string : capitalize, toLower;
import std.conv : text;
import core.stdc.stdint;
import core.stdc.stddef : wchar_t;


			extern(C) struct godot_gdnative_api_version
			{
				uint major, minor;
			}
			mixin template ApiStructHeader()
			{
				uint type;
				godot_gdnative_api_version ver;
				const godot_gdnative_api_struct *next;
			}
			extern(C) struct godot_gdnative_api_struct
			{
				mixin ApiStructHeader;
			}
			private string versionError(string name, int major, int minor)
			{
				string ret = "Bindings for GDNative extension "~name;
				if((major == 1 && minor == 0)) ret ~= " do not exist. ";
				else ret ~= format!" exist, but not for version %d.%d. "(major, minor);
				ret ~= "Please provide a more recent gdnative_api.json to the binding generator to fix this.";
				return ret;
			}
		enum ApiType : uint {
	core,
	nativescript,
	pluginscript,
	android,
	arvr,
	videodecoder,
	net,
}
private
{
	alias SupportedVersions(ApiType type : ApiType.core) = AliasSeq!([1, 0], [1, 1], [1, 2], [1, 3], );
	__gshared bool hasCore_1_0 = false;
	version(GDNativeRequireCore_1_0) enum bool requiresCore_1_0 = true;
	else enum bool requiresCore_1_0 = requiresCore_1_1;
	__gshared bool hasCore_1_1 = false;
	version(GDNativeRequireCore_1_1) enum bool requiresCore_1_1 = true;
	else enum bool requiresCore_1_1 = requiresCore_1_2;
	__gshared bool hasCore_1_2 = false;
	version(GDNativeRequireCore_1_2) enum bool requiresCore_1_2 = true;
	else enum bool requiresCore_1_2 = requiresCore_1_3;
	__gshared bool hasCore_1_3 = false;
	version(GDNativeRequireCore_1_3) enum bool requiresCore_1_3 = true;
	else enum bool requiresCore_1_3 = false;
	alias SupportedVersions(ApiType type : ApiType.nativescript) = AliasSeq!([1, 0], [1, 1], );
	__gshared bool hasNativescript_1_0 = false;
	version(GDNativeRequireNativescript_1_0) enum bool requiresNativescript_1_0 = true;
	else enum bool requiresNativescript_1_0 = requiresNativescript_1_1;
	__gshared bool hasNativescript_1_1 = false;
	version(GDNativeRequireNativescript_1_1) enum bool requiresNativescript_1_1 = true;
	else enum bool requiresNativescript_1_1 = false;
	alias SupportedVersions(ApiType type : ApiType.pluginscript) = AliasSeq!([1, 0], );
	__gshared bool hasPluginscript_1_0 = false;
	version(GDNativeRequirePluginscript_1_0) enum bool requiresPluginscript_1_0 = true;
	else enum bool requiresPluginscript_1_0 = false;
	alias SupportedVersions(ApiType type : ApiType.android) = AliasSeq!([1, 1], );
	__gshared bool hasAndroid_1_1 = false;
	version(GDNativeRequireAndroid_1_1) enum bool requiresAndroid_1_1 = true;
	else enum bool requiresAndroid_1_1 = false;
	alias SupportedVersions(ApiType type : ApiType.arvr) = AliasSeq!([1, 1], [1, 2], );
	__gshared bool hasArvr_1_1 = false;
	version(GDNativeRequireArvr_1_1) enum bool requiresArvr_1_1 = true;
	else enum bool requiresArvr_1_1 = requiresArvr_1_2;
	__gshared bool hasArvr_1_2 = false;
	version(GDNativeRequireArvr_1_2) enum bool requiresArvr_1_2 = true;
	else enum bool requiresArvr_1_2 = false;
	alias SupportedVersions(ApiType type : ApiType.videodecoder) = AliasSeq!([0, 1], );
	__gshared bool hasVideodecoder_0_1 = false;
	version(GDNativeRequireVideodecoder_0_1) enum bool requiresVideodecoder_0_1 = true;
	else enum bool requiresVideodecoder_0_1 = false;
	alias SupportedVersions(ApiType type : ApiType.net) = AliasSeq!([3, 1], [3, 2], );
	__gshared bool hasNet_3_1 = false;
	version(GDNativeRequireNet_3_1) enum bool requiresNet_3_1 = true;
	else enum bool requiresNet_3_1 = requiresNet_3_2;
	__gshared bool hasNet_3_2 = false;
	version(GDNativeRequireNet_3_2) enum bool requiresNet_3_2 = true;
	else enum bool requiresNet_3_2 = false;
}
struct GDNativeVersion
{
	enum bool supportsCore(int major, int minor) = staticIndexOf!([major, minor], SupportedVersions!(ApiType.core)) != -1;
	static if(requiresCore_1_0) enum bool hasCore(int major : 1, int minor : 0) = true;
	else @property @nogc nothrow pragma(inline, true) static bool hasCore(int major : 1, int minor : 0)() { return hasCore_1_0; }
	static if(requiresCore_1_1) enum bool hasCore(int major : 1, int minor : 1) = true;
	else @property @nogc nothrow pragma(inline, true) static bool hasCore(int major : 1, int minor : 1)() { return hasCore_1_1; }
	static if(requiresCore_1_2) enum bool hasCore(int major : 1, int minor : 2) = true;
	else @property @nogc nothrow pragma(inline, true) static bool hasCore(int major : 1, int minor : 2)() { return hasCore_1_2; }
	static if(requiresCore_1_3) enum bool hasCore(int major : 1, int minor : 3) = true;
	else @property @nogc nothrow pragma(inline, true) static bool hasCore(int major : 1, int minor : 3)() { return hasCore_1_3; }
	@property @nogc nothrow static bool hasCore(int major, int minor)() if(!supportsCore!(major, minor))
	{
		static assert(0, versionError("Core", major, minor));
	}
	enum bool supportsNativescript(int major, int minor) = staticIndexOf!([major, minor], SupportedVersions!(ApiType.nativescript)) != -1;
	static if(requiresNativescript_1_0) enum bool hasNativescript(int major : 1, int minor : 0) = true;
	else @property @nogc nothrow pragma(inline, true) static bool hasNativescript(int major : 1, int minor : 0)() { return hasNativescript_1_0; }
	static if(requiresNativescript_1_1) enum bool hasNativescript(int major : 1, int minor : 1) = true;
	else @property @nogc nothrow pragma(inline, true) static bool hasNativescript(int major : 1, int minor : 1)() { return hasNativescript_1_1; }
	@property @nogc nothrow static bool hasNativescript(int major, int minor)() if(!supportsNativescript!(major, minor))
	{
		static assert(0, versionError("Nativescript", major, minor));
	}
	enum bool supportsPluginscript(int major, int minor) = staticIndexOf!([major, minor], SupportedVersions!(ApiType.pluginscript)) != -1;
	static if(requiresPluginscript_1_0) enum bool hasPluginscript(int major : 1, int minor : 0) = true;
	else @property @nogc nothrow pragma(inline, true) static bool hasPluginscript(int major : 1, int minor : 0)() { return hasPluginscript_1_0; }
	@property @nogc nothrow static bool hasPluginscript(int major, int minor)() if(!supportsPluginscript!(major, minor))
	{
		static assert(0, versionError("Pluginscript", major, minor));
	}
	enum bool supportsAndroid(int major, int minor) = staticIndexOf!([major, minor], SupportedVersions!(ApiType.android)) != -1;
	static if(requiresAndroid_1_1) enum bool hasAndroid(int major : 1, int minor : 1) = true;
	else @property @nogc nothrow pragma(inline, true) static bool hasAndroid(int major : 1, int minor : 1)() { return hasAndroid_1_1; }
	@property @nogc nothrow static bool hasAndroid(int major, int minor)() if(!supportsAndroid!(major, minor))
	{
		static assert(0, versionError("Android", major, minor));
	}
	enum bool supportsArvr(int major, int minor) = staticIndexOf!([major, minor], SupportedVersions!(ApiType.arvr)) != -1;
	static if(requiresArvr_1_1) enum bool hasArvr(int major : 1, int minor : 1) = true;
	else @property @nogc nothrow pragma(inline, true) static bool hasArvr(int major : 1, int minor : 1)() { return hasArvr_1_1; }
	static if(requiresArvr_1_2) enum bool hasArvr(int major : 1, int minor : 2) = true;
	else @property @nogc nothrow pragma(inline, true) static bool hasArvr(int major : 1, int minor : 2)() { return hasArvr_1_2; }
	@property @nogc nothrow static bool hasArvr(int major, int minor)() if(!supportsArvr!(major, minor))
	{
		static assert(0, versionError("Arvr", major, minor));
	}
	enum bool supportsVideodecoder(int major, int minor) = staticIndexOf!([major, minor], SupportedVersions!(ApiType.videodecoder)) != -1;
	static if(requiresVideodecoder_0_1) enum bool hasVideodecoder(int major : 0, int minor : 1) = true;
	else @property @nogc nothrow pragma(inline, true) static bool hasVideodecoder(int major : 0, int minor : 1)() { return hasVideodecoder_0_1; }
	@property @nogc nothrow static bool hasVideodecoder(int major, int minor)() if(!supportsVideodecoder!(major, minor))
	{
		static assert(0, versionError("Videodecoder", major, minor));
	}
	enum bool supportsNet(int major, int minor) = staticIndexOf!([major, minor], SupportedVersions!(ApiType.net)) != -1;
	static if(requiresNet_3_1) enum bool hasNet(int major : 3, int minor : 1) = true;
	else @property @nogc nothrow pragma(inline, true) static bool hasNet(int major : 3, int minor : 1)() { return hasNet_3_1; }
	static if(requiresNet_3_2) enum bool hasNet(int major : 3, int minor : 2) = true;
	else @property @nogc nothrow pragma(inline, true) static bool hasNet(int major : 3, int minor : 2)() { return hasNet_3_2; }
	@property @nogc nothrow static bool hasNet(int major, int minor)() if(!supportsNet!(major, minor))
	{
		static assert(0, versionError("Net", major, minor));
	}

			@nogc nothrow
			static bool opDispatch(string name)()
			{
				static assert(name.length > 3 && name[0..3] == "has",
					"Usage: `GDNativeVersion.has<Extension>!(<major>, <minor>)`");
				static assert(0, versionError(name[3..$], 1, 0));
			}
		}
private extern(C) @nogc nothrow
{
	alias da_godot_color_new_rgba = void function(godot_color * r_dest, const godot_real p_r, const godot_real p_g, const godot_real p_b, const godot_real p_a);
	alias da_godot_color_new_rgb = void function(godot_color * r_dest, const godot_real p_r, const godot_real p_g, const godot_real p_b);
	alias da_godot_color_get_r = godot_real function(const godot_color * p_self);
	alias da_godot_color_set_r = void function(godot_color * p_self, const godot_real r);
	alias da_godot_color_get_g = godot_real function(const godot_color * p_self);
	alias da_godot_color_set_g = void function(godot_color * p_self, const godot_real g);
	alias da_godot_color_get_b = godot_real function(const godot_color * p_self);
	alias da_godot_color_set_b = void function(godot_color * p_self, const godot_real b);
	alias da_godot_color_get_a = godot_real function(const godot_color * p_self);
	alias da_godot_color_set_a = void function(godot_color * p_self, const godot_real a);
	alias da_godot_color_get_h = godot_real function(const godot_color * p_self);
	alias da_godot_color_get_s = godot_real function(const godot_color * p_self);
	alias da_godot_color_get_v = godot_real function(const godot_color * p_self);
	alias da_godot_color_as_string = godot_string function(const godot_color * p_self);
	alias da_godot_color_to_rgba32 = godot_int function(const godot_color * p_self);
	alias da_godot_color_to_argb32 = godot_int function(const godot_color * p_self);
	alias da_godot_color_gray = godot_real function(const godot_color * p_self);
	alias da_godot_color_inverted = godot_color function(const godot_color * p_self);
	alias da_godot_color_contrasted = godot_color function(const godot_color * p_self);
	alias da_godot_color_linear_interpolate = godot_color function(const godot_color * p_self, const godot_color * p_b, const godot_real p_t);
	alias da_godot_color_blend = godot_color function(const godot_color * p_self, const godot_color * p_over);
	alias da_godot_color_to_html = godot_string function(const godot_color * p_self, const godot_bool p_with_alpha);
	alias da_godot_color_operator_equal = godot_bool function(const godot_color * p_self, const godot_color * p_b);
	alias da_godot_color_operator_less = godot_bool function(const godot_color * p_self, const godot_color * p_b);
	alias da_godot_vector2_new = void function(godot_vector2 * r_dest, const godot_real p_x, const godot_real p_y);
	alias da_godot_vector2_as_string = godot_string function(const godot_vector2 * p_self);
	alias da_godot_vector2_normalized = godot_vector2 function(const godot_vector2 * p_self);
	alias da_godot_vector2_length = godot_real function(const godot_vector2 * p_self);
	alias da_godot_vector2_angle = godot_real function(const godot_vector2 * p_self);
	alias da_godot_vector2_length_squared = godot_real function(const godot_vector2 * p_self);
	alias da_godot_vector2_is_normalized = godot_bool function(const godot_vector2 * p_self);
	alias da_godot_vector2_distance_to = godot_real function(const godot_vector2 * p_self, const godot_vector2 * p_to);
	alias da_godot_vector2_distance_squared_to = godot_real function(const godot_vector2 * p_self, const godot_vector2 * p_to);
	alias da_godot_vector2_angle_to = godot_real function(const godot_vector2 * p_self, const godot_vector2 * p_to);
	alias da_godot_vector2_angle_to_point = godot_real function(const godot_vector2 * p_self, const godot_vector2 * p_to);
	alias da_godot_vector2_linear_interpolate = godot_vector2 function(const godot_vector2 * p_self, const godot_vector2 * p_b, const godot_real p_t);
	alias da_godot_vector2_cubic_interpolate = godot_vector2 function(const godot_vector2 * p_self, const godot_vector2 * p_b, const godot_vector2 * p_pre_a, const godot_vector2 * p_post_b, const godot_real p_t);
	alias da_godot_vector2_rotated = godot_vector2 function(const godot_vector2 * p_self, const godot_real p_phi);
	alias da_godot_vector2_tangent = godot_vector2 function(const godot_vector2 * p_self);
	alias da_godot_vector2_floor = godot_vector2 function(const godot_vector2 * p_self);
	alias da_godot_vector2_snapped = godot_vector2 function(const godot_vector2 * p_self, const godot_vector2 * p_by);
	alias da_godot_vector2_aspect = godot_real function(const godot_vector2 * p_self);
	alias da_godot_vector2_dot = godot_real function(const godot_vector2 * p_self, const godot_vector2 * p_with);
	alias da_godot_vector2_slide = godot_vector2 function(const godot_vector2 * p_self, const godot_vector2 * p_n);
	alias da_godot_vector2_bounce = godot_vector2 function(const godot_vector2 * p_self, const godot_vector2 * p_n);
	alias da_godot_vector2_reflect = godot_vector2 function(const godot_vector2 * p_self, const godot_vector2 * p_n);
	alias da_godot_vector2_abs = godot_vector2 function(const godot_vector2 * p_self);
	alias da_godot_vector2_clamped = godot_vector2 function(const godot_vector2 * p_self, const godot_real p_length);
	alias da_godot_vector2_operator_add = godot_vector2 function(const godot_vector2 * p_self, const godot_vector2 * p_b);
	alias da_godot_vector2_operator_subtract = godot_vector2 function(const godot_vector2 * p_self, const godot_vector2 * p_b);
	alias da_godot_vector2_operator_multiply_vector = godot_vector2 function(const godot_vector2 * p_self, const godot_vector2 * p_b);
	alias da_godot_vector2_operator_multiply_scalar = godot_vector2 function(const godot_vector2 * p_self, const godot_real p_b);
	alias da_godot_vector2_operator_divide_vector = godot_vector2 function(const godot_vector2 * p_self, const godot_vector2 * p_b);
	alias da_godot_vector2_operator_divide_scalar = godot_vector2 function(const godot_vector2 * p_self, const godot_real p_b);
	alias da_godot_vector2_operator_equal = godot_bool function(const godot_vector2 * p_self, const godot_vector2 * p_b);
	alias da_godot_vector2_operator_less = godot_bool function(const godot_vector2 * p_self, const godot_vector2 * p_b);
	alias da_godot_vector2_operator_neg = godot_vector2 function(const godot_vector2 * p_self);
	alias da_godot_vector2_set_x = void function(godot_vector2 * p_self, const godot_real p_x);
	alias da_godot_vector2_set_y = void function(godot_vector2 * p_self, const godot_real p_y);
	alias da_godot_vector2_get_x = godot_real function(const godot_vector2 * p_self);
	alias da_godot_vector2_get_y = godot_real function(const godot_vector2 * p_self);
	alias da_godot_quat_new = void function(godot_quat * r_dest, const godot_real p_x, const godot_real p_y, const godot_real p_z, const godot_real p_w);
	alias da_godot_quat_new_with_axis_angle = void function(godot_quat * r_dest, const godot_vector3 * p_axis, const godot_real p_angle);
	alias da_godot_quat_get_x = godot_real function(const godot_quat * p_self);
	alias da_godot_quat_set_x = void function(godot_quat * p_self, const godot_real val);
	alias da_godot_quat_get_y = godot_real function(const godot_quat * p_self);
	alias da_godot_quat_set_y = void function(godot_quat * p_self, const godot_real val);
	alias da_godot_quat_get_z = godot_real function(const godot_quat * p_self);
	alias da_godot_quat_set_z = void function(godot_quat * p_self, const godot_real val);
	alias da_godot_quat_get_w = godot_real function(const godot_quat * p_self);
	alias da_godot_quat_set_w = void function(godot_quat * p_self, const godot_real val);
	alias da_godot_quat_as_string = godot_string function(const godot_quat * p_self);
	alias da_godot_quat_length = godot_real function(const godot_quat * p_self);
	alias da_godot_quat_length_squared = godot_real function(const godot_quat * p_self);
	alias da_godot_quat_normalized = godot_quat function(const godot_quat * p_self);
	alias da_godot_quat_is_normalized = godot_bool function(const godot_quat * p_self);
	alias da_godot_quat_inverse = godot_quat function(const godot_quat * p_self);
	alias da_godot_quat_dot = godot_real function(const godot_quat * p_self, const godot_quat * p_b);
	alias da_godot_quat_xform = godot_vector3 function(const godot_quat * p_self, const godot_vector3 * p_v);
	alias da_godot_quat_slerp = godot_quat function(const godot_quat * p_self, const godot_quat * p_b, const godot_real p_t);
	alias da_godot_quat_slerpni = godot_quat function(const godot_quat * p_self, const godot_quat * p_b, const godot_real p_t);
	alias da_godot_quat_cubic_slerp = godot_quat function(const godot_quat * p_self, const godot_quat * p_b, const godot_quat * p_pre_a, const godot_quat * p_post_b, const godot_real p_t);
	alias da_godot_quat_operator_multiply = godot_quat function(const godot_quat * p_self, const godot_real p_b);
	alias da_godot_quat_operator_add = godot_quat function(const godot_quat * p_self, const godot_quat * p_b);
	alias da_godot_quat_operator_subtract = godot_quat function(const godot_quat * p_self, const godot_quat * p_b);
	alias da_godot_quat_operator_divide = godot_quat function(const godot_quat * p_self, const godot_real p_b);
	alias da_godot_quat_operator_equal = godot_bool function(const godot_quat * p_self, const godot_quat * p_b);
	alias da_godot_quat_operator_neg = godot_quat function(const godot_quat * p_self);
	alias da_godot_basis_new_with_rows = void function(godot_basis * r_dest, const godot_vector3 * p_x_axis, const godot_vector3 * p_y_axis, const godot_vector3 * p_z_axis);
	alias da_godot_basis_new_with_axis_and_angle = void function(godot_basis * r_dest, const godot_vector3 * p_axis, const godot_real p_phi);
	alias da_godot_basis_new_with_euler = void function(godot_basis * r_dest, const godot_vector3 * p_euler);
	alias da_godot_basis_as_string = godot_string function(const godot_basis * p_self);
	alias da_godot_basis_inverse = godot_basis function(const godot_basis * p_self);
	alias da_godot_basis_transposed = godot_basis function(const godot_basis * p_self);
	alias da_godot_basis_orthonormalized = godot_basis function(const godot_basis * p_self);
	alias da_godot_basis_determinant = godot_real function(const godot_basis * p_self);
	alias da_godot_basis_rotated = godot_basis function(const godot_basis * p_self, const godot_vector3 * p_axis, const godot_real p_phi);
	alias da_godot_basis_scaled = godot_basis function(const godot_basis * p_self, const godot_vector3 * p_scale);
	alias da_godot_basis_get_scale = godot_vector3 function(const godot_basis * p_self);
	alias da_godot_basis_get_euler = godot_vector3 function(const godot_basis * p_self);
	alias da_godot_basis_tdotx = godot_real function(const godot_basis * p_self, const godot_vector3 * p_with);
	alias da_godot_basis_tdoty = godot_real function(const godot_basis * p_self, const godot_vector3 * p_with);
	alias da_godot_basis_tdotz = godot_real function(const godot_basis * p_self, const godot_vector3 * p_with);
	alias da_godot_basis_xform = godot_vector3 function(const godot_basis * p_self, const godot_vector3 * p_v);
	alias da_godot_basis_xform_inv = godot_vector3 function(const godot_basis * p_self, const godot_vector3 * p_v);
	alias da_godot_basis_get_orthogonal_index = godot_int function(const godot_basis * p_self);
	alias da_godot_basis_new = void function(godot_basis * r_dest);
	alias da_godot_basis_new_with_euler_quat = void function(godot_basis * r_dest, const godot_quat * p_euler);
	alias da_godot_basis_get_elements = void function(const godot_basis * p_self, godot_vector3 * p_elements);
	alias da_godot_basis_get_axis = godot_vector3 function(const godot_basis * p_self, const godot_int p_axis);
	alias da_godot_basis_set_axis = void function(godot_basis * p_self, const godot_int p_axis, const godot_vector3 * p_value);
	alias da_godot_basis_get_row = godot_vector3 function(const godot_basis * p_self, const godot_int p_row);
	alias da_godot_basis_set_row = void function(godot_basis * p_self, const godot_int p_row, const godot_vector3 * p_value);
	alias da_godot_basis_operator_equal = godot_bool function(const godot_basis * p_self, const godot_basis * p_b);
	alias da_godot_basis_operator_add = godot_basis function(const godot_basis * p_self, const godot_basis * p_b);
	alias da_godot_basis_operator_subtract = godot_basis function(const godot_basis * p_self, const godot_basis * p_b);
	alias da_godot_basis_operator_multiply_vector = godot_basis function(const godot_basis * p_self, const godot_basis * p_b);
	alias da_godot_basis_operator_multiply_scalar = godot_basis function(const godot_basis * p_self, const godot_real p_b);
	alias da_godot_vector3_new = void function(godot_vector3 * r_dest, const godot_real p_x, const godot_real p_y, const godot_real p_z);
	alias da_godot_vector3_as_string = godot_string function(const godot_vector3 * p_self);
	alias da_godot_vector3_min_axis = godot_int function(const godot_vector3 * p_self);
	alias da_godot_vector3_max_axis = godot_int function(const godot_vector3 * p_self);
	alias da_godot_vector3_length = godot_real function(const godot_vector3 * p_self);
	alias da_godot_vector3_length_squared = godot_real function(const godot_vector3 * p_self);
	alias da_godot_vector3_is_normalized = godot_bool function(const godot_vector3 * p_self);
	alias da_godot_vector3_normalized = godot_vector3 function(const godot_vector3 * p_self);
	alias da_godot_vector3_inverse = godot_vector3 function(const godot_vector3 * p_self);
	alias da_godot_vector3_snapped = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_by);
	alias da_godot_vector3_rotated = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_axis, const godot_real p_phi);
	alias da_godot_vector3_linear_interpolate = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_b, const godot_real p_t);
	alias da_godot_vector3_cubic_interpolate = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_b, const godot_vector3 * p_pre_a, const godot_vector3 * p_post_b, const godot_real p_t);
	alias da_godot_vector3_dot = godot_real function(const godot_vector3 * p_self, const godot_vector3 * p_b);
	alias da_godot_vector3_cross = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_b);
	alias da_godot_vector3_outer = godot_basis function(const godot_vector3 * p_self, const godot_vector3 * p_b);
	alias da_godot_vector3_to_diagonal_matrix = godot_basis function(const godot_vector3 * p_self);
	alias da_godot_vector3_abs = godot_vector3 function(const godot_vector3 * p_self);
	alias da_godot_vector3_floor = godot_vector3 function(const godot_vector3 * p_self);
	alias da_godot_vector3_ceil = godot_vector3 function(const godot_vector3 * p_self);
	alias da_godot_vector3_distance_to = godot_real function(const godot_vector3 * p_self, const godot_vector3 * p_b);
	alias da_godot_vector3_distance_squared_to = godot_real function(const godot_vector3 * p_self, const godot_vector3 * p_b);
	alias da_godot_vector3_angle_to = godot_real function(const godot_vector3 * p_self, const godot_vector3 * p_to);
	alias da_godot_vector3_slide = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_n);
	alias da_godot_vector3_bounce = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_n);
	alias da_godot_vector3_reflect = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_n);
	alias da_godot_vector3_operator_add = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_b);
	alias da_godot_vector3_operator_subtract = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_b);
	alias da_godot_vector3_operator_multiply_vector = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_b);
	alias da_godot_vector3_operator_multiply_scalar = godot_vector3 function(const godot_vector3 * p_self, const godot_real p_b);
	alias da_godot_vector3_operator_divide_vector = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_b);
	alias da_godot_vector3_operator_divide_scalar = godot_vector3 function(const godot_vector3 * p_self, const godot_real p_b);
	alias da_godot_vector3_operator_equal = godot_bool function(const godot_vector3 * p_self, const godot_vector3 * p_b);
	alias da_godot_vector3_operator_less = godot_bool function(const godot_vector3 * p_self, const godot_vector3 * p_b);
	alias da_godot_vector3_operator_neg = godot_vector3 function(const godot_vector3 * p_self);
	alias da_godot_vector3_set_axis = void function(godot_vector3 * p_self, const godot_vector3_axis p_axis, const godot_real p_val);
	alias da_godot_vector3_get_axis = godot_real function(const godot_vector3 * p_self, const godot_vector3_axis p_axis);
	alias da_godot_pool_byte_array_new = void function(godot_pool_byte_array * r_dest);
	alias da_godot_pool_byte_array_new_copy = void function(godot_pool_byte_array * r_dest, const godot_pool_byte_array * p_src);
	alias da_godot_pool_byte_array_new_with_array = void function(godot_pool_byte_array * r_dest, const godot_array * p_a);
	alias da_godot_pool_byte_array_append = void function(godot_pool_byte_array * p_self, const uint8_t p_data);
	alias da_godot_pool_byte_array_append_array = void function(godot_pool_byte_array * p_self, const godot_pool_byte_array * p_array);
	alias da_godot_pool_byte_array_insert = godot_error function(godot_pool_byte_array * p_self, const godot_int p_idx, const uint8_t p_data);
	alias da_godot_pool_byte_array_invert = void function(godot_pool_byte_array * p_self);
	alias da_godot_pool_byte_array_push_back = void function(godot_pool_byte_array * p_self, const uint8_t p_data);
	alias da_godot_pool_byte_array_remove = void function(godot_pool_byte_array * p_self, const godot_int p_idx);
	alias da_godot_pool_byte_array_resize = void function(godot_pool_byte_array * p_self, const godot_int p_size);
	alias da_godot_pool_byte_array_read = godot_pool_byte_array_read_access * function(const godot_pool_byte_array * p_self);
	alias da_godot_pool_byte_array_write = godot_pool_byte_array_write_access * function(godot_pool_byte_array * p_self);
	alias da_godot_pool_byte_array_set = void function(godot_pool_byte_array * p_self, const godot_int p_idx, const uint8_t p_data);
	alias da_godot_pool_byte_array_get = uint8_t function(const godot_pool_byte_array * p_self, const godot_int p_idx);
	alias da_godot_pool_byte_array_size = godot_int function(const godot_pool_byte_array * p_self);
	alias da_godot_pool_byte_array_destroy = void function(godot_pool_byte_array * p_self);
	alias da_godot_pool_int_array_new = void function(godot_pool_int_array * r_dest);
	alias da_godot_pool_int_array_new_copy = void function(godot_pool_int_array * r_dest, const godot_pool_int_array * p_src);
	alias da_godot_pool_int_array_new_with_array = void function(godot_pool_int_array * r_dest, const godot_array * p_a);
	alias da_godot_pool_int_array_append = void function(godot_pool_int_array * p_self, const godot_int p_data);
	alias da_godot_pool_int_array_append_array = void function(godot_pool_int_array * p_self, const godot_pool_int_array * p_array);
	alias da_godot_pool_int_array_insert = godot_error function(godot_pool_int_array * p_self, const godot_int p_idx, const godot_int p_data);
	alias da_godot_pool_int_array_invert = void function(godot_pool_int_array * p_self);
	alias da_godot_pool_int_array_push_back = void function(godot_pool_int_array * p_self, const godot_int p_data);
	alias da_godot_pool_int_array_remove = void function(godot_pool_int_array * p_self, const godot_int p_idx);
	alias da_godot_pool_int_array_resize = void function(godot_pool_int_array * p_self, const godot_int p_size);
	alias da_godot_pool_int_array_read = godot_pool_int_array_read_access * function(const godot_pool_int_array * p_self);
	alias da_godot_pool_int_array_write = godot_pool_int_array_write_access * function(godot_pool_int_array * p_self);
	alias da_godot_pool_int_array_set = void function(godot_pool_int_array * p_self, const godot_int p_idx, const godot_int p_data);
	alias da_godot_pool_int_array_get = godot_int function(const godot_pool_int_array * p_self, const godot_int p_idx);
	alias da_godot_pool_int_array_size = godot_int function(const godot_pool_int_array * p_self);
	alias da_godot_pool_int_array_destroy = void function(godot_pool_int_array * p_self);
	alias da_godot_pool_real_array_new = void function(godot_pool_real_array * r_dest);
	alias da_godot_pool_real_array_new_copy = void function(godot_pool_real_array * r_dest, const godot_pool_real_array * p_src);
	alias da_godot_pool_real_array_new_with_array = void function(godot_pool_real_array * r_dest, const godot_array * p_a);
	alias da_godot_pool_real_array_append = void function(godot_pool_real_array * p_self, const godot_real p_data);
	alias da_godot_pool_real_array_append_array = void function(godot_pool_real_array * p_self, const godot_pool_real_array * p_array);
	alias da_godot_pool_real_array_insert = godot_error function(godot_pool_real_array * p_self, const godot_int p_idx, const godot_real p_data);
	alias da_godot_pool_real_array_invert = void function(godot_pool_real_array * p_self);
	alias da_godot_pool_real_array_push_back = void function(godot_pool_real_array * p_self, const godot_real p_data);
	alias da_godot_pool_real_array_remove = void function(godot_pool_real_array * p_self, const godot_int p_idx);
	alias da_godot_pool_real_array_resize = void function(godot_pool_real_array * p_self, const godot_int p_size);
	alias da_godot_pool_real_array_read = godot_pool_real_array_read_access * function(const godot_pool_real_array * p_self);
	alias da_godot_pool_real_array_write = godot_pool_real_array_write_access * function(godot_pool_real_array * p_self);
	alias da_godot_pool_real_array_set = void function(godot_pool_real_array * p_self, const godot_int p_idx, const godot_real p_data);
	alias da_godot_pool_real_array_get = godot_real function(const godot_pool_real_array * p_self, const godot_int p_idx);
	alias da_godot_pool_real_array_size = godot_int function(const godot_pool_real_array * p_self);
	alias da_godot_pool_real_array_destroy = void function(godot_pool_real_array * p_self);
	alias da_godot_pool_string_array_new = void function(godot_pool_string_array * r_dest);
	alias da_godot_pool_string_array_new_copy = void function(godot_pool_string_array * r_dest, const godot_pool_string_array * p_src);
	alias da_godot_pool_string_array_new_with_array = void function(godot_pool_string_array * r_dest, const godot_array * p_a);
	alias da_godot_pool_string_array_append = void function(godot_pool_string_array * p_self, const godot_string * p_data);
	alias da_godot_pool_string_array_append_array = void function(godot_pool_string_array * p_self, const godot_pool_string_array * p_array);
	alias da_godot_pool_string_array_insert = godot_error function(godot_pool_string_array * p_self, const godot_int p_idx, const godot_string * p_data);
	alias da_godot_pool_string_array_invert = void function(godot_pool_string_array * p_self);
	alias da_godot_pool_string_array_push_back = void function(godot_pool_string_array * p_self, const godot_string * p_data);
	alias da_godot_pool_string_array_remove = void function(godot_pool_string_array * p_self, const godot_int p_idx);
	alias da_godot_pool_string_array_resize = void function(godot_pool_string_array * p_self, const godot_int p_size);
	alias da_godot_pool_string_array_read = godot_pool_string_array_read_access * function(const godot_pool_string_array * p_self);
	alias da_godot_pool_string_array_write = godot_pool_string_array_write_access * function(godot_pool_string_array * p_self);
	alias da_godot_pool_string_array_set = void function(godot_pool_string_array * p_self, const godot_int p_idx, const godot_string * p_data);
	alias da_godot_pool_string_array_get = godot_string function(const godot_pool_string_array * p_self, const godot_int p_idx);
	alias da_godot_pool_string_array_size = godot_int function(const godot_pool_string_array * p_self);
	alias da_godot_pool_string_array_destroy = void function(godot_pool_string_array * p_self);
	alias da_godot_pool_vector2_array_new = void function(godot_pool_vector2_array * r_dest);
	alias da_godot_pool_vector2_array_new_copy = void function(godot_pool_vector2_array * r_dest, const godot_pool_vector2_array * p_src);
	alias da_godot_pool_vector2_array_new_with_array = void function(godot_pool_vector2_array * r_dest, const godot_array * p_a);
	alias da_godot_pool_vector2_array_append = void function(godot_pool_vector2_array * p_self, const godot_vector2 * p_data);
	alias da_godot_pool_vector2_array_append_array = void function(godot_pool_vector2_array * p_self, const godot_pool_vector2_array * p_array);
	alias da_godot_pool_vector2_array_insert = godot_error function(godot_pool_vector2_array * p_self, const godot_int p_idx, const godot_vector2 * p_data);
	alias da_godot_pool_vector2_array_invert = void function(godot_pool_vector2_array * p_self);
	alias da_godot_pool_vector2_array_push_back = void function(godot_pool_vector2_array * p_self, const godot_vector2 * p_data);
	alias da_godot_pool_vector2_array_remove = void function(godot_pool_vector2_array * p_self, const godot_int p_idx);
	alias da_godot_pool_vector2_array_resize = void function(godot_pool_vector2_array * p_self, const godot_int p_size);
	alias da_godot_pool_vector2_array_read = godot_pool_vector2_array_read_access * function(const godot_pool_vector2_array * p_self);
	alias da_godot_pool_vector2_array_write = godot_pool_vector2_array_write_access * function(godot_pool_vector2_array * p_self);
	alias da_godot_pool_vector2_array_set = void function(godot_pool_vector2_array * p_self, const godot_int p_idx, const godot_vector2 * p_data);
	alias da_godot_pool_vector2_array_get = godot_vector2 function(const godot_pool_vector2_array * p_self, const godot_int p_idx);
	alias da_godot_pool_vector2_array_size = godot_int function(const godot_pool_vector2_array * p_self);
	alias da_godot_pool_vector2_array_destroy = void function(godot_pool_vector2_array * p_self);
	alias da_godot_pool_vector3_array_new = void function(godot_pool_vector3_array * r_dest);
	alias da_godot_pool_vector3_array_new_copy = void function(godot_pool_vector3_array * r_dest, const godot_pool_vector3_array * p_src);
	alias da_godot_pool_vector3_array_new_with_array = void function(godot_pool_vector3_array * r_dest, const godot_array * p_a);
	alias da_godot_pool_vector3_array_append = void function(godot_pool_vector3_array * p_self, const godot_vector3 * p_data);
	alias da_godot_pool_vector3_array_append_array = void function(godot_pool_vector3_array * p_self, const godot_pool_vector3_array * p_array);
	alias da_godot_pool_vector3_array_insert = godot_error function(godot_pool_vector3_array * p_self, const godot_int p_idx, const godot_vector3 * p_data);
	alias da_godot_pool_vector3_array_invert = void function(godot_pool_vector3_array * p_self);
	alias da_godot_pool_vector3_array_push_back = void function(godot_pool_vector3_array * p_self, const godot_vector3 * p_data);
	alias da_godot_pool_vector3_array_remove = void function(godot_pool_vector3_array * p_self, const godot_int p_idx);
	alias da_godot_pool_vector3_array_resize = void function(godot_pool_vector3_array * p_self, const godot_int p_size);
	alias da_godot_pool_vector3_array_read = godot_pool_vector3_array_read_access * function(const godot_pool_vector3_array * p_self);
	alias da_godot_pool_vector3_array_write = godot_pool_vector3_array_write_access * function(godot_pool_vector3_array * p_self);
	alias da_godot_pool_vector3_array_set = void function(godot_pool_vector3_array * p_self, const godot_int p_idx, const godot_vector3 * p_data);
	alias da_godot_pool_vector3_array_get = godot_vector3 function(const godot_pool_vector3_array * p_self, const godot_int p_idx);
	alias da_godot_pool_vector3_array_size = godot_int function(const godot_pool_vector3_array * p_self);
	alias da_godot_pool_vector3_array_destroy = void function(godot_pool_vector3_array * p_self);
	alias da_godot_pool_color_array_new = void function(godot_pool_color_array * r_dest);
	alias da_godot_pool_color_array_new_copy = void function(godot_pool_color_array * r_dest, const godot_pool_color_array * p_src);
	alias da_godot_pool_color_array_new_with_array = void function(godot_pool_color_array * r_dest, const godot_array * p_a);
	alias da_godot_pool_color_array_append = void function(godot_pool_color_array * p_self, const godot_color * p_data);
	alias da_godot_pool_color_array_append_array = void function(godot_pool_color_array * p_self, const godot_pool_color_array * p_array);
	alias da_godot_pool_color_array_insert = godot_error function(godot_pool_color_array * p_self, const godot_int p_idx, const godot_color * p_data);
	alias da_godot_pool_color_array_invert = void function(godot_pool_color_array * p_self);
	alias da_godot_pool_color_array_push_back = void function(godot_pool_color_array * p_self, const godot_color * p_data);
	alias da_godot_pool_color_array_remove = void function(godot_pool_color_array * p_self, const godot_int p_idx);
	alias da_godot_pool_color_array_resize = void function(godot_pool_color_array * p_self, const godot_int p_size);
	alias da_godot_pool_color_array_read = godot_pool_color_array_read_access * function(const godot_pool_color_array * p_self);
	alias da_godot_pool_color_array_write = godot_pool_color_array_write_access * function(godot_pool_color_array * p_self);
	alias da_godot_pool_color_array_set = void function(godot_pool_color_array * p_self, const godot_int p_idx, const godot_color * p_data);
	alias da_godot_pool_color_array_get = godot_color function(const godot_pool_color_array * p_self, const godot_int p_idx);
	alias da_godot_pool_color_array_size = godot_int function(const godot_pool_color_array * p_self);
	alias da_godot_pool_color_array_destroy = void function(godot_pool_color_array * p_self);
	alias da_godot_pool_byte_array_read_access_copy = godot_pool_byte_array_read_access * function(const godot_pool_byte_array_read_access * p_read);
	alias da_godot_pool_byte_array_read_access_ptr = const uint8_t * function(const godot_pool_byte_array_read_access * p_read);
	alias da_godot_pool_byte_array_read_access_operator_assign = void function(godot_pool_byte_array_read_access * p_read, godot_pool_byte_array_read_access * p_other);
	alias da_godot_pool_byte_array_read_access_destroy = void function(godot_pool_byte_array_read_access * p_read);
	alias da_godot_pool_int_array_read_access_copy = godot_pool_int_array_read_access * function(const godot_pool_int_array_read_access * p_read);
	alias da_godot_pool_int_array_read_access_ptr = const godot_int * function(const godot_pool_int_array_read_access * p_read);
	alias da_godot_pool_int_array_read_access_operator_assign = void function(godot_pool_int_array_read_access * p_read, godot_pool_int_array_read_access * p_other);
	alias da_godot_pool_int_array_read_access_destroy = void function(godot_pool_int_array_read_access * p_read);
	alias da_godot_pool_real_array_read_access_copy = godot_pool_real_array_read_access * function(const godot_pool_real_array_read_access * p_read);
	alias da_godot_pool_real_array_read_access_ptr = const godot_real * function(const godot_pool_real_array_read_access * p_read);
	alias da_godot_pool_real_array_read_access_operator_assign = void function(godot_pool_real_array_read_access * p_read, godot_pool_real_array_read_access * p_other);
	alias da_godot_pool_real_array_read_access_destroy = void function(godot_pool_real_array_read_access * p_read);
	alias da_godot_pool_string_array_read_access_copy = godot_pool_string_array_read_access * function(const godot_pool_string_array_read_access * p_read);
	alias da_godot_pool_string_array_read_access_ptr = const godot_string * function(const godot_pool_string_array_read_access * p_read);
	alias da_godot_pool_string_array_read_access_operator_assign = void function(godot_pool_string_array_read_access * p_read, godot_pool_string_array_read_access * p_other);
	alias da_godot_pool_string_array_read_access_destroy = void function(godot_pool_string_array_read_access * p_read);
	alias da_godot_pool_vector2_array_read_access_copy = godot_pool_vector2_array_read_access * function(const godot_pool_vector2_array_read_access * p_read);
	alias da_godot_pool_vector2_array_read_access_ptr = const godot_vector2 * function(const godot_pool_vector2_array_read_access * p_read);
	alias da_godot_pool_vector2_array_read_access_operator_assign = void function(godot_pool_vector2_array_read_access * p_read, godot_pool_vector2_array_read_access * p_other);
	alias da_godot_pool_vector2_array_read_access_destroy = void function(godot_pool_vector2_array_read_access * p_read);
	alias da_godot_pool_vector3_array_read_access_copy = godot_pool_vector3_array_read_access * function(const godot_pool_vector3_array_read_access * p_read);
	alias da_godot_pool_vector3_array_read_access_ptr = const godot_vector3 * function(const godot_pool_vector3_array_read_access * p_read);
	alias da_godot_pool_vector3_array_read_access_operator_assign = void function(godot_pool_vector3_array_read_access * p_read, godot_pool_vector3_array_read_access * p_other);
	alias da_godot_pool_vector3_array_read_access_destroy = void function(godot_pool_vector3_array_read_access * p_read);
	alias da_godot_pool_color_array_read_access_copy = godot_pool_color_array_read_access * function(const godot_pool_color_array_read_access * p_read);
	alias da_godot_pool_color_array_read_access_ptr = const godot_color * function(const godot_pool_color_array_read_access * p_read);
	alias da_godot_pool_color_array_read_access_operator_assign = void function(godot_pool_color_array_read_access * p_read, godot_pool_color_array_read_access * p_other);
	alias da_godot_pool_color_array_read_access_destroy = void function(godot_pool_color_array_read_access * p_read);
	alias da_godot_pool_byte_array_write_access_copy = godot_pool_byte_array_write_access * function(const godot_pool_byte_array_write_access * p_write);
	alias da_godot_pool_byte_array_write_access_ptr = uint8_t * function(const godot_pool_byte_array_write_access * p_write);
	alias da_godot_pool_byte_array_write_access_operator_assign = void function(godot_pool_byte_array_write_access * p_write, godot_pool_byte_array_write_access * p_other);
	alias da_godot_pool_byte_array_write_access_destroy = void function(godot_pool_byte_array_write_access * p_write);
	alias da_godot_pool_int_array_write_access_copy = godot_pool_int_array_write_access * function(const godot_pool_int_array_write_access * p_write);
	alias da_godot_pool_int_array_write_access_ptr = godot_int * function(const godot_pool_int_array_write_access * p_write);
	alias da_godot_pool_int_array_write_access_operator_assign = void function(godot_pool_int_array_write_access * p_write, godot_pool_int_array_write_access * p_other);
	alias da_godot_pool_int_array_write_access_destroy = void function(godot_pool_int_array_write_access * p_write);
	alias da_godot_pool_real_array_write_access_copy = godot_pool_real_array_write_access * function(const godot_pool_real_array_write_access * p_write);
	alias da_godot_pool_real_array_write_access_ptr = godot_real * function(const godot_pool_real_array_write_access * p_write);
	alias da_godot_pool_real_array_write_access_operator_assign = void function(godot_pool_real_array_write_access * p_write, godot_pool_real_array_write_access * p_other);
	alias da_godot_pool_real_array_write_access_destroy = void function(godot_pool_real_array_write_access * p_write);
	alias da_godot_pool_string_array_write_access_copy = godot_pool_string_array_write_access * function(const godot_pool_string_array_write_access * p_write);
	alias da_godot_pool_string_array_write_access_ptr = godot_string * function(const godot_pool_string_array_write_access * p_write);
	alias da_godot_pool_string_array_write_access_operator_assign = void function(godot_pool_string_array_write_access * p_write, godot_pool_string_array_write_access * p_other);
	alias da_godot_pool_string_array_write_access_destroy = void function(godot_pool_string_array_write_access * p_write);
	alias da_godot_pool_vector2_array_write_access_copy = godot_pool_vector2_array_write_access * function(const godot_pool_vector2_array_write_access * p_write);
	alias da_godot_pool_vector2_array_write_access_ptr = godot_vector2 * function(const godot_pool_vector2_array_write_access * p_write);
	alias da_godot_pool_vector2_array_write_access_operator_assign = void function(godot_pool_vector2_array_write_access * p_write, godot_pool_vector2_array_write_access * p_other);
	alias da_godot_pool_vector2_array_write_access_destroy = void function(godot_pool_vector2_array_write_access * p_write);
	alias da_godot_pool_vector3_array_write_access_copy = godot_pool_vector3_array_write_access * function(const godot_pool_vector3_array_write_access * p_write);
	alias da_godot_pool_vector3_array_write_access_ptr = godot_vector3 * function(const godot_pool_vector3_array_write_access * p_write);
	alias da_godot_pool_vector3_array_write_access_operator_assign = void function(godot_pool_vector3_array_write_access * p_write, godot_pool_vector3_array_write_access * p_other);
	alias da_godot_pool_vector3_array_write_access_destroy = void function(godot_pool_vector3_array_write_access * p_write);
	alias da_godot_pool_color_array_write_access_copy = godot_pool_color_array_write_access * function(const godot_pool_color_array_write_access * p_write);
	alias da_godot_pool_color_array_write_access_ptr = godot_color * function(const godot_pool_color_array_write_access * p_write);
	alias da_godot_pool_color_array_write_access_operator_assign = void function(godot_pool_color_array_write_access * p_write, godot_pool_color_array_write_access * p_other);
	alias da_godot_pool_color_array_write_access_destroy = void function(godot_pool_color_array_write_access * p_write);
	alias da_godot_array_new = void function(godot_array * r_dest);
	alias da_godot_array_new_copy = void function(godot_array * r_dest, const godot_array * p_src);
	alias da_godot_array_new_pool_color_array = void function(godot_array * r_dest, const godot_pool_color_array * p_pca);
	alias da_godot_array_new_pool_vector3_array = void function(godot_array * r_dest, const godot_pool_vector3_array * p_pv3a);
	alias da_godot_array_new_pool_vector2_array = void function(godot_array * r_dest, const godot_pool_vector2_array * p_pv2a);
	alias da_godot_array_new_pool_string_array = void function(godot_array * r_dest, const godot_pool_string_array * p_psa);
	alias da_godot_array_new_pool_real_array = void function(godot_array * r_dest, const godot_pool_real_array * p_pra);
	alias da_godot_array_new_pool_int_array = void function(godot_array * r_dest, const godot_pool_int_array * p_pia);
	alias da_godot_array_new_pool_byte_array = void function(godot_array * r_dest, const godot_pool_byte_array * p_pba);
	alias da_godot_array_set = void function(godot_array * p_self, const godot_int p_idx, const godot_variant * p_value);
	alias da_godot_array_get = godot_variant function(const godot_array * p_self, const godot_int p_idx);
	alias da_godot_array_operator_index = godot_variant * function(godot_array * p_self, const godot_int p_idx);
	alias da_godot_array_operator_index_const = const godot_variant * function(const godot_array * p_self, const godot_int p_idx);
	alias da_godot_array_append = void function(godot_array * p_self, const godot_variant * p_value);
	alias da_godot_array_clear = void function(godot_array * p_self);
	alias da_godot_array_count = godot_int function(const godot_array * p_self, const godot_variant * p_value);
	alias da_godot_array_empty = godot_bool function(const godot_array * p_self);
	alias da_godot_array_erase = void function(godot_array * p_self, const godot_variant * p_value);
	alias da_godot_array_front = godot_variant function(const godot_array * p_self);
	alias da_godot_array_back = godot_variant function(const godot_array * p_self);
	alias da_godot_array_find = godot_int function(const godot_array * p_self, const godot_variant * p_what, const godot_int p_from);
	alias da_godot_array_find_last = godot_int function(const godot_array * p_self, const godot_variant * p_what);
	alias da_godot_array_has = godot_bool function(const godot_array * p_self, const godot_variant * p_value);
	alias da_godot_array_hash = godot_int function(const godot_array * p_self);
	alias da_godot_array_insert = void function(godot_array * p_self, const godot_int p_pos, const godot_variant * p_value);
	alias da_godot_array_invert = void function(godot_array * p_self);
	alias da_godot_array_pop_back = godot_variant function(godot_array * p_self);
	alias da_godot_array_pop_front = godot_variant function(godot_array * p_self);
	alias da_godot_array_push_back = void function(godot_array * p_self, const godot_variant * p_value);
	alias da_godot_array_push_front = void function(godot_array * p_self, const godot_variant * p_value);
	alias da_godot_array_remove = void function(godot_array * p_self, const godot_int p_idx);
	alias da_godot_array_resize = void function(godot_array * p_self, const godot_int p_size);
	alias da_godot_array_rfind = godot_int function(const godot_array * p_self, const godot_variant * p_what, const godot_int p_from);
	alias da_godot_array_size = godot_int function(const godot_array * p_self);
	alias da_godot_array_sort = void function(godot_array * p_self);
	alias da_godot_array_sort_custom = void function(godot_array * p_self, godot_object  p_obj, const godot_string * p_func);
	alias da_godot_array_bsearch = godot_int function(godot_array * p_self, const godot_variant * p_value, const godot_bool p_before);
	alias da_godot_array_bsearch_custom = godot_int function(godot_array * p_self, const godot_variant * p_value, godot_object  p_obj, const godot_string * p_func, const godot_bool p_before);
	alias da_godot_array_destroy = void function(godot_array * p_self);
	alias da_godot_dictionary_new = void function(godot_dictionary * r_dest);
	alias da_godot_dictionary_new_copy = void function(godot_dictionary * r_dest, const godot_dictionary * p_src);
	alias da_godot_dictionary_destroy = void function(godot_dictionary * p_self);
	alias da_godot_dictionary_size = godot_int function(const godot_dictionary * p_self);
	alias da_godot_dictionary_empty = godot_bool function(const godot_dictionary * p_self);
	alias da_godot_dictionary_clear = void function(godot_dictionary * p_self);
	alias da_godot_dictionary_has = godot_bool function(const godot_dictionary * p_self, const godot_variant * p_key);
	alias da_godot_dictionary_has_all = godot_bool function(const godot_dictionary * p_self, const godot_array * p_keys);
	alias da_godot_dictionary_erase = void function(godot_dictionary * p_self, const godot_variant * p_key);
	alias da_godot_dictionary_hash = godot_int function(const godot_dictionary * p_self);
	alias da_godot_dictionary_keys = godot_array function(const godot_dictionary * p_self);
	alias da_godot_dictionary_values = godot_array function(const godot_dictionary * p_self);
	alias da_godot_dictionary_get = godot_variant function(const godot_dictionary * p_self, const godot_variant * p_key);
	alias da_godot_dictionary_set = void function(godot_dictionary * p_self, const godot_variant * p_key, const godot_variant * p_value);
	alias da_godot_dictionary_operator_index = godot_variant * function(godot_dictionary * p_self, const godot_variant * p_key);
	alias da_godot_dictionary_operator_index_const = const godot_variant * function(const godot_dictionary * p_self, const godot_variant * p_key);
	alias da_godot_dictionary_next = godot_variant * function(const godot_dictionary * p_self, const godot_variant * p_key);
	alias da_godot_dictionary_operator_equal = godot_bool function(const godot_dictionary * p_self, const godot_dictionary * p_b);
	alias da_godot_dictionary_to_json = godot_string function(const godot_dictionary * p_self);
	alias da_godot_node_path_new = void function(godot_node_path * r_dest, const godot_string * p_from);
	alias da_godot_node_path_new_copy = void function(godot_node_path * r_dest, const godot_node_path * p_src);
	alias da_godot_node_path_destroy = void function(godot_node_path * p_self);
	alias da_godot_node_path_as_string = godot_string function(const godot_node_path * p_self);
	alias da_godot_node_path_is_absolute = godot_bool function(const godot_node_path * p_self);
	alias da_godot_node_path_get_name_count = godot_int function(const godot_node_path * p_self);
	alias da_godot_node_path_get_name = godot_string function(const godot_node_path * p_self, const godot_int p_idx);
	alias da_godot_node_path_get_subname_count = godot_int function(const godot_node_path * p_self);
	alias da_godot_node_path_get_subname = godot_string function(const godot_node_path * p_self, const godot_int p_idx);
	alias da_godot_node_path_get_concatenated_subnames = godot_string function(const godot_node_path * p_self);
	alias da_godot_node_path_is_empty = godot_bool function(const godot_node_path * p_self);
	alias da_godot_node_path_operator_equal = godot_bool function(const godot_node_path * p_self, const godot_node_path * p_b);
	alias da_godot_plane_new_with_reals = void function(godot_plane * r_dest, const godot_real p_a, const godot_real p_b, const godot_real p_c, const godot_real p_d);
	alias da_godot_plane_new_with_vectors = void function(godot_plane * r_dest, const godot_vector3 * p_v1, const godot_vector3 * p_v2, const godot_vector3 * p_v3);
	alias da_godot_plane_new_with_normal = void function(godot_plane * r_dest, const godot_vector3 * p_normal, const godot_real p_d);
	alias da_godot_plane_as_string = godot_string function(const godot_plane * p_self);
	alias da_godot_plane_normalized = godot_plane function(const godot_plane * p_self);
	alias da_godot_plane_center = godot_vector3 function(const godot_plane * p_self);
	alias da_godot_plane_get_any_point = godot_vector3 function(const godot_plane * p_self);
	alias da_godot_plane_is_point_over = godot_bool function(const godot_plane * p_self, const godot_vector3 * p_point);
	alias da_godot_plane_distance_to = godot_real function(const godot_plane * p_self, const godot_vector3 * p_point);
	alias da_godot_plane_has_point = godot_bool function(const godot_plane * p_self, const godot_vector3 * p_point, const godot_real p_epsilon);
	alias da_godot_plane_project = godot_vector3 function(const godot_plane * p_self, const godot_vector3 * p_point);
	alias da_godot_plane_intersect_3 = godot_bool function(const godot_plane * p_self, godot_vector3 * r_dest, const godot_plane * p_b, const godot_plane * p_c);
	alias da_godot_plane_intersects_ray = godot_bool function(const godot_plane * p_self, godot_vector3 * r_dest, const godot_vector3 * p_from, const godot_vector3 * p_dir);
	alias da_godot_plane_intersects_segment = godot_bool function(const godot_plane * p_self, godot_vector3 * r_dest, const godot_vector3 * p_begin, const godot_vector3 * p_end);
	alias da_godot_plane_operator_neg = godot_plane function(const godot_plane * p_self);
	alias da_godot_plane_operator_equal = godot_bool function(const godot_plane * p_self, const godot_plane * p_b);
	alias da_godot_plane_set_normal = void function(godot_plane * p_self, const godot_vector3 * p_normal);
	alias da_godot_plane_get_normal = godot_vector3 function(const godot_plane * p_self);
	alias da_godot_plane_get_d = godot_real function(const godot_plane * p_self);
	alias da_godot_plane_set_d = void function(godot_plane * p_self, const godot_real p_d);
	alias da_godot_rect2_new_with_position_and_size = void function(godot_rect2 * r_dest, const godot_vector2 * p_pos, const godot_vector2 * p_size);
	alias da_godot_rect2_new = void function(godot_rect2 * r_dest, const godot_real p_x, const godot_real p_y, const godot_real p_width, const godot_real p_height);
	alias da_godot_rect2_as_string = godot_string function(const godot_rect2 * p_self);
	alias da_godot_rect2_get_area = godot_real function(const godot_rect2 * p_self);
	alias da_godot_rect2_intersects = godot_bool function(const godot_rect2 * p_self, const godot_rect2 * p_b);
	alias da_godot_rect2_encloses = godot_bool function(const godot_rect2 * p_self, const godot_rect2 * p_b);
	alias da_godot_rect2_has_no_area = godot_bool function(const godot_rect2 * p_self);
	alias da_godot_rect2_clip = godot_rect2 function(const godot_rect2 * p_self, const godot_rect2 * p_b);
	alias da_godot_rect2_merge = godot_rect2 function(const godot_rect2 * p_self, const godot_rect2 * p_b);
	alias da_godot_rect2_has_point = godot_bool function(const godot_rect2 * p_self, const godot_vector2 * p_point);
	alias da_godot_rect2_grow = godot_rect2 function(const godot_rect2 * p_self, const godot_real p_by);
	alias da_godot_rect2_expand = godot_rect2 function(const godot_rect2 * p_self, const godot_vector2 * p_to);
	alias da_godot_rect2_operator_equal = godot_bool function(const godot_rect2 * p_self, const godot_rect2 * p_b);
	alias da_godot_rect2_get_position = godot_vector2 function(const godot_rect2 * p_self);
	alias da_godot_rect2_get_size = godot_vector2 function(const godot_rect2 * p_self);
	alias da_godot_rect2_set_position = void function(godot_rect2 * p_self, const godot_vector2 * p_pos);
	alias da_godot_rect2_set_size = void function(godot_rect2 * p_self, const godot_vector2 * p_size);
	alias da_godot_aabb_new = void function(godot_aabb * r_dest, const godot_vector3 * p_pos, const godot_vector3 * p_size);
	alias da_godot_aabb_get_position = godot_vector3 function(const godot_aabb * p_self);
	alias da_godot_aabb_set_position = void function(const godot_aabb * p_self, const godot_vector3 * p_v);
	alias da_godot_aabb_get_size = godot_vector3 function(const godot_aabb * p_self);
	alias da_godot_aabb_set_size = void function(const godot_aabb * p_self, const godot_vector3 * p_v);
	alias da_godot_aabb_as_string = godot_string function(const godot_aabb * p_self);
	alias da_godot_aabb_get_area = godot_real function(const godot_aabb * p_self);
	alias da_godot_aabb_has_no_area = godot_bool function(const godot_aabb * p_self);
	alias da_godot_aabb_has_no_surface = godot_bool function(const godot_aabb * p_self);
	alias da_godot_aabb_intersects = godot_bool function(const godot_aabb * p_self, const godot_aabb * p_with);
	alias da_godot_aabb_encloses = godot_bool function(const godot_aabb * p_self, const godot_aabb * p_with);
	alias da_godot_aabb_merge = godot_aabb function(const godot_aabb * p_self, const godot_aabb * p_with);
	alias da_godot_aabb_intersection = godot_aabb function(const godot_aabb * p_self, const godot_aabb * p_with);
	alias da_godot_aabb_intersects_plane = godot_bool function(const godot_aabb * p_self, const godot_plane * p_plane);
	alias da_godot_aabb_intersects_segment = godot_bool function(const godot_aabb * p_self, const godot_vector3 * p_from, const godot_vector3 * p_to);
	alias da_godot_aabb_has_point = godot_bool function(const godot_aabb * p_self, const godot_vector3 * p_point);
	alias da_godot_aabb_get_support = godot_vector3 function(const godot_aabb * p_self, const godot_vector3 * p_dir);
	alias da_godot_aabb_get_longest_axis = godot_vector3 function(const godot_aabb * p_self);
	alias da_godot_aabb_get_longest_axis_index = godot_int function(const godot_aabb * p_self);
	alias da_godot_aabb_get_longest_axis_size = godot_real function(const godot_aabb * p_self);
	alias da_godot_aabb_get_shortest_axis = godot_vector3 function(const godot_aabb * p_self);
	alias da_godot_aabb_get_shortest_axis_index = godot_int function(const godot_aabb * p_self);
	alias da_godot_aabb_get_shortest_axis_size = godot_real function(const godot_aabb * p_self);
	alias da_godot_aabb_expand = godot_aabb function(const godot_aabb * p_self, const godot_vector3 * p_to_point);
	alias da_godot_aabb_grow = godot_aabb function(const godot_aabb * p_self, const godot_real p_by);
	alias da_godot_aabb_get_endpoint = godot_vector3 function(const godot_aabb * p_self, const godot_int p_idx);
	alias da_godot_aabb_operator_equal = godot_bool function(const godot_aabb * p_self, const godot_aabb * p_b);
	alias da_godot_rid_new = void function(godot_rid * r_dest);
	alias da_godot_rid_get_id = godot_int function(const godot_rid * p_self);
	alias da_godot_rid_new_with_resource = void function(godot_rid * r_dest, const godot_object  p_from);
	alias da_godot_rid_operator_equal = godot_bool function(const godot_rid * p_self, const godot_rid * p_b);
	alias da_godot_rid_operator_less = godot_bool function(const godot_rid * p_self, const godot_rid * p_b);
	alias da_godot_transform_new_with_axis_origin = void function(godot_transform * r_dest, const godot_vector3 * p_x_axis, const godot_vector3 * p_y_axis, const godot_vector3 * p_z_axis, const godot_vector3 * p_origin);
	alias da_godot_transform_new = void function(godot_transform * r_dest, const godot_basis * p_basis, const godot_vector3 * p_origin);
	alias da_godot_transform_get_basis = godot_basis function(const godot_transform * p_self);
	alias da_godot_transform_set_basis = void function(godot_transform * p_self, const godot_basis * p_v);
	alias da_godot_transform_get_origin = godot_vector3 function(const godot_transform * p_self);
	alias da_godot_transform_set_origin = void function(godot_transform * p_self, const godot_vector3 * p_v);
	alias da_godot_transform_as_string = godot_string function(const godot_transform * p_self);
	alias da_godot_transform_inverse = godot_transform function(const godot_transform * p_self);
	alias da_godot_transform_affine_inverse = godot_transform function(const godot_transform * p_self);
	alias da_godot_transform_orthonormalized = godot_transform function(const godot_transform * p_self);
	alias da_godot_transform_rotated = godot_transform function(const godot_transform * p_self, const godot_vector3 * p_axis, const godot_real p_phi);
	alias da_godot_transform_scaled = godot_transform function(const godot_transform * p_self, const godot_vector3 * p_scale);
	alias da_godot_transform_translated = godot_transform function(const godot_transform * p_self, const godot_vector3 * p_ofs);
	alias da_godot_transform_looking_at = godot_transform function(const godot_transform * p_self, const godot_vector3 * p_target, const godot_vector3 * p_up);
	alias da_godot_transform_xform_plane = godot_plane function(const godot_transform * p_self, const godot_plane * p_v);
	alias da_godot_transform_xform_inv_plane = godot_plane function(const godot_transform * p_self, const godot_plane * p_v);
	alias da_godot_transform_new_identity = void function(godot_transform * r_dest);
	alias da_godot_transform_operator_equal = godot_bool function(const godot_transform * p_self, const godot_transform * p_b);
	alias da_godot_transform_operator_multiply = godot_transform function(const godot_transform * p_self, const godot_transform * p_b);
	alias da_godot_transform_xform_vector3 = godot_vector3 function(const godot_transform * p_self, const godot_vector3 * p_v);
	alias da_godot_transform_xform_inv_vector3 = godot_vector3 function(const godot_transform * p_self, const godot_vector3 * p_v);
	alias da_godot_transform_xform_aabb = godot_aabb function(const godot_transform * p_self, const godot_aabb * p_v);
	alias da_godot_transform_xform_inv_aabb = godot_aabb function(const godot_transform * p_self, const godot_aabb * p_v);
	alias da_godot_transform2d_new = void function(godot_transform2d * r_dest, const godot_real p_rot, const godot_vector2 * p_pos);
	alias da_godot_transform2d_new_axis_origin = void function(godot_transform2d * r_dest, const godot_vector2 * p_x_axis, const godot_vector2 * p_y_axis, const godot_vector2 * p_origin);
	alias da_godot_transform2d_as_string = godot_string function(const godot_transform2d * p_self);
	alias da_godot_transform2d_inverse = godot_transform2d function(const godot_transform2d * p_self);
	alias da_godot_transform2d_affine_inverse = godot_transform2d function(const godot_transform2d * p_self);
	alias da_godot_transform2d_get_rotation = godot_real function(const godot_transform2d * p_self);
	alias da_godot_transform2d_get_origin = godot_vector2 function(const godot_transform2d * p_self);
	alias da_godot_transform2d_get_scale = godot_vector2 function(const godot_transform2d * p_self);
	alias da_godot_transform2d_orthonormalized = godot_transform2d function(const godot_transform2d * p_self);
	alias da_godot_transform2d_rotated = godot_transform2d function(const godot_transform2d * p_self, const godot_real p_phi);
	alias da_godot_transform2d_scaled = godot_transform2d function(const godot_transform2d * p_self, const godot_vector2 * p_scale);
	alias da_godot_transform2d_translated = godot_transform2d function(const godot_transform2d * p_self, const godot_vector2 * p_offset);
	alias da_godot_transform2d_xform_vector2 = godot_vector2 function(const godot_transform2d * p_self, const godot_vector2 * p_v);
	alias da_godot_transform2d_xform_inv_vector2 = godot_vector2 function(const godot_transform2d * p_self, const godot_vector2 * p_v);
	alias da_godot_transform2d_basis_xform_vector2 = godot_vector2 function(const godot_transform2d * p_self, const godot_vector2 * p_v);
	alias da_godot_transform2d_basis_xform_inv_vector2 = godot_vector2 function(const godot_transform2d * p_self, const godot_vector2 * p_v);
	alias da_godot_transform2d_interpolate_with = godot_transform2d function(const godot_transform2d * p_self, const godot_transform2d * p_m, const godot_real p_c);
	alias da_godot_transform2d_operator_equal = godot_bool function(const godot_transform2d * p_self, const godot_transform2d * p_b);
	alias da_godot_transform2d_operator_multiply = godot_transform2d function(const godot_transform2d * p_self, const godot_transform2d * p_b);
	alias da_godot_transform2d_new_identity = void function(godot_transform2d * r_dest);
	alias da_godot_transform2d_xform_rect2 = godot_rect2 function(const godot_transform2d * p_self, const godot_rect2 * p_v);
	alias da_godot_transform2d_xform_inv_rect2 = godot_rect2 function(const godot_transform2d * p_self, const godot_rect2 * p_v);
	alias da_godot_variant_get_type = godot_variant_type function(const godot_variant * p_v);
	alias da_godot_variant_new_copy = void function(godot_variant * r_dest, const godot_variant * p_src);
	alias da_godot_variant_new_nil = void function(godot_variant * r_dest);
	alias da_godot_variant_new_bool = void function(godot_variant * r_dest, const godot_bool p_b);
	alias da_godot_variant_new_uint = void function(godot_variant * r_dest, const uint64_t p_i);
	alias da_godot_variant_new_int = void function(godot_variant * r_dest, const int64_t p_i);
	alias da_godot_variant_new_real = void function(godot_variant * r_dest, const double p_r);
	alias da_godot_variant_new_string = void function(godot_variant * r_dest, const godot_string * p_s);
	alias da_godot_variant_new_vector2 = void function(godot_variant * r_dest, const godot_vector2 * p_v2);
	alias da_godot_variant_new_rect2 = void function(godot_variant * r_dest, const godot_rect2 * p_rect2);
	alias da_godot_variant_new_vector3 = void function(godot_variant * r_dest, const godot_vector3 * p_v3);
	alias da_godot_variant_new_transform2d = void function(godot_variant * r_dest, const godot_transform2d * p_t2d);
	alias da_godot_variant_new_plane = void function(godot_variant * r_dest, const godot_plane * p_plane);
	alias da_godot_variant_new_quat = void function(godot_variant * r_dest, const godot_quat * p_quat);
	alias da_godot_variant_new_aabb = void function(godot_variant * r_dest, const godot_aabb * p_aabb);
	alias da_godot_variant_new_basis = void function(godot_variant * r_dest, const godot_basis * p_basis);
	alias da_godot_variant_new_transform = void function(godot_variant * r_dest, const godot_transform * p_trans);
	alias da_godot_variant_new_color = void function(godot_variant * r_dest, const godot_color * p_color);
	alias da_godot_variant_new_node_path = void function(godot_variant * r_dest, const godot_node_path * p_np);
	alias da_godot_variant_new_rid = void function(godot_variant * r_dest, const godot_rid * p_rid);
	alias da_godot_variant_new_object = void function(godot_variant * r_dest, const godot_object  p_obj);
	alias da_godot_variant_new_dictionary = void function(godot_variant * r_dest, const godot_dictionary * p_dict);
	alias da_godot_variant_new_array = void function(godot_variant * r_dest, const godot_array * p_arr);
	alias da_godot_variant_new_pool_byte_array = void function(godot_variant * r_dest, const godot_pool_byte_array * p_pba);
	alias da_godot_variant_new_pool_int_array = void function(godot_variant * r_dest, const godot_pool_int_array * p_pia);
	alias da_godot_variant_new_pool_real_array = void function(godot_variant * r_dest, const godot_pool_real_array * p_pra);
	alias da_godot_variant_new_pool_string_array = void function(godot_variant * r_dest, const godot_pool_string_array * p_psa);
	alias da_godot_variant_new_pool_vector2_array = void function(godot_variant * r_dest, const godot_pool_vector2_array * p_pv2a);
	alias da_godot_variant_new_pool_vector3_array = void function(godot_variant * r_dest, const godot_pool_vector3_array * p_pv3a);
	alias da_godot_variant_new_pool_color_array = void function(godot_variant * r_dest, const godot_pool_color_array * p_pca);
	alias da_godot_variant_as_bool = godot_bool function(const godot_variant * p_self);
	alias da_godot_variant_as_uint = uint64_t function(const godot_variant * p_self);
	alias da_godot_variant_as_int = int64_t function(const godot_variant * p_self);
	alias da_godot_variant_as_real = double function(const godot_variant * p_self);
	alias da_godot_variant_as_string = godot_string function(const godot_variant * p_self);
	alias da_godot_variant_as_vector2 = godot_vector2 function(const godot_variant * p_self);
	alias da_godot_variant_as_rect2 = godot_rect2 function(const godot_variant * p_self);
	alias da_godot_variant_as_vector3 = godot_vector3 function(const godot_variant * p_self);
	alias da_godot_variant_as_transform2d = godot_transform2d function(const godot_variant * p_self);
	alias da_godot_variant_as_plane = godot_plane function(const godot_variant * p_self);
	alias da_godot_variant_as_quat = godot_quat function(const godot_variant * p_self);
	alias da_godot_variant_as_aabb = godot_aabb function(const godot_variant * p_self);
	alias da_godot_variant_as_basis = godot_basis function(const godot_variant * p_self);
	alias da_godot_variant_as_transform = godot_transform function(const godot_variant * p_self);
	alias da_godot_variant_as_color = godot_color function(const godot_variant * p_self);
	alias da_godot_variant_as_node_path = godot_node_path function(const godot_variant * p_self);
	alias da_godot_variant_as_rid = godot_rid function(const godot_variant * p_self);
	alias da_godot_variant_as_object = godot_object  function(const godot_variant * p_self);
	alias da_godot_variant_as_dictionary = godot_dictionary function(const godot_variant * p_self);
	alias da_godot_variant_as_array = godot_array function(const godot_variant * p_self);
	alias da_godot_variant_as_pool_byte_array = godot_pool_byte_array function(const godot_variant * p_self);
	alias da_godot_variant_as_pool_int_array = godot_pool_int_array function(const godot_variant * p_self);
	alias da_godot_variant_as_pool_real_array = godot_pool_real_array function(const godot_variant * p_self);
	alias da_godot_variant_as_pool_string_array = godot_pool_string_array function(const godot_variant * p_self);
	alias da_godot_variant_as_pool_vector2_array = godot_pool_vector2_array function(const godot_variant * p_self);
	alias da_godot_variant_as_pool_vector3_array = godot_pool_vector3_array function(const godot_variant * p_self);
	alias da_godot_variant_as_pool_color_array = godot_pool_color_array function(const godot_variant * p_self);
	alias da_godot_variant_call = godot_variant function(godot_variant * p_self, const godot_string * p_method, const godot_variant ** p_args, const godot_int p_argcount, godot_variant_call_error * r_error);
	alias da_godot_variant_has_method = godot_bool function(const godot_variant * p_self, const godot_string * p_method);
	alias da_godot_variant_operator_equal = godot_bool function(const godot_variant * p_self, const godot_variant * p_other);
	alias da_godot_variant_operator_less = godot_bool function(const godot_variant * p_self, const godot_variant * p_other);
	alias da_godot_variant_hash_compare = godot_bool function(const godot_variant * p_self, const godot_variant * p_other);
	alias da_godot_variant_booleanize = godot_bool function(const godot_variant * p_self);
	alias da_godot_variant_destroy = void function(godot_variant * p_self);
	alias da_godot_char_string_length = godot_int function(const godot_char_string * p_cs);
	alias da_godot_char_string_get_data = const char * function(const godot_char_string * p_cs);
	alias da_godot_char_string_destroy = void function(godot_char_string * p_cs);
	alias da_godot_string_new = void function(godot_string * r_dest);
	alias da_godot_string_new_copy = void function(godot_string * r_dest, const godot_string * p_src);
	alias da_godot_string_new_with_wide_string = void function(godot_string * r_dest, const wchar_t * p_contents, const int p_size);
	alias da_godot_string_operator_index = const wchar_t * function(godot_string * p_self, const godot_int p_idx);
	alias da_godot_string_operator_index_const = wchar_t function(const godot_string * p_self, const godot_int p_idx);
	alias da_godot_string_wide_str = const wchar_t * function(const godot_string * p_self);
	alias da_godot_string_operator_equal = godot_bool function(const godot_string * p_self, const godot_string * p_b);
	alias da_godot_string_operator_less = godot_bool function(const godot_string * p_self, const godot_string * p_b);
	alias da_godot_string_operator_plus = godot_string function(const godot_string * p_self, const godot_string * p_b);
	alias da_godot_string_length = godot_int function(const godot_string * p_self);
	alias da_godot_string_casecmp_to = char function(const godot_string * p_self, const godot_string * p_str);
	alias da_godot_string_nocasecmp_to = char function(const godot_string * p_self, const godot_string * p_str);
	alias da_godot_string_naturalnocasecmp_to = char function(const godot_string * p_self, const godot_string * p_str);
	alias da_godot_string_begins_with = godot_bool function(const godot_string * p_self, const godot_string * p_string);
	alias da_godot_string_begins_with_char_array = godot_bool function(const godot_string * p_self, const char * p_char_array);
	alias da_godot_string_bigrams = godot_array function(const godot_string * p_self);
	alias da_godot_string_chr = godot_string function(wchar_t p_character);
	alias da_godot_string_ends_with = godot_bool function(const godot_string * p_self, const godot_string * p_string);
	alias da_godot_string_find = godot_int function(const godot_string * p_self, godot_string p_what);
	alias da_godot_string_find_from = godot_int function(const godot_string * p_self, godot_string p_what, godot_int p_from);
	alias da_godot_string_findmk = godot_int function(const godot_string * p_self, const godot_array * p_keys);
	alias da_godot_string_findmk_from = godot_int function(const godot_string * p_self, const godot_array * p_keys, godot_int p_from);
	alias da_godot_string_findmk_from_in_place = godot_int function(const godot_string * p_self, const godot_array * p_keys, godot_int p_from, godot_int * r_key);
	alias da_godot_string_findn = godot_int function(const godot_string * p_self, godot_string p_what);
	alias da_godot_string_findn_from = godot_int function(const godot_string * p_self, godot_string p_what, godot_int p_from);
	alias da_godot_string_find_last = godot_int function(const godot_string * p_self, godot_string p_what);
	alias da_godot_string_format = godot_string function(const godot_string * p_self, const godot_variant * p_values);
	alias da_godot_string_format_with_custom_placeholder = godot_string function(const godot_string * p_self, const godot_variant * p_values, const char * p_placeholder);
	alias da_godot_string_hex_encode_buffer = godot_string function(const uint8_t * p_buffer, godot_int p_len);
	alias da_godot_string_hex_to_int = godot_int function(const godot_string * p_self);
	alias da_godot_string_hex_to_int_without_prefix = godot_int function(const godot_string * p_self);
	alias da_godot_string_insert = godot_string function(const godot_string * p_self, godot_int p_at_pos, godot_string p_string);
	alias da_godot_string_is_numeric = godot_bool function(const godot_string * p_self);
	alias da_godot_string_is_subsequence_of = godot_bool function(const godot_string * p_self, const godot_string * p_string);
	alias da_godot_string_is_subsequence_ofi = godot_bool function(const godot_string * p_self, const godot_string * p_string);
	alias da_godot_string_lpad = godot_string function(const godot_string * p_self, godot_int p_min_length);
	alias da_godot_string_lpad_with_custom_character = godot_string function(const godot_string * p_self, godot_int p_min_length, const godot_string * p_character);
	alias da_godot_string_match = godot_bool function(const godot_string * p_self, const godot_string * p_wildcard);
	alias da_godot_string_matchn = godot_bool function(const godot_string * p_self, const godot_string * p_wildcard);
	alias da_godot_string_md5 = godot_string function(const uint8_t * p_md5);
	alias da_godot_string_num = godot_string function(double p_num);
	alias da_godot_string_num_int64 = godot_string function(int64_t p_num, godot_int p_base);
	alias da_godot_string_num_int64_capitalized = godot_string function(int64_t p_num, godot_int p_base, godot_bool p_capitalize_hex);
	alias da_godot_string_num_real = godot_string function(double p_num);
	alias da_godot_string_num_scientific = godot_string function(double p_num);
	alias da_godot_string_num_with_decimals = godot_string function(double p_num, godot_int p_decimals);
	alias da_godot_string_pad_decimals = godot_string function(const godot_string * p_self, godot_int p_digits);
	alias da_godot_string_pad_zeros = godot_string function(const godot_string * p_self, godot_int p_digits);
	alias da_godot_string_replace_first = godot_string function(const godot_string * p_self, godot_string p_key, godot_string p_with);
	alias da_godot_string_replace = godot_string function(const godot_string * p_self, godot_string p_key, godot_string p_with);
	alias da_godot_string_replacen = godot_string function(const godot_string * p_self, godot_string p_key, godot_string p_with);
	alias da_godot_string_rfind = godot_int function(const godot_string * p_self, godot_string p_what);
	alias da_godot_string_rfindn = godot_int function(const godot_string * p_self, godot_string p_what);
	alias da_godot_string_rfind_from = godot_int function(const godot_string * p_self, godot_string p_what, godot_int p_from);
	alias da_godot_string_rfindn_from = godot_int function(const godot_string * p_self, godot_string p_what, godot_int p_from);
	alias da_godot_string_rpad = godot_string function(const godot_string * p_self, godot_int p_min_length);
	alias da_godot_string_rpad_with_custom_character = godot_string function(const godot_string * p_self, godot_int p_min_length, const godot_string * p_character);
	alias da_godot_string_similarity = godot_real function(const godot_string * p_self, const godot_string * p_string);
	alias da_godot_string_sprintf = godot_string function(const godot_string * p_self, const godot_array * p_values, godot_bool * p_error);
	alias da_godot_string_substr = godot_string function(const godot_string * p_self, godot_int p_from, godot_int p_chars);
	alias da_godot_string_to_double = double function(const godot_string * p_self);
	alias da_godot_string_to_float = godot_real function(const godot_string * p_self);
	alias da_godot_string_to_int = godot_int function(const godot_string * p_self);
	alias da_godot_string_camelcase_to_underscore = godot_string function(const godot_string * p_self);
	alias da_godot_string_camelcase_to_underscore_lowercased = godot_string function(const godot_string * p_self);
	alias da_godot_string_capitalize = godot_string function(const godot_string * p_self);
	alias da_godot_string_char_to_double = double function(const char * p_what);
	alias da_godot_string_char_to_int = godot_int function(const char * p_what);
	alias da_godot_string_wchar_to_int = int64_t function(const wchar_t * p_str);
	alias da_godot_string_char_to_int_with_len = godot_int function(const char * p_what, godot_int p_len);
	alias da_godot_string_char_to_int64_with_len = int64_t function(const wchar_t * p_str, int p_len);
	alias da_godot_string_hex_to_int64 = int64_t function(const godot_string * p_self);
	alias da_godot_string_hex_to_int64_with_prefix = int64_t function(const godot_string * p_self);
	alias da_godot_string_to_int64 = int64_t function(const godot_string * p_self);
	alias da_godot_string_unicode_char_to_double = double function(const wchar_t * p_str, const wchar_t ** r_end);
	alias da_godot_string_get_slice_count = godot_int function(const godot_string * p_self, godot_string p_splitter);
	alias da_godot_string_get_slice = godot_string function(const godot_string * p_self, godot_string p_splitter, godot_int p_slice);
	alias da_godot_string_get_slicec = godot_string function(const godot_string * p_self, wchar_t p_splitter, godot_int p_slice);
	alias da_godot_string_split = godot_array function(const godot_string * p_self, const godot_string * p_splitter);
	alias da_godot_string_split_allow_empty = godot_array function(const godot_string * p_self, const godot_string * p_splitter);
	alias da_godot_string_split_floats = godot_array function(const godot_string * p_self, const godot_string * p_splitter);
	alias da_godot_string_split_floats_allows_empty = godot_array function(const godot_string * p_self, const godot_string * p_splitter);
	alias da_godot_string_split_floats_mk = godot_array function(const godot_string * p_self, const godot_array * p_splitters);
	alias da_godot_string_split_floats_mk_allows_empty = godot_array function(const godot_string * p_self, const godot_array * p_splitters);
	alias da_godot_string_split_ints = godot_array function(const godot_string * p_self, const godot_string * p_splitter);
	alias da_godot_string_split_ints_allows_empty = godot_array function(const godot_string * p_self, const godot_string * p_splitter);
	alias da_godot_string_split_ints_mk = godot_array function(const godot_string * p_self, const godot_array * p_splitters);
	alias da_godot_string_split_ints_mk_allows_empty = godot_array function(const godot_string * p_self, const godot_array * p_splitters);
	alias da_godot_string_split_spaces = godot_array function(const godot_string * p_self);
	alias da_godot_string_char_lowercase = wchar_t function(wchar_t p_char);
	alias da_godot_string_char_uppercase = wchar_t function(wchar_t p_char);
	alias da_godot_string_to_lower = godot_string function(const godot_string * p_self);
	alias da_godot_string_to_upper = godot_string function(const godot_string * p_self);
	alias da_godot_string_get_basename = godot_string function(const godot_string * p_self);
	alias da_godot_string_get_extension = godot_string function(const godot_string * p_self);
	alias da_godot_string_left = godot_string function(const godot_string * p_self, godot_int p_pos);
	alias da_godot_string_ord_at = wchar_t function(const godot_string * p_self, godot_int p_idx);
	alias da_godot_string_plus_file = godot_string function(const godot_string * p_self, const godot_string * p_file);
	alias da_godot_string_right = godot_string function(const godot_string * p_self, godot_int p_pos);
	alias da_godot_string_strip_edges = godot_string function(const godot_string * p_self, godot_bool p_left, godot_bool p_right);
	alias da_godot_string_strip_escapes = godot_string function(const godot_string * p_self);
	alias da_godot_string_erase = void function(godot_string * p_self, godot_int p_pos, godot_int p_chars);
	alias da_godot_string_ascii = godot_char_string function(const godot_string * p_self);
	alias da_godot_string_ascii_extended = godot_char_string function(const godot_string * p_self);
	alias da_godot_string_utf8 = godot_char_string function(const godot_string * p_self);
	alias da_godot_string_parse_utf8 = godot_bool function(godot_string * p_self, const char * p_utf8);
	alias da_godot_string_parse_utf8_with_len = godot_bool function(godot_string * p_self, const char * p_utf8, godot_int p_len);
	alias da_godot_string_chars_to_utf8 = godot_string function(const char * p_utf8);
	alias da_godot_string_chars_to_utf8_with_len = godot_string function(const char * p_utf8, godot_int p_len);
	alias da_godot_string_hash = uint32_t function(const godot_string * p_self);
	alias da_godot_string_hash64 = uint64_t function(const godot_string * p_self);
	alias da_godot_string_hash_chars = uint32_t function(const char * p_cstr);
	alias da_godot_string_hash_chars_with_len = uint32_t function(const char * p_cstr, godot_int p_len);
	alias da_godot_string_hash_utf8_chars = uint32_t function(const wchar_t * p_str);
	alias da_godot_string_hash_utf8_chars_with_len = uint32_t function(const wchar_t * p_str, godot_int p_len);
	alias da_godot_string_md5_buffer = godot_pool_byte_array function(const godot_string * p_self);
	alias da_godot_string_md5_text = godot_string function(const godot_string * p_self);
	alias da_godot_string_sha256_buffer = godot_pool_byte_array function(const godot_string * p_self);
	alias da_godot_string_sha256_text = godot_string function(const godot_string * p_self);
	alias da_godot_string_empty = godot_bool function(const godot_string * p_self);
	alias da_godot_string_get_base_dir = godot_string function(const godot_string * p_self);
	alias da_godot_string_get_file = godot_string function(const godot_string * p_self);
	alias da_godot_string_humanize_size = godot_string function(uint64_t p_size);
	alias da_godot_string_is_abs_path = godot_bool function(const godot_string * p_self);
	alias da_godot_string_is_rel_path = godot_bool function(const godot_string * p_self);
	alias da_godot_string_is_resource_file = godot_bool function(const godot_string * p_self);
	alias da_godot_string_path_to = godot_string function(const godot_string * p_self, const godot_string * p_path);
	alias da_godot_string_path_to_file = godot_string function(const godot_string * p_self, const godot_string * p_path);
	alias da_godot_string_simplify_path = godot_string function(const godot_string * p_self);
	alias da_godot_string_c_escape = godot_string function(const godot_string * p_self);
	alias da_godot_string_c_escape_multiline = godot_string function(const godot_string * p_self);
	alias da_godot_string_c_unescape = godot_string function(const godot_string * p_self);
	alias da_godot_string_http_escape = godot_string function(const godot_string * p_self);
	alias da_godot_string_http_unescape = godot_string function(const godot_string * p_self);
	alias da_godot_string_json_escape = godot_string function(const godot_string * p_self);
	alias da_godot_string_word_wrap = godot_string function(const godot_string * p_self, godot_int p_chars_per_line);
	alias da_godot_string_xml_escape = godot_string function(const godot_string * p_self);
	alias da_godot_string_xml_escape_with_quotes = godot_string function(const godot_string * p_self);
	alias da_godot_string_xml_unescape = godot_string function(const godot_string * p_self);
	alias da_godot_string_percent_decode = godot_string function(const godot_string * p_self);
	alias da_godot_string_percent_encode = godot_string function(const godot_string * p_self);
	alias da_godot_string_is_valid_float = godot_bool function(const godot_string * p_self);
	alias da_godot_string_is_valid_hex_number = godot_bool function(const godot_string * p_self, godot_bool p_with_prefix);
	alias da_godot_string_is_valid_html_color = godot_bool function(const godot_string * p_self);
	alias da_godot_string_is_valid_identifier = godot_bool function(const godot_string * p_self);
	alias da_godot_string_is_valid_integer = godot_bool function(const godot_string * p_self);
	alias da_godot_string_is_valid_ip_address = godot_bool function(const godot_string * p_self);
	alias da_godot_string_destroy = void function(godot_string * p_self);
	alias da_godot_string_name_new = void function(godot_string_name * r_dest, const godot_string * p_name);
	alias da_godot_string_name_new_data = void function(godot_string_name * r_dest, const char * p_name);
	alias da_godot_string_name_get_name = godot_string function(const godot_string_name * p_self);
	alias da_godot_string_name_get_hash = uint32_t function(const godot_string_name * p_self);
	alias da_godot_string_name_get_data_unique_pointer = const void * function(const godot_string_name * p_self);
	alias da_godot_string_name_operator_equal = godot_bool function(const godot_string_name * p_self, const godot_string_name * p_other);
	alias da_godot_string_name_operator_less = godot_bool function(const godot_string_name * p_self, const godot_string_name * p_other);
	alias da_godot_string_name_destroy = void function(godot_string_name * p_self);
	alias da_godot_object_destroy = void function(godot_object  p_o);
	alias da_godot_global_get_singleton = godot_object  function(char * p_name);
	alias da_godot_method_bind_get_method = godot_method_bind * function(const char * p_classname, const char * p_methodname);
	alias da_godot_method_bind_ptrcall = void function(godot_method_bind * p_method_bind, godot_object  p_instance, const void ** p_args, void * p_ret);
	alias da_godot_method_bind_call = godot_variant function(godot_method_bind * p_method_bind, godot_object  p_instance, const godot_variant ** p_args, const int p_arg_count, godot_variant_call_error * p_call_error);
	alias da_godot_get_class_constructor = godot_class_constructor function(const char * p_classname);
	alias da_godot_get_global_constants = godot_dictionary function();
	alias da_godot_register_native_call_type = void function(const char * call_type, native_call_cb p_callback);
	alias da_godot_alloc = void * function(int p_bytes);
	alias da_godot_realloc = void * function(void * p_ptr, int p_bytes);
	alias da_godot_free = void function(void * p_ptr);
	alias da_godot_print_error = void function(const char * p_description, const char * p_function, const char * p_file, int p_line);
	alias da_godot_print_warning = void function(const char * p_description, const char * p_function, const char * p_file, int p_line);
	alias da_godot_print = void function(const godot_string * p_message);
}
public extern(C) struct godot_gdnative_core_api_struct
{
@nogc nothrow:

			mixin ApiStructHeader;
			uint num_extensions;
			const godot_gdnative_api_struct **extensions;
			da_godot_color_new_rgba godot_color_new_rgba;
	da_godot_color_new_rgb godot_color_new_rgb;
	da_godot_color_get_r godot_color_get_r;
	da_godot_color_set_r godot_color_set_r;
	da_godot_color_get_g godot_color_get_g;
	da_godot_color_set_g godot_color_set_g;
	da_godot_color_get_b godot_color_get_b;
	da_godot_color_set_b godot_color_set_b;
	da_godot_color_get_a godot_color_get_a;
	da_godot_color_set_a godot_color_set_a;
	da_godot_color_get_h godot_color_get_h;
	da_godot_color_get_s godot_color_get_s;
	da_godot_color_get_v godot_color_get_v;
	da_godot_color_as_string godot_color_as_string;
	da_godot_color_to_rgba32 godot_color_to_rgba32;
	da_godot_color_to_argb32 godot_color_to_argb32;
	da_godot_color_gray godot_color_gray;
	da_godot_color_inverted godot_color_inverted;
	da_godot_color_contrasted godot_color_contrasted;
	da_godot_color_linear_interpolate godot_color_linear_interpolate;
	da_godot_color_blend godot_color_blend;
	da_godot_color_to_html godot_color_to_html;
	da_godot_color_operator_equal godot_color_operator_equal;
	da_godot_color_operator_less godot_color_operator_less;
	da_godot_vector2_new godot_vector2_new;
	da_godot_vector2_as_string godot_vector2_as_string;
	da_godot_vector2_normalized godot_vector2_normalized;
	da_godot_vector2_length godot_vector2_length;
	da_godot_vector2_angle godot_vector2_angle;
	da_godot_vector2_length_squared godot_vector2_length_squared;
	da_godot_vector2_is_normalized godot_vector2_is_normalized;
	da_godot_vector2_distance_to godot_vector2_distance_to;
	da_godot_vector2_distance_squared_to godot_vector2_distance_squared_to;
	da_godot_vector2_angle_to godot_vector2_angle_to;
	da_godot_vector2_angle_to_point godot_vector2_angle_to_point;
	da_godot_vector2_linear_interpolate godot_vector2_linear_interpolate;
	da_godot_vector2_cubic_interpolate godot_vector2_cubic_interpolate;
	da_godot_vector2_rotated godot_vector2_rotated;
	da_godot_vector2_tangent godot_vector2_tangent;
	da_godot_vector2_floor godot_vector2_floor;
	da_godot_vector2_snapped godot_vector2_snapped;
	da_godot_vector2_aspect godot_vector2_aspect;
	da_godot_vector2_dot godot_vector2_dot;
	da_godot_vector2_slide godot_vector2_slide;
	da_godot_vector2_bounce godot_vector2_bounce;
	da_godot_vector2_reflect godot_vector2_reflect;
	da_godot_vector2_abs godot_vector2_abs;
	da_godot_vector2_clamped godot_vector2_clamped;
	da_godot_vector2_operator_add godot_vector2_operator_add;
	da_godot_vector2_operator_subtract godot_vector2_operator_subtract;
	da_godot_vector2_operator_multiply_vector godot_vector2_operator_multiply_vector;
	da_godot_vector2_operator_multiply_scalar godot_vector2_operator_multiply_scalar;
	da_godot_vector2_operator_divide_vector godot_vector2_operator_divide_vector;
	da_godot_vector2_operator_divide_scalar godot_vector2_operator_divide_scalar;
	da_godot_vector2_operator_equal godot_vector2_operator_equal;
	da_godot_vector2_operator_less godot_vector2_operator_less;
	da_godot_vector2_operator_neg godot_vector2_operator_neg;
	da_godot_vector2_set_x godot_vector2_set_x;
	da_godot_vector2_set_y godot_vector2_set_y;
	da_godot_vector2_get_x godot_vector2_get_x;
	da_godot_vector2_get_y godot_vector2_get_y;
	da_godot_quat_new godot_quat_new;
	da_godot_quat_new_with_axis_angle godot_quat_new_with_axis_angle;
	da_godot_quat_get_x godot_quat_get_x;
	da_godot_quat_set_x godot_quat_set_x;
	da_godot_quat_get_y godot_quat_get_y;
	da_godot_quat_set_y godot_quat_set_y;
	da_godot_quat_get_z godot_quat_get_z;
	da_godot_quat_set_z godot_quat_set_z;
	da_godot_quat_get_w godot_quat_get_w;
	da_godot_quat_set_w godot_quat_set_w;
	da_godot_quat_as_string godot_quat_as_string;
	da_godot_quat_length godot_quat_length;
	da_godot_quat_length_squared godot_quat_length_squared;
	da_godot_quat_normalized godot_quat_normalized;
	da_godot_quat_is_normalized godot_quat_is_normalized;
	da_godot_quat_inverse godot_quat_inverse;
	da_godot_quat_dot godot_quat_dot;
	da_godot_quat_xform godot_quat_xform;
	da_godot_quat_slerp godot_quat_slerp;
	da_godot_quat_slerpni godot_quat_slerpni;
	da_godot_quat_cubic_slerp godot_quat_cubic_slerp;
	da_godot_quat_operator_multiply godot_quat_operator_multiply;
	da_godot_quat_operator_add godot_quat_operator_add;
	da_godot_quat_operator_subtract godot_quat_operator_subtract;
	da_godot_quat_operator_divide godot_quat_operator_divide;
	da_godot_quat_operator_equal godot_quat_operator_equal;
	da_godot_quat_operator_neg godot_quat_operator_neg;
	da_godot_basis_new_with_rows godot_basis_new_with_rows;
	da_godot_basis_new_with_axis_and_angle godot_basis_new_with_axis_and_angle;
	da_godot_basis_new_with_euler godot_basis_new_with_euler;
	da_godot_basis_as_string godot_basis_as_string;
	da_godot_basis_inverse godot_basis_inverse;
	da_godot_basis_transposed godot_basis_transposed;
	da_godot_basis_orthonormalized godot_basis_orthonormalized;
	da_godot_basis_determinant godot_basis_determinant;
	da_godot_basis_rotated godot_basis_rotated;
	da_godot_basis_scaled godot_basis_scaled;
	da_godot_basis_get_scale godot_basis_get_scale;
	da_godot_basis_get_euler godot_basis_get_euler;
	da_godot_basis_tdotx godot_basis_tdotx;
	da_godot_basis_tdoty godot_basis_tdoty;
	da_godot_basis_tdotz godot_basis_tdotz;
	da_godot_basis_xform godot_basis_xform;
	da_godot_basis_xform_inv godot_basis_xform_inv;
	da_godot_basis_get_orthogonal_index godot_basis_get_orthogonal_index;
	da_godot_basis_new godot_basis_new;
	da_godot_basis_new_with_euler_quat godot_basis_new_with_euler_quat;
	da_godot_basis_get_elements godot_basis_get_elements;
	da_godot_basis_get_axis godot_basis_get_axis;
	da_godot_basis_set_axis godot_basis_set_axis;
	da_godot_basis_get_row godot_basis_get_row;
	da_godot_basis_set_row godot_basis_set_row;
	da_godot_basis_operator_equal godot_basis_operator_equal;
	da_godot_basis_operator_add godot_basis_operator_add;
	da_godot_basis_operator_subtract godot_basis_operator_subtract;
	da_godot_basis_operator_multiply_vector godot_basis_operator_multiply_vector;
	da_godot_basis_operator_multiply_scalar godot_basis_operator_multiply_scalar;
	da_godot_vector3_new godot_vector3_new;
	da_godot_vector3_as_string godot_vector3_as_string;
	da_godot_vector3_min_axis godot_vector3_min_axis;
	da_godot_vector3_max_axis godot_vector3_max_axis;
	da_godot_vector3_length godot_vector3_length;
	da_godot_vector3_length_squared godot_vector3_length_squared;
	da_godot_vector3_is_normalized godot_vector3_is_normalized;
	da_godot_vector3_normalized godot_vector3_normalized;
	da_godot_vector3_inverse godot_vector3_inverse;
	da_godot_vector3_snapped godot_vector3_snapped;
	da_godot_vector3_rotated godot_vector3_rotated;
	da_godot_vector3_linear_interpolate godot_vector3_linear_interpolate;
	da_godot_vector3_cubic_interpolate godot_vector3_cubic_interpolate;
	da_godot_vector3_dot godot_vector3_dot;
	da_godot_vector3_cross godot_vector3_cross;
	da_godot_vector3_outer godot_vector3_outer;
	da_godot_vector3_to_diagonal_matrix godot_vector3_to_diagonal_matrix;
	da_godot_vector3_abs godot_vector3_abs;
	da_godot_vector3_floor godot_vector3_floor;
	da_godot_vector3_ceil godot_vector3_ceil;
	da_godot_vector3_distance_to godot_vector3_distance_to;
	da_godot_vector3_distance_squared_to godot_vector3_distance_squared_to;
	da_godot_vector3_angle_to godot_vector3_angle_to;
	da_godot_vector3_slide godot_vector3_slide;
	da_godot_vector3_bounce godot_vector3_bounce;
	da_godot_vector3_reflect godot_vector3_reflect;
	da_godot_vector3_operator_add godot_vector3_operator_add;
	da_godot_vector3_operator_subtract godot_vector3_operator_subtract;
	da_godot_vector3_operator_multiply_vector godot_vector3_operator_multiply_vector;
	da_godot_vector3_operator_multiply_scalar godot_vector3_operator_multiply_scalar;
	da_godot_vector3_operator_divide_vector godot_vector3_operator_divide_vector;
	da_godot_vector3_operator_divide_scalar godot_vector3_operator_divide_scalar;
	da_godot_vector3_operator_equal godot_vector3_operator_equal;
	da_godot_vector3_operator_less godot_vector3_operator_less;
	da_godot_vector3_operator_neg godot_vector3_operator_neg;
	da_godot_vector3_set_axis godot_vector3_set_axis;
	da_godot_vector3_get_axis godot_vector3_get_axis;
	da_godot_pool_byte_array_new godot_pool_byte_array_new;
	da_godot_pool_byte_array_new_copy godot_pool_byte_array_new_copy;
	da_godot_pool_byte_array_new_with_array godot_pool_byte_array_new_with_array;
	da_godot_pool_byte_array_append godot_pool_byte_array_append;
	da_godot_pool_byte_array_append_array godot_pool_byte_array_append_array;
	da_godot_pool_byte_array_insert godot_pool_byte_array_insert;
	da_godot_pool_byte_array_invert godot_pool_byte_array_invert;
	da_godot_pool_byte_array_push_back godot_pool_byte_array_push_back;
	da_godot_pool_byte_array_remove godot_pool_byte_array_remove;
	da_godot_pool_byte_array_resize godot_pool_byte_array_resize;
	da_godot_pool_byte_array_read godot_pool_byte_array_read;
	da_godot_pool_byte_array_write godot_pool_byte_array_write;
	da_godot_pool_byte_array_set godot_pool_byte_array_set;
	da_godot_pool_byte_array_get godot_pool_byte_array_get;
	da_godot_pool_byte_array_size godot_pool_byte_array_size;
	da_godot_pool_byte_array_destroy godot_pool_byte_array_destroy;
	da_godot_pool_int_array_new godot_pool_int_array_new;
	da_godot_pool_int_array_new_copy godot_pool_int_array_new_copy;
	da_godot_pool_int_array_new_with_array godot_pool_int_array_new_with_array;
	da_godot_pool_int_array_append godot_pool_int_array_append;
	da_godot_pool_int_array_append_array godot_pool_int_array_append_array;
	da_godot_pool_int_array_insert godot_pool_int_array_insert;
	da_godot_pool_int_array_invert godot_pool_int_array_invert;
	da_godot_pool_int_array_push_back godot_pool_int_array_push_back;
	da_godot_pool_int_array_remove godot_pool_int_array_remove;
	da_godot_pool_int_array_resize godot_pool_int_array_resize;
	da_godot_pool_int_array_read godot_pool_int_array_read;
	da_godot_pool_int_array_write godot_pool_int_array_write;
	da_godot_pool_int_array_set godot_pool_int_array_set;
	da_godot_pool_int_array_get godot_pool_int_array_get;
	da_godot_pool_int_array_size godot_pool_int_array_size;
	da_godot_pool_int_array_destroy godot_pool_int_array_destroy;
	da_godot_pool_real_array_new godot_pool_real_array_new;
	da_godot_pool_real_array_new_copy godot_pool_real_array_new_copy;
	da_godot_pool_real_array_new_with_array godot_pool_real_array_new_with_array;
	da_godot_pool_real_array_append godot_pool_real_array_append;
	da_godot_pool_real_array_append_array godot_pool_real_array_append_array;
	da_godot_pool_real_array_insert godot_pool_real_array_insert;
	da_godot_pool_real_array_invert godot_pool_real_array_invert;
	da_godot_pool_real_array_push_back godot_pool_real_array_push_back;
	da_godot_pool_real_array_remove godot_pool_real_array_remove;
	da_godot_pool_real_array_resize godot_pool_real_array_resize;
	da_godot_pool_real_array_read godot_pool_real_array_read;
	da_godot_pool_real_array_write godot_pool_real_array_write;
	da_godot_pool_real_array_set godot_pool_real_array_set;
	da_godot_pool_real_array_get godot_pool_real_array_get;
	da_godot_pool_real_array_size godot_pool_real_array_size;
	da_godot_pool_real_array_destroy godot_pool_real_array_destroy;
	da_godot_pool_string_array_new godot_pool_string_array_new;
	da_godot_pool_string_array_new_copy godot_pool_string_array_new_copy;
	da_godot_pool_string_array_new_with_array godot_pool_string_array_new_with_array;
	da_godot_pool_string_array_append godot_pool_string_array_append;
	da_godot_pool_string_array_append_array godot_pool_string_array_append_array;
	da_godot_pool_string_array_insert godot_pool_string_array_insert;
	da_godot_pool_string_array_invert godot_pool_string_array_invert;
	da_godot_pool_string_array_push_back godot_pool_string_array_push_back;
	da_godot_pool_string_array_remove godot_pool_string_array_remove;
	da_godot_pool_string_array_resize godot_pool_string_array_resize;
	da_godot_pool_string_array_read godot_pool_string_array_read;
	da_godot_pool_string_array_write godot_pool_string_array_write;
	da_godot_pool_string_array_set godot_pool_string_array_set;
	da_godot_pool_string_array_get godot_pool_string_array_get;
	da_godot_pool_string_array_size godot_pool_string_array_size;
	da_godot_pool_string_array_destroy godot_pool_string_array_destroy;
	da_godot_pool_vector2_array_new godot_pool_vector2_array_new;
	da_godot_pool_vector2_array_new_copy godot_pool_vector2_array_new_copy;
	da_godot_pool_vector2_array_new_with_array godot_pool_vector2_array_new_with_array;
	da_godot_pool_vector2_array_append godot_pool_vector2_array_append;
	da_godot_pool_vector2_array_append_array godot_pool_vector2_array_append_array;
	da_godot_pool_vector2_array_insert godot_pool_vector2_array_insert;
	da_godot_pool_vector2_array_invert godot_pool_vector2_array_invert;
	da_godot_pool_vector2_array_push_back godot_pool_vector2_array_push_back;
	da_godot_pool_vector2_array_remove godot_pool_vector2_array_remove;
	da_godot_pool_vector2_array_resize godot_pool_vector2_array_resize;
	da_godot_pool_vector2_array_read godot_pool_vector2_array_read;
	da_godot_pool_vector2_array_write godot_pool_vector2_array_write;
	da_godot_pool_vector2_array_set godot_pool_vector2_array_set;
	da_godot_pool_vector2_array_get godot_pool_vector2_array_get;
	da_godot_pool_vector2_array_size godot_pool_vector2_array_size;
	da_godot_pool_vector2_array_destroy godot_pool_vector2_array_destroy;
	da_godot_pool_vector3_array_new godot_pool_vector3_array_new;
	da_godot_pool_vector3_array_new_copy godot_pool_vector3_array_new_copy;
	da_godot_pool_vector3_array_new_with_array godot_pool_vector3_array_new_with_array;
	da_godot_pool_vector3_array_append godot_pool_vector3_array_append;
	da_godot_pool_vector3_array_append_array godot_pool_vector3_array_append_array;
	da_godot_pool_vector3_array_insert godot_pool_vector3_array_insert;
	da_godot_pool_vector3_array_invert godot_pool_vector3_array_invert;
	da_godot_pool_vector3_array_push_back godot_pool_vector3_array_push_back;
	da_godot_pool_vector3_array_remove godot_pool_vector3_array_remove;
	da_godot_pool_vector3_array_resize godot_pool_vector3_array_resize;
	da_godot_pool_vector3_array_read godot_pool_vector3_array_read;
	da_godot_pool_vector3_array_write godot_pool_vector3_array_write;
	da_godot_pool_vector3_array_set godot_pool_vector3_array_set;
	da_godot_pool_vector3_array_get godot_pool_vector3_array_get;
	da_godot_pool_vector3_array_size godot_pool_vector3_array_size;
	da_godot_pool_vector3_array_destroy godot_pool_vector3_array_destroy;
	da_godot_pool_color_array_new godot_pool_color_array_new;
	da_godot_pool_color_array_new_copy godot_pool_color_array_new_copy;
	da_godot_pool_color_array_new_with_array godot_pool_color_array_new_with_array;
	da_godot_pool_color_array_append godot_pool_color_array_append;
	da_godot_pool_color_array_append_array godot_pool_color_array_append_array;
	da_godot_pool_color_array_insert godot_pool_color_array_insert;
	da_godot_pool_color_array_invert godot_pool_color_array_invert;
	da_godot_pool_color_array_push_back godot_pool_color_array_push_back;
	da_godot_pool_color_array_remove godot_pool_color_array_remove;
	da_godot_pool_color_array_resize godot_pool_color_array_resize;
	da_godot_pool_color_array_read godot_pool_color_array_read;
	da_godot_pool_color_array_write godot_pool_color_array_write;
	da_godot_pool_color_array_set godot_pool_color_array_set;
	da_godot_pool_color_array_get godot_pool_color_array_get;
	da_godot_pool_color_array_size godot_pool_color_array_size;
	da_godot_pool_color_array_destroy godot_pool_color_array_destroy;
	da_godot_pool_byte_array_read_access_copy godot_pool_byte_array_read_access_copy;
	da_godot_pool_byte_array_read_access_ptr godot_pool_byte_array_read_access_ptr;
	da_godot_pool_byte_array_read_access_operator_assign godot_pool_byte_array_read_access_operator_assign;
	da_godot_pool_byte_array_read_access_destroy godot_pool_byte_array_read_access_destroy;
	da_godot_pool_int_array_read_access_copy godot_pool_int_array_read_access_copy;
	da_godot_pool_int_array_read_access_ptr godot_pool_int_array_read_access_ptr;
	da_godot_pool_int_array_read_access_operator_assign godot_pool_int_array_read_access_operator_assign;
	da_godot_pool_int_array_read_access_destroy godot_pool_int_array_read_access_destroy;
	da_godot_pool_real_array_read_access_copy godot_pool_real_array_read_access_copy;
	da_godot_pool_real_array_read_access_ptr godot_pool_real_array_read_access_ptr;
	da_godot_pool_real_array_read_access_operator_assign godot_pool_real_array_read_access_operator_assign;
	da_godot_pool_real_array_read_access_destroy godot_pool_real_array_read_access_destroy;
	da_godot_pool_string_array_read_access_copy godot_pool_string_array_read_access_copy;
	da_godot_pool_string_array_read_access_ptr godot_pool_string_array_read_access_ptr;
	da_godot_pool_string_array_read_access_operator_assign godot_pool_string_array_read_access_operator_assign;
	da_godot_pool_string_array_read_access_destroy godot_pool_string_array_read_access_destroy;
	da_godot_pool_vector2_array_read_access_copy godot_pool_vector2_array_read_access_copy;
	da_godot_pool_vector2_array_read_access_ptr godot_pool_vector2_array_read_access_ptr;
	da_godot_pool_vector2_array_read_access_operator_assign godot_pool_vector2_array_read_access_operator_assign;
	da_godot_pool_vector2_array_read_access_destroy godot_pool_vector2_array_read_access_destroy;
	da_godot_pool_vector3_array_read_access_copy godot_pool_vector3_array_read_access_copy;
	da_godot_pool_vector3_array_read_access_ptr godot_pool_vector3_array_read_access_ptr;
	da_godot_pool_vector3_array_read_access_operator_assign godot_pool_vector3_array_read_access_operator_assign;
	da_godot_pool_vector3_array_read_access_destroy godot_pool_vector3_array_read_access_destroy;
	da_godot_pool_color_array_read_access_copy godot_pool_color_array_read_access_copy;
	da_godot_pool_color_array_read_access_ptr godot_pool_color_array_read_access_ptr;
	da_godot_pool_color_array_read_access_operator_assign godot_pool_color_array_read_access_operator_assign;
	da_godot_pool_color_array_read_access_destroy godot_pool_color_array_read_access_destroy;
	da_godot_pool_byte_array_write_access_copy godot_pool_byte_array_write_access_copy;
	da_godot_pool_byte_array_write_access_ptr godot_pool_byte_array_write_access_ptr;
	da_godot_pool_byte_array_write_access_operator_assign godot_pool_byte_array_write_access_operator_assign;
	da_godot_pool_byte_array_write_access_destroy godot_pool_byte_array_write_access_destroy;
	da_godot_pool_int_array_write_access_copy godot_pool_int_array_write_access_copy;
	da_godot_pool_int_array_write_access_ptr godot_pool_int_array_write_access_ptr;
	da_godot_pool_int_array_write_access_operator_assign godot_pool_int_array_write_access_operator_assign;
	da_godot_pool_int_array_write_access_destroy godot_pool_int_array_write_access_destroy;
	da_godot_pool_real_array_write_access_copy godot_pool_real_array_write_access_copy;
	da_godot_pool_real_array_write_access_ptr godot_pool_real_array_write_access_ptr;
	da_godot_pool_real_array_write_access_operator_assign godot_pool_real_array_write_access_operator_assign;
	da_godot_pool_real_array_write_access_destroy godot_pool_real_array_write_access_destroy;
	da_godot_pool_string_array_write_access_copy godot_pool_string_array_write_access_copy;
	da_godot_pool_string_array_write_access_ptr godot_pool_string_array_write_access_ptr;
	da_godot_pool_string_array_write_access_operator_assign godot_pool_string_array_write_access_operator_assign;
	da_godot_pool_string_array_write_access_destroy godot_pool_string_array_write_access_destroy;
	da_godot_pool_vector2_array_write_access_copy godot_pool_vector2_array_write_access_copy;
	da_godot_pool_vector2_array_write_access_ptr godot_pool_vector2_array_write_access_ptr;
	da_godot_pool_vector2_array_write_access_operator_assign godot_pool_vector2_array_write_access_operator_assign;
	da_godot_pool_vector2_array_write_access_destroy godot_pool_vector2_array_write_access_destroy;
	da_godot_pool_vector3_array_write_access_copy godot_pool_vector3_array_write_access_copy;
	da_godot_pool_vector3_array_write_access_ptr godot_pool_vector3_array_write_access_ptr;
	da_godot_pool_vector3_array_write_access_operator_assign godot_pool_vector3_array_write_access_operator_assign;
	da_godot_pool_vector3_array_write_access_destroy godot_pool_vector3_array_write_access_destroy;
	da_godot_pool_color_array_write_access_copy godot_pool_color_array_write_access_copy;
	da_godot_pool_color_array_write_access_ptr godot_pool_color_array_write_access_ptr;
	da_godot_pool_color_array_write_access_operator_assign godot_pool_color_array_write_access_operator_assign;
	da_godot_pool_color_array_write_access_destroy godot_pool_color_array_write_access_destroy;
	da_godot_array_new godot_array_new;
	da_godot_array_new_copy godot_array_new_copy;
	da_godot_array_new_pool_color_array godot_array_new_pool_color_array;
	da_godot_array_new_pool_vector3_array godot_array_new_pool_vector3_array;
	da_godot_array_new_pool_vector2_array godot_array_new_pool_vector2_array;
	da_godot_array_new_pool_string_array godot_array_new_pool_string_array;
	da_godot_array_new_pool_real_array godot_array_new_pool_real_array;
	da_godot_array_new_pool_int_array godot_array_new_pool_int_array;
	da_godot_array_new_pool_byte_array godot_array_new_pool_byte_array;
	da_godot_array_set godot_array_set;
	da_godot_array_get godot_array_get;
	da_godot_array_operator_index godot_array_operator_index;
	da_godot_array_operator_index_const godot_array_operator_index_const;
	da_godot_array_append godot_array_append;
	da_godot_array_clear godot_array_clear;
	da_godot_array_count godot_array_count;
	da_godot_array_empty godot_array_empty;
	da_godot_array_erase godot_array_erase;
	da_godot_array_front godot_array_front;
	da_godot_array_back godot_array_back;
	da_godot_array_find godot_array_find;
	da_godot_array_find_last godot_array_find_last;
	da_godot_array_has godot_array_has;
	da_godot_array_hash godot_array_hash;
	da_godot_array_insert godot_array_insert;
	da_godot_array_invert godot_array_invert;
	da_godot_array_pop_back godot_array_pop_back;
	da_godot_array_pop_front godot_array_pop_front;
	da_godot_array_push_back godot_array_push_back;
	da_godot_array_push_front godot_array_push_front;
	da_godot_array_remove godot_array_remove;
	da_godot_array_resize godot_array_resize;
	da_godot_array_rfind godot_array_rfind;
	da_godot_array_size godot_array_size;
	da_godot_array_sort godot_array_sort;
	da_godot_array_sort_custom godot_array_sort_custom;
	da_godot_array_bsearch godot_array_bsearch;
	da_godot_array_bsearch_custom godot_array_bsearch_custom;
	da_godot_array_destroy godot_array_destroy;
	da_godot_dictionary_new godot_dictionary_new;
	da_godot_dictionary_new_copy godot_dictionary_new_copy;
	da_godot_dictionary_destroy godot_dictionary_destroy;
	da_godot_dictionary_size godot_dictionary_size;
	da_godot_dictionary_empty godot_dictionary_empty;
	da_godot_dictionary_clear godot_dictionary_clear;
	da_godot_dictionary_has godot_dictionary_has;
	da_godot_dictionary_has_all godot_dictionary_has_all;
	da_godot_dictionary_erase godot_dictionary_erase;
	da_godot_dictionary_hash godot_dictionary_hash;
	da_godot_dictionary_keys godot_dictionary_keys;
	da_godot_dictionary_values godot_dictionary_values;
	da_godot_dictionary_get godot_dictionary_get;
	da_godot_dictionary_set godot_dictionary_set;
	da_godot_dictionary_operator_index godot_dictionary_operator_index;
	da_godot_dictionary_operator_index_const godot_dictionary_operator_index_const;
	da_godot_dictionary_next godot_dictionary_next;
	da_godot_dictionary_operator_equal godot_dictionary_operator_equal;
	da_godot_dictionary_to_json godot_dictionary_to_json;
	da_godot_node_path_new godot_node_path_new;
	da_godot_node_path_new_copy godot_node_path_new_copy;
	da_godot_node_path_destroy godot_node_path_destroy;
	da_godot_node_path_as_string godot_node_path_as_string;
	da_godot_node_path_is_absolute godot_node_path_is_absolute;
	da_godot_node_path_get_name_count godot_node_path_get_name_count;
	da_godot_node_path_get_name godot_node_path_get_name;
	da_godot_node_path_get_subname_count godot_node_path_get_subname_count;
	da_godot_node_path_get_subname godot_node_path_get_subname;
	da_godot_node_path_get_concatenated_subnames godot_node_path_get_concatenated_subnames;
	da_godot_node_path_is_empty godot_node_path_is_empty;
	da_godot_node_path_operator_equal godot_node_path_operator_equal;
	da_godot_plane_new_with_reals godot_plane_new_with_reals;
	da_godot_plane_new_with_vectors godot_plane_new_with_vectors;
	da_godot_plane_new_with_normal godot_plane_new_with_normal;
	da_godot_plane_as_string godot_plane_as_string;
	da_godot_plane_normalized godot_plane_normalized;
	da_godot_plane_center godot_plane_center;
	da_godot_plane_get_any_point godot_plane_get_any_point;
	da_godot_plane_is_point_over godot_plane_is_point_over;
	da_godot_plane_distance_to godot_plane_distance_to;
	da_godot_plane_has_point godot_plane_has_point;
	da_godot_plane_project godot_plane_project;
	da_godot_plane_intersect_3 godot_plane_intersect_3;
	da_godot_plane_intersects_ray godot_plane_intersects_ray;
	da_godot_plane_intersects_segment godot_plane_intersects_segment;
	da_godot_plane_operator_neg godot_plane_operator_neg;
	da_godot_plane_operator_equal godot_plane_operator_equal;
	da_godot_plane_set_normal godot_plane_set_normal;
	da_godot_plane_get_normal godot_plane_get_normal;
	da_godot_plane_get_d godot_plane_get_d;
	da_godot_plane_set_d godot_plane_set_d;
	da_godot_rect2_new_with_position_and_size godot_rect2_new_with_position_and_size;
	da_godot_rect2_new godot_rect2_new;
	da_godot_rect2_as_string godot_rect2_as_string;
	da_godot_rect2_get_area godot_rect2_get_area;
	da_godot_rect2_intersects godot_rect2_intersects;
	da_godot_rect2_encloses godot_rect2_encloses;
	da_godot_rect2_has_no_area godot_rect2_has_no_area;
	da_godot_rect2_clip godot_rect2_clip;
	da_godot_rect2_merge godot_rect2_merge;
	da_godot_rect2_has_point godot_rect2_has_point;
	da_godot_rect2_grow godot_rect2_grow;
	da_godot_rect2_expand godot_rect2_expand;
	da_godot_rect2_operator_equal godot_rect2_operator_equal;
	da_godot_rect2_get_position godot_rect2_get_position;
	da_godot_rect2_get_size godot_rect2_get_size;
	da_godot_rect2_set_position godot_rect2_set_position;
	da_godot_rect2_set_size godot_rect2_set_size;
	da_godot_aabb_new godot_aabb_new;
	da_godot_aabb_get_position godot_aabb_get_position;
	da_godot_aabb_set_position godot_aabb_set_position;
	da_godot_aabb_get_size godot_aabb_get_size;
	da_godot_aabb_set_size godot_aabb_set_size;
	da_godot_aabb_as_string godot_aabb_as_string;
	da_godot_aabb_get_area godot_aabb_get_area;
	da_godot_aabb_has_no_area godot_aabb_has_no_area;
	da_godot_aabb_has_no_surface godot_aabb_has_no_surface;
	da_godot_aabb_intersects godot_aabb_intersects;
	da_godot_aabb_encloses godot_aabb_encloses;
	da_godot_aabb_merge godot_aabb_merge;
	da_godot_aabb_intersection godot_aabb_intersection;
	da_godot_aabb_intersects_plane godot_aabb_intersects_plane;
	da_godot_aabb_intersects_segment godot_aabb_intersects_segment;
	da_godot_aabb_has_point godot_aabb_has_point;
	da_godot_aabb_get_support godot_aabb_get_support;
	da_godot_aabb_get_longest_axis godot_aabb_get_longest_axis;
	da_godot_aabb_get_longest_axis_index godot_aabb_get_longest_axis_index;
	da_godot_aabb_get_longest_axis_size godot_aabb_get_longest_axis_size;
	da_godot_aabb_get_shortest_axis godot_aabb_get_shortest_axis;
	da_godot_aabb_get_shortest_axis_index godot_aabb_get_shortest_axis_index;
	da_godot_aabb_get_shortest_axis_size godot_aabb_get_shortest_axis_size;
	da_godot_aabb_expand godot_aabb_expand;
	da_godot_aabb_grow godot_aabb_grow;
	da_godot_aabb_get_endpoint godot_aabb_get_endpoint;
	da_godot_aabb_operator_equal godot_aabb_operator_equal;
	da_godot_rid_new godot_rid_new;
	da_godot_rid_get_id godot_rid_get_id;
	da_godot_rid_new_with_resource godot_rid_new_with_resource;
	da_godot_rid_operator_equal godot_rid_operator_equal;
	da_godot_rid_operator_less godot_rid_operator_less;
	da_godot_transform_new_with_axis_origin godot_transform_new_with_axis_origin;
	da_godot_transform_new godot_transform_new;
	da_godot_transform_get_basis godot_transform_get_basis;
	da_godot_transform_set_basis godot_transform_set_basis;
	da_godot_transform_get_origin godot_transform_get_origin;
	da_godot_transform_set_origin godot_transform_set_origin;
	da_godot_transform_as_string godot_transform_as_string;
	da_godot_transform_inverse godot_transform_inverse;
	da_godot_transform_affine_inverse godot_transform_affine_inverse;
	da_godot_transform_orthonormalized godot_transform_orthonormalized;
	da_godot_transform_rotated godot_transform_rotated;
	da_godot_transform_scaled godot_transform_scaled;
	da_godot_transform_translated godot_transform_translated;
	da_godot_transform_looking_at godot_transform_looking_at;
	da_godot_transform_xform_plane godot_transform_xform_plane;
	da_godot_transform_xform_inv_plane godot_transform_xform_inv_plane;
	da_godot_transform_new_identity godot_transform_new_identity;
	da_godot_transform_operator_equal godot_transform_operator_equal;
	da_godot_transform_operator_multiply godot_transform_operator_multiply;
	da_godot_transform_xform_vector3 godot_transform_xform_vector3;
	da_godot_transform_xform_inv_vector3 godot_transform_xform_inv_vector3;
	da_godot_transform_xform_aabb godot_transform_xform_aabb;
	da_godot_transform_xform_inv_aabb godot_transform_xform_inv_aabb;
	da_godot_transform2d_new godot_transform2d_new;
	da_godot_transform2d_new_axis_origin godot_transform2d_new_axis_origin;
	da_godot_transform2d_as_string godot_transform2d_as_string;
	da_godot_transform2d_inverse godot_transform2d_inverse;
	da_godot_transform2d_affine_inverse godot_transform2d_affine_inverse;
	da_godot_transform2d_get_rotation godot_transform2d_get_rotation;
	da_godot_transform2d_get_origin godot_transform2d_get_origin;
	da_godot_transform2d_get_scale godot_transform2d_get_scale;
	da_godot_transform2d_orthonormalized godot_transform2d_orthonormalized;
	da_godot_transform2d_rotated godot_transform2d_rotated;
	da_godot_transform2d_scaled godot_transform2d_scaled;
	da_godot_transform2d_translated godot_transform2d_translated;
	da_godot_transform2d_xform_vector2 godot_transform2d_xform_vector2;
	da_godot_transform2d_xform_inv_vector2 godot_transform2d_xform_inv_vector2;
	da_godot_transform2d_basis_xform_vector2 godot_transform2d_basis_xform_vector2;
	da_godot_transform2d_basis_xform_inv_vector2 godot_transform2d_basis_xform_inv_vector2;
	da_godot_transform2d_interpolate_with godot_transform2d_interpolate_with;
	da_godot_transform2d_operator_equal godot_transform2d_operator_equal;
	da_godot_transform2d_operator_multiply godot_transform2d_operator_multiply;
	da_godot_transform2d_new_identity godot_transform2d_new_identity;
	da_godot_transform2d_xform_rect2 godot_transform2d_xform_rect2;
	da_godot_transform2d_xform_inv_rect2 godot_transform2d_xform_inv_rect2;
	da_godot_variant_get_type godot_variant_get_type;
	da_godot_variant_new_copy godot_variant_new_copy;
	da_godot_variant_new_nil godot_variant_new_nil;
	da_godot_variant_new_bool godot_variant_new_bool;
	da_godot_variant_new_uint godot_variant_new_uint;
	da_godot_variant_new_int godot_variant_new_int;
	da_godot_variant_new_real godot_variant_new_real;
	da_godot_variant_new_string godot_variant_new_string;
	da_godot_variant_new_vector2 godot_variant_new_vector2;
	da_godot_variant_new_rect2 godot_variant_new_rect2;
	da_godot_variant_new_vector3 godot_variant_new_vector3;
	da_godot_variant_new_transform2d godot_variant_new_transform2d;
	da_godot_variant_new_plane godot_variant_new_plane;
	da_godot_variant_new_quat godot_variant_new_quat;
	da_godot_variant_new_aabb godot_variant_new_aabb;
	da_godot_variant_new_basis godot_variant_new_basis;
	da_godot_variant_new_transform godot_variant_new_transform;
	da_godot_variant_new_color godot_variant_new_color;
	da_godot_variant_new_node_path godot_variant_new_node_path;
	da_godot_variant_new_rid godot_variant_new_rid;
	da_godot_variant_new_object godot_variant_new_object;
	da_godot_variant_new_dictionary godot_variant_new_dictionary;
	da_godot_variant_new_array godot_variant_new_array;
	da_godot_variant_new_pool_byte_array godot_variant_new_pool_byte_array;
	da_godot_variant_new_pool_int_array godot_variant_new_pool_int_array;
	da_godot_variant_new_pool_real_array godot_variant_new_pool_real_array;
	da_godot_variant_new_pool_string_array godot_variant_new_pool_string_array;
	da_godot_variant_new_pool_vector2_array godot_variant_new_pool_vector2_array;
	da_godot_variant_new_pool_vector3_array godot_variant_new_pool_vector3_array;
	da_godot_variant_new_pool_color_array godot_variant_new_pool_color_array;
	da_godot_variant_as_bool godot_variant_as_bool;
	da_godot_variant_as_uint godot_variant_as_uint;
	da_godot_variant_as_int godot_variant_as_int;
	da_godot_variant_as_real godot_variant_as_real;
	da_godot_variant_as_string godot_variant_as_string;
	da_godot_variant_as_vector2 godot_variant_as_vector2;
	da_godot_variant_as_rect2 godot_variant_as_rect2;
	da_godot_variant_as_vector3 godot_variant_as_vector3;
	da_godot_variant_as_transform2d godot_variant_as_transform2d;
	da_godot_variant_as_plane godot_variant_as_plane;
	da_godot_variant_as_quat godot_variant_as_quat;
	da_godot_variant_as_aabb godot_variant_as_aabb;
	da_godot_variant_as_basis godot_variant_as_basis;
	da_godot_variant_as_transform godot_variant_as_transform;
	da_godot_variant_as_color godot_variant_as_color;
	da_godot_variant_as_node_path godot_variant_as_node_path;
	da_godot_variant_as_rid godot_variant_as_rid;
	da_godot_variant_as_object godot_variant_as_object;
	da_godot_variant_as_dictionary godot_variant_as_dictionary;
	da_godot_variant_as_array godot_variant_as_array;
	da_godot_variant_as_pool_byte_array godot_variant_as_pool_byte_array;
	da_godot_variant_as_pool_int_array godot_variant_as_pool_int_array;
	da_godot_variant_as_pool_real_array godot_variant_as_pool_real_array;
	da_godot_variant_as_pool_string_array godot_variant_as_pool_string_array;
	da_godot_variant_as_pool_vector2_array godot_variant_as_pool_vector2_array;
	da_godot_variant_as_pool_vector3_array godot_variant_as_pool_vector3_array;
	da_godot_variant_as_pool_color_array godot_variant_as_pool_color_array;
	da_godot_variant_call godot_variant_call;
	da_godot_variant_has_method godot_variant_has_method;
	da_godot_variant_operator_equal godot_variant_operator_equal;
	da_godot_variant_operator_less godot_variant_operator_less;
	da_godot_variant_hash_compare godot_variant_hash_compare;
	da_godot_variant_booleanize godot_variant_booleanize;
	da_godot_variant_destroy godot_variant_destroy;
	da_godot_char_string_length godot_char_string_length;
	da_godot_char_string_get_data godot_char_string_get_data;
	da_godot_char_string_destroy godot_char_string_destroy;
	da_godot_string_new godot_string_new;
	da_godot_string_new_copy godot_string_new_copy;
	da_godot_string_new_with_wide_string godot_string_new_with_wide_string;
	da_godot_string_operator_index godot_string_operator_index;
	da_godot_string_operator_index_const godot_string_operator_index_const;
	da_godot_string_wide_str godot_string_wide_str;
	da_godot_string_operator_equal godot_string_operator_equal;
	da_godot_string_operator_less godot_string_operator_less;
	da_godot_string_operator_plus godot_string_operator_plus;
	da_godot_string_length godot_string_length;
	da_godot_string_casecmp_to godot_string_casecmp_to;
	da_godot_string_nocasecmp_to godot_string_nocasecmp_to;
	da_godot_string_naturalnocasecmp_to godot_string_naturalnocasecmp_to;
	da_godot_string_begins_with godot_string_begins_with;
	da_godot_string_begins_with_char_array godot_string_begins_with_char_array;
	da_godot_string_bigrams godot_string_bigrams;
	da_godot_string_chr godot_string_chr;
	da_godot_string_ends_with godot_string_ends_with;
	da_godot_string_find godot_string_find;
	da_godot_string_find_from godot_string_find_from;
	da_godot_string_findmk godot_string_findmk;
	da_godot_string_findmk_from godot_string_findmk_from;
	da_godot_string_findmk_from_in_place godot_string_findmk_from_in_place;
	da_godot_string_findn godot_string_findn;
	da_godot_string_findn_from godot_string_findn_from;
	da_godot_string_find_last godot_string_find_last;
	da_godot_string_format godot_string_format;
	da_godot_string_format_with_custom_placeholder godot_string_format_with_custom_placeholder;
	da_godot_string_hex_encode_buffer godot_string_hex_encode_buffer;
	da_godot_string_hex_to_int godot_string_hex_to_int;
	da_godot_string_hex_to_int_without_prefix godot_string_hex_to_int_without_prefix;
	da_godot_string_insert godot_string_insert;
	da_godot_string_is_numeric godot_string_is_numeric;
	da_godot_string_is_subsequence_of godot_string_is_subsequence_of;
	da_godot_string_is_subsequence_ofi godot_string_is_subsequence_ofi;
	da_godot_string_lpad godot_string_lpad;
	da_godot_string_lpad_with_custom_character godot_string_lpad_with_custom_character;
	da_godot_string_match godot_string_match;
	da_godot_string_matchn godot_string_matchn;
	da_godot_string_md5 godot_string_md5;
	da_godot_string_num godot_string_num;
	da_godot_string_num_int64 godot_string_num_int64;
	da_godot_string_num_int64_capitalized godot_string_num_int64_capitalized;
	da_godot_string_num_real godot_string_num_real;
	da_godot_string_num_scientific godot_string_num_scientific;
	da_godot_string_num_with_decimals godot_string_num_with_decimals;
	da_godot_string_pad_decimals godot_string_pad_decimals;
	da_godot_string_pad_zeros godot_string_pad_zeros;
	da_godot_string_replace_first godot_string_replace_first;
	da_godot_string_replace godot_string_replace;
	da_godot_string_replacen godot_string_replacen;
	da_godot_string_rfind godot_string_rfind;
	da_godot_string_rfindn godot_string_rfindn;
	da_godot_string_rfind_from godot_string_rfind_from;
	da_godot_string_rfindn_from godot_string_rfindn_from;
	da_godot_string_rpad godot_string_rpad;
	da_godot_string_rpad_with_custom_character godot_string_rpad_with_custom_character;
	da_godot_string_similarity godot_string_similarity;
	da_godot_string_sprintf godot_string_sprintf;
	da_godot_string_substr godot_string_substr;
	da_godot_string_to_double godot_string_to_double;
	da_godot_string_to_float godot_string_to_float;
	da_godot_string_to_int godot_string_to_int;
	da_godot_string_camelcase_to_underscore godot_string_camelcase_to_underscore;
	da_godot_string_camelcase_to_underscore_lowercased godot_string_camelcase_to_underscore_lowercased;
	da_godot_string_capitalize godot_string_capitalize;
	da_godot_string_char_to_double godot_string_char_to_double;
	da_godot_string_char_to_int godot_string_char_to_int;
	da_godot_string_wchar_to_int godot_string_wchar_to_int;
	da_godot_string_char_to_int_with_len godot_string_char_to_int_with_len;
	da_godot_string_char_to_int64_with_len godot_string_char_to_int64_with_len;
	da_godot_string_hex_to_int64 godot_string_hex_to_int64;
	da_godot_string_hex_to_int64_with_prefix godot_string_hex_to_int64_with_prefix;
	da_godot_string_to_int64 godot_string_to_int64;
	da_godot_string_unicode_char_to_double godot_string_unicode_char_to_double;
	da_godot_string_get_slice_count godot_string_get_slice_count;
	da_godot_string_get_slice godot_string_get_slice;
	da_godot_string_get_slicec godot_string_get_slicec;
	da_godot_string_split godot_string_split;
	da_godot_string_split_allow_empty godot_string_split_allow_empty;
	da_godot_string_split_floats godot_string_split_floats;
	da_godot_string_split_floats_allows_empty godot_string_split_floats_allows_empty;
	da_godot_string_split_floats_mk godot_string_split_floats_mk;
	da_godot_string_split_floats_mk_allows_empty godot_string_split_floats_mk_allows_empty;
	da_godot_string_split_ints godot_string_split_ints;
	da_godot_string_split_ints_allows_empty godot_string_split_ints_allows_empty;
	da_godot_string_split_ints_mk godot_string_split_ints_mk;
	da_godot_string_split_ints_mk_allows_empty godot_string_split_ints_mk_allows_empty;
	da_godot_string_split_spaces godot_string_split_spaces;
	da_godot_string_char_lowercase godot_string_char_lowercase;
	da_godot_string_char_uppercase godot_string_char_uppercase;
	da_godot_string_to_lower godot_string_to_lower;
	da_godot_string_to_upper godot_string_to_upper;
	da_godot_string_get_basename godot_string_get_basename;
	da_godot_string_get_extension godot_string_get_extension;
	da_godot_string_left godot_string_left;
	da_godot_string_ord_at godot_string_ord_at;
	da_godot_string_plus_file godot_string_plus_file;
	da_godot_string_right godot_string_right;
	da_godot_string_strip_edges godot_string_strip_edges;
	da_godot_string_strip_escapes godot_string_strip_escapes;
	da_godot_string_erase godot_string_erase;
	da_godot_string_ascii godot_string_ascii;
	da_godot_string_ascii_extended godot_string_ascii_extended;
	da_godot_string_utf8 godot_string_utf8;
	da_godot_string_parse_utf8 godot_string_parse_utf8;
	da_godot_string_parse_utf8_with_len godot_string_parse_utf8_with_len;
	da_godot_string_chars_to_utf8 godot_string_chars_to_utf8;
	da_godot_string_chars_to_utf8_with_len godot_string_chars_to_utf8_with_len;
	da_godot_string_hash godot_string_hash;
	da_godot_string_hash64 godot_string_hash64;
	da_godot_string_hash_chars godot_string_hash_chars;
	da_godot_string_hash_chars_with_len godot_string_hash_chars_with_len;
	da_godot_string_hash_utf8_chars godot_string_hash_utf8_chars;
	da_godot_string_hash_utf8_chars_with_len godot_string_hash_utf8_chars_with_len;
	da_godot_string_md5_buffer godot_string_md5_buffer;
	da_godot_string_md5_text godot_string_md5_text;
	da_godot_string_sha256_buffer godot_string_sha256_buffer;
	da_godot_string_sha256_text godot_string_sha256_text;
	da_godot_string_empty godot_string_empty;
	da_godot_string_get_base_dir godot_string_get_base_dir;
	da_godot_string_get_file godot_string_get_file;
	da_godot_string_humanize_size godot_string_humanize_size;
	da_godot_string_is_abs_path godot_string_is_abs_path;
	da_godot_string_is_rel_path godot_string_is_rel_path;
	da_godot_string_is_resource_file godot_string_is_resource_file;
	da_godot_string_path_to godot_string_path_to;
	da_godot_string_path_to_file godot_string_path_to_file;
	da_godot_string_simplify_path godot_string_simplify_path;
	da_godot_string_c_escape godot_string_c_escape;
	da_godot_string_c_escape_multiline godot_string_c_escape_multiline;
	da_godot_string_c_unescape godot_string_c_unescape;
	da_godot_string_http_escape godot_string_http_escape;
	da_godot_string_http_unescape godot_string_http_unescape;
	da_godot_string_json_escape godot_string_json_escape;
	da_godot_string_word_wrap godot_string_word_wrap;
	da_godot_string_xml_escape godot_string_xml_escape;
	da_godot_string_xml_escape_with_quotes godot_string_xml_escape_with_quotes;
	da_godot_string_xml_unescape godot_string_xml_unescape;
	da_godot_string_percent_decode godot_string_percent_decode;
	da_godot_string_percent_encode godot_string_percent_encode;
	da_godot_string_is_valid_float godot_string_is_valid_float;
	da_godot_string_is_valid_hex_number godot_string_is_valid_hex_number;
	da_godot_string_is_valid_html_color godot_string_is_valid_html_color;
	da_godot_string_is_valid_identifier godot_string_is_valid_identifier;
	da_godot_string_is_valid_integer godot_string_is_valid_integer;
	da_godot_string_is_valid_ip_address godot_string_is_valid_ip_address;
	da_godot_string_destroy godot_string_destroy;
	da_godot_string_name_new godot_string_name_new;
	da_godot_string_name_new_data godot_string_name_new_data;
	da_godot_string_name_get_name godot_string_name_get_name;
	da_godot_string_name_get_hash godot_string_name_get_hash;
	da_godot_string_name_get_data_unique_pointer godot_string_name_get_data_unique_pointer;
	da_godot_string_name_operator_equal godot_string_name_operator_equal;
	da_godot_string_name_operator_less godot_string_name_operator_less;
	da_godot_string_name_destroy godot_string_name_destroy;
	da_godot_object_destroy godot_object_destroy;
	da_godot_global_get_singleton godot_global_get_singleton;
	da_godot_method_bind_get_method godot_method_bind_get_method;
	da_godot_method_bind_ptrcall godot_method_bind_ptrcall;
	da_godot_method_bind_call godot_method_bind_call;
	da_godot_get_class_constructor godot_get_class_constructor;
	da_godot_get_global_constants godot_get_global_constants;
	da_godot_register_native_call_type godot_register_native_call_type;
	da_godot_alloc godot_alloc;
	da_godot_realloc godot_realloc;
	da_godot_free godot_free;
	da_godot_print_error godot_print_error;
	da_godot_print_warning godot_print_warning;
	da_godot_print godot_print;
const(godot_gdnative_core_api_struct_1_1*) nextVersion() const { return cast(typeof(return))next; }
alias nextVersion this;
}
__gshared const(godot_gdnative_core_api_struct)* _godot_api = null;
private alias apiStruct(ApiType t : ApiType.core) = _godot_api;

private extern(C) @nogc nothrow
{
	alias da_godot_color_to_abgr32 = godot_int function(const godot_color * p_self);
	alias da_godot_color_to_abgr64 = godot_int function(const godot_color * p_self);
	alias da_godot_color_to_argb64 = godot_int function(const godot_color * p_self);
	alias da_godot_color_to_rgba64 = godot_int function(const godot_color * p_self);
	alias da_godot_color_darkened = godot_color function(const godot_color * p_self, const godot_real p_amount);
	alias da_godot_color_from_hsv = godot_color function(const godot_color * p_self, const godot_real p_h, const godot_real p_s, const godot_real p_v, const godot_real p_a);
	alias da_godot_color_lightened = godot_color function(const godot_color * p_self, const godot_real p_amount);
	alias da_godot_array_duplicate = godot_array function(const godot_array * p_self, const godot_bool p_deep);
	alias da_godot_array_max = godot_variant function(const godot_array * p_self);
	alias da_godot_array_min = godot_variant function(const godot_array * p_self);
	alias da_godot_array_shuffle = void function(godot_array * p_self);
	alias da_godot_basis_slerp = godot_basis function(const godot_basis * p_self, const godot_basis * p_b, const godot_real p_t);
	alias da_godot_dictionary_get_with_default = godot_variant function(const godot_dictionary * p_self, const godot_variant * p_key, const godot_variant * p_default);
	alias da_godot_dictionary_erase_with_return = bool function(godot_dictionary * p_self, const godot_variant * p_key);
	alias da_godot_node_path_get_as_property_path = godot_node_path function(const godot_node_path * p_self);
	alias da_godot_quat_set_axis_angle = void function(godot_quat * p_self, const godot_vector3 * p_axis, const godot_real p_angle);
	alias da_godot_rect2_grow_individual = godot_rect2 function(const godot_rect2 * p_self, const godot_real p_left, const godot_real p_top, const godot_real p_right, const godot_real p_bottom);
	alias da_godot_rect2_grow_margin = godot_rect2 function(const godot_rect2 * p_self, const godot_int p_margin, const godot_real p_by);
	alias da_godot_rect2_abs = godot_rect2 function(const godot_rect2 * p_self);
	alias da_godot_string_dedent = godot_string function(const godot_string * p_self);
	alias da_godot_string_trim_prefix = godot_string function(const godot_string * p_self, const godot_string * p_prefix);
	alias da_godot_string_trim_suffix = godot_string function(const godot_string * p_self, const godot_string * p_suffix);
	alias da_godot_string_rstrip = godot_string function(const godot_string * p_self, const godot_string * p_chars);
	alias da_godot_string_rsplit = godot_pool_string_array function(const godot_string * p_self, const godot_string * p_divisor, const godot_bool p_allow_empty, const godot_int p_maxsplit);
	alias da_godot_basis_get_quat = godot_quat function(const godot_basis * p_self);
	alias da_godot_basis_set_quat = void function(godot_basis * p_self, const godot_quat * p_quat);
	alias da_godot_basis_set_axis_angle_scale = void function(godot_basis * p_self, const godot_vector3 * p_axis, godot_real p_phi, const godot_vector3 * p_scale);
	alias da_godot_basis_set_euler_scale = void function(godot_basis * p_self, const godot_vector3 * p_euler, const godot_vector3 * p_scale);
	alias da_godot_basis_set_quat_scale = void function(godot_basis * p_self, const godot_quat * p_quat, const godot_vector3 * p_scale);
	alias da_godot_is_instance_valid = bool function(const godot_object  p_object);
	alias da_godot_quat_new_with_basis = void function(godot_quat * r_dest, const godot_basis * p_basis);
	alias da_godot_quat_new_with_euler = void function(godot_quat * r_dest, const godot_vector3 * p_euler);
	alias da_godot_transform_new_with_quat = void function(godot_transform * r_dest, const godot_quat * p_quat);
	alias da_godot_variant_get_operator_name = godot_string function(godot_variant_operator p_op);
	alias da_godot_variant_evaluate = void function(godot_variant_operator p_op, const godot_variant * p_a, const godot_variant * p_b, godot_variant * r_ret, godot_bool * r_valid);
}
public extern(C) struct godot_gdnative_core_api_struct_1_1
{
@nogc nothrow:

			mixin ApiStructHeader;
			da_godot_color_to_abgr32 godot_color_to_abgr32;
	da_godot_color_to_abgr64 godot_color_to_abgr64;
	da_godot_color_to_argb64 godot_color_to_argb64;
	da_godot_color_to_rgba64 godot_color_to_rgba64;
	da_godot_color_darkened godot_color_darkened;
	da_godot_color_from_hsv godot_color_from_hsv;
	da_godot_color_lightened godot_color_lightened;
	da_godot_array_duplicate godot_array_duplicate;
	da_godot_array_max godot_array_max;
	da_godot_array_min godot_array_min;
	da_godot_array_shuffle godot_array_shuffle;
	da_godot_basis_slerp godot_basis_slerp;
	da_godot_dictionary_get_with_default godot_dictionary_get_with_default;
	da_godot_dictionary_erase_with_return godot_dictionary_erase_with_return;
	da_godot_node_path_get_as_property_path godot_node_path_get_as_property_path;
	da_godot_quat_set_axis_angle godot_quat_set_axis_angle;
	da_godot_rect2_grow_individual godot_rect2_grow_individual;
	da_godot_rect2_grow_margin godot_rect2_grow_margin;
	da_godot_rect2_abs godot_rect2_abs;
	da_godot_string_dedent godot_string_dedent;
	da_godot_string_trim_prefix godot_string_trim_prefix;
	da_godot_string_trim_suffix godot_string_trim_suffix;
	da_godot_string_rstrip godot_string_rstrip;
	da_godot_string_rsplit godot_string_rsplit;
	da_godot_basis_get_quat godot_basis_get_quat;
	da_godot_basis_set_quat godot_basis_set_quat;
	da_godot_basis_set_axis_angle_scale godot_basis_set_axis_angle_scale;
	da_godot_basis_set_euler_scale godot_basis_set_euler_scale;
	da_godot_basis_set_quat_scale godot_basis_set_quat_scale;
	da_godot_is_instance_valid godot_is_instance_valid;
	da_godot_quat_new_with_basis godot_quat_new_with_basis;
	da_godot_quat_new_with_euler godot_quat_new_with_euler;
	da_godot_transform_new_with_quat godot_transform_new_with_quat;
	da_godot_variant_get_operator_name godot_variant_get_operator_name;
	da_godot_variant_evaluate godot_variant_evaluate;
const(godot_gdnative_core_api_struct_1_2*) nextVersion() const { return cast(typeof(return))next; }
alias nextVersion this;
}

private extern(C) @nogc nothrow
{
	alias da_godot_dictionary_duplicate = godot_dictionary function(const godot_dictionary * p_self, const godot_bool p_deep);
	alias da_godot_vector3_move_toward = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_to, const godot_real p_delta);
	alias da_godot_vector2_move_toward = godot_vector2 function(const godot_vector2 * p_self, const godot_vector2 * p_to, const godot_real p_delta);
	alias da_godot_string_count = godot_int function(const godot_string * p_self, godot_string p_what, godot_int p_from, godot_int p_to);
	alias da_godot_string_countn = godot_int function(const godot_string * p_self, godot_string p_what, godot_int p_from, godot_int p_to);
	alias da_godot_vector3_direction_to = godot_vector3 function(const godot_vector3 * p_self, const godot_vector3 * p_to);
	alias da_godot_vector2_direction_to = godot_vector2 function(const godot_vector2 * p_self, const godot_vector2 * p_to);
	alias da_godot_array_slice = godot_array function(const godot_array * p_self, const godot_int p_begin, const godot_int p_end, const godot_int p_step, const godot_bool p_deep);
	alias da_godot_pool_byte_array_empty = godot_bool function(const godot_pool_byte_array * p_self);
	alias da_godot_pool_int_array_empty = godot_bool function(const godot_pool_int_array * p_self);
	alias da_godot_pool_real_array_empty = godot_bool function(const godot_pool_real_array * p_self);
	alias da_godot_pool_string_array_empty = godot_bool function(const godot_pool_string_array * p_self);
	alias da_godot_pool_vector2_array_empty = godot_bool function(const godot_pool_vector2_array * p_self);
	alias da_godot_pool_vector3_array_empty = godot_bool function(const godot_pool_vector3_array * p_self);
	alias da_godot_pool_color_array_empty = godot_bool function(const godot_pool_color_array * p_self);
	alias da_godot_get_class_tag = void * function(const godot_string_name * p_class);
	alias da_godot_object_cast_to = godot_object  function(const godot_object  p_object, void * p_class_tag);
	alias da_godot_instance_from_id = godot_object  function(godot_int p_instance_id);
}
public extern(C) struct godot_gdnative_core_api_struct_1_2
{
@nogc nothrow:

			mixin ApiStructHeader;
			da_godot_dictionary_duplicate godot_dictionary_duplicate;
	da_godot_vector3_move_toward godot_vector3_move_toward;
	da_godot_vector2_move_toward godot_vector2_move_toward;
	da_godot_string_count godot_string_count;
	da_godot_string_countn godot_string_countn;
	da_godot_vector3_direction_to godot_vector3_direction_to;
	da_godot_vector2_direction_to godot_vector2_direction_to;
	da_godot_array_slice godot_array_slice;
	da_godot_pool_byte_array_empty godot_pool_byte_array_empty;
	da_godot_pool_int_array_empty godot_pool_int_array_empty;
	da_godot_pool_real_array_empty godot_pool_real_array_empty;
	da_godot_pool_string_array_empty godot_pool_string_array_empty;
	da_godot_pool_vector2_array_empty godot_pool_vector2_array_empty;
	da_godot_pool_vector3_array_empty godot_pool_vector3_array_empty;
	da_godot_pool_color_array_empty godot_pool_color_array_empty;
	da_godot_get_class_tag godot_get_class_tag;
	da_godot_object_cast_to godot_object_cast_to;
	da_godot_instance_from_id godot_instance_from_id;
const(godot_gdnative_core_api_struct_1_3*) nextVersion() const { return cast(typeof(return))next; }
alias nextVersion this;
}

private extern(C) @nogc nothrow
{
	alias da_godot_dictionary_merge = void function(godot_dictionary * p_self, const godot_dictionary * p_dictionary, const godot_bool p_overwrite);
	alias da_godot_pool_byte_array_has = godot_bool function(const godot_pool_byte_array * p_self, const uint8_t p_data);
	alias da_godot_pool_byte_array_sort = void function(godot_pool_byte_array * p_self);
	alias da_godot_pool_int_array_has = godot_bool function(const godot_pool_int_array * p_self, const godot_int p_data);
	alias da_godot_pool_int_array_sort = void function(godot_pool_int_array * p_self);
	alias da_godot_pool_real_array_has = godot_bool function(const godot_pool_real_array * p_self, const godot_real p_data);
	alias da_godot_pool_real_array_sort = void function(godot_pool_real_array * p_self);
	alias da_godot_pool_string_array_has = godot_bool function(const godot_pool_string_array * p_self, const godot_string * p_data);
	alias da_godot_pool_string_array_join = godot_string function(const godot_pool_string_array * p_self, const godot_string * p_delimiter);
	alias da_godot_pool_string_array_sort = void function(godot_pool_string_array * p_self);
	alias da_godot_pool_vector2_array_has = godot_bool function(const godot_pool_vector2_array * p_self, const godot_vector2 * p_data);
	alias da_godot_pool_vector2_array_sort = void function(godot_pool_vector2_array * p_self);
	alias da_godot_pool_vector3_array_has = godot_bool function(const godot_pool_vector3_array * p_self, const godot_vector3 * p_data);
	alias da_godot_pool_vector3_array_sort = void function(godot_pool_vector3_array * p_self);
	alias da_godot_pool_color_array_has = godot_bool function(const godot_pool_color_array * p_self, const godot_color * p_data);
	alias da_godot_pool_color_array_sort = void function(godot_pool_color_array * p_self);
	alias da_godot_string_join = godot_string function(const godot_string * p_self, const godot_array * p_parts);
	alias da_godot_string_num_uint64 = godot_string function(uint64_t p_num, godot_int p_base);
	alias da_godot_string_num_uint64_capitalized = godot_string function(uint64_t p_num, godot_int p_base, godot_bool p_capitalize_hex);
}
public extern(C) struct godot_gdnative_core_api_struct_1_3
{
@nogc nothrow:

			mixin ApiStructHeader;
			da_godot_dictionary_merge godot_dictionary_merge;
	da_godot_pool_byte_array_has godot_pool_byte_array_has;
	da_godot_pool_byte_array_sort godot_pool_byte_array_sort;
	da_godot_pool_int_array_has godot_pool_int_array_has;
	da_godot_pool_int_array_sort godot_pool_int_array_sort;
	da_godot_pool_real_array_has godot_pool_real_array_has;
	da_godot_pool_real_array_sort godot_pool_real_array_sort;
	da_godot_pool_string_array_has godot_pool_string_array_has;
	da_godot_pool_string_array_join godot_pool_string_array_join;
	da_godot_pool_string_array_sort godot_pool_string_array_sort;
	da_godot_pool_vector2_array_has godot_pool_vector2_array_has;
	da_godot_pool_vector2_array_sort godot_pool_vector2_array_sort;
	da_godot_pool_vector3_array_has godot_pool_vector3_array_has;
	da_godot_pool_vector3_array_sort godot_pool_vector3_array_sort;
	da_godot_pool_color_array_has godot_pool_color_array_has;
	da_godot_pool_color_array_sort godot_pool_color_array_sort;
	da_godot_string_join godot_string_join;
	da_godot_string_num_uint64 godot_string_num_uint64;
	da_godot_string_num_uint64_capitalized godot_string_num_uint64_capitalized;
}

private extern(C) @nogc nothrow
{
	alias da_godot_nativescript_register_class = void function(void * p_gdnative_handle, const char * p_name, const char * p_base, godot_instance_create_func p_create_func, godot_instance_destroy_func p_destroy_func);
	alias da_godot_nativescript_register_tool_class = void function(void * p_gdnative_handle, const char * p_name, const char * p_base, godot_instance_create_func p_create_func, godot_instance_destroy_func p_destroy_func);
	alias da_godot_nativescript_register_method = void function(void * p_gdnative_handle, const char * p_name, const char * p_function_name, godot_method_attributes p_attr, godot_instance_method p_method);
	alias da_godot_nativescript_register_property = void function(void * p_gdnative_handle, const char * p_name, const char * p_path, godot_property_attributes * p_attr, godot_property_set_func p_set_func, godot_property_get_func p_get_func);
	alias da_godot_nativescript_register_signal = void function(void * p_gdnative_handle, const char * p_name, const godot_signal * p_signal);
	alias da_godot_nativescript_get_userdata = void * function(godot_object  p_instance);
}
public extern(C) struct godot_gdnative_ext_nativescript_api_struct_1_0
{
@nogc nothrow:

			mixin ApiStructHeader;
			da_godot_nativescript_register_class godot_nativescript_register_class;
	da_godot_nativescript_register_tool_class godot_nativescript_register_tool_class;
	da_godot_nativescript_register_method godot_nativescript_register_method;
	da_godot_nativescript_register_property godot_nativescript_register_property;
	da_godot_nativescript_register_signal godot_nativescript_register_signal;
	da_godot_nativescript_get_userdata godot_nativescript_get_userdata;
const(godot_gdnative_ext_nativescript_api_struct_1_1*) nextVersion() const { return cast(typeof(return))next; }
alias nextVersion this;
}
__gshared const(godot_gdnative_ext_nativescript_api_struct_1_0)* _godot_nativescript_api = null;
private alias apiStruct(ApiType t : ApiType.nativescript) = _godot_nativescript_api;

private extern(C) @nogc nothrow
{
	alias da_godot_nativescript_set_method_argument_information = void function(void * p_gdnative_handle, const char * p_name, const char * p_function_name, int p_num_args, const godot_method_arg * p_args);
	alias da_godot_nativescript_set_class_documentation = void function(void * p_gdnative_handle, const char * p_name, godot_string p_documentation);
	alias da_godot_nativescript_set_method_documentation = void function(void * p_gdnative_handle, const char * p_name, const char * p_function_name, godot_string p_documentation);
	alias da_godot_nativescript_set_property_documentation = void function(void * p_gdnative_handle, const char * p_name, const char * p_path, godot_string p_documentation);
	alias da_godot_nativescript_set_signal_documentation = void function(void * p_gdnative_handle, const char * p_name, const char * p_signal_name, godot_string p_documentation);
	alias da_godot_nativescript_set_global_type_tag = void function(int p_idx, const char * p_name, const void * p_type_tag);
	alias da_godot_nativescript_get_global_type_tag = const void * function(int p_idx, const char * p_name);
	alias da_godot_nativescript_set_type_tag = void function(void * p_gdnative_handle, const char * p_name, const void * p_type_tag);
	alias da_godot_nativescript_get_type_tag = const void * function(const godot_object  p_object);
	alias da_godot_nativescript_register_instance_binding_data_functions = int function(godot_instance_binding_functions p_binding_functions);
	alias da_godot_nativescript_unregister_instance_binding_data_functions = void function(int p_idx);
	alias da_godot_nativescript_get_instance_binding_data = void * function(int p_idx, godot_object  p_object);
	alias da_godot_nativescript_profiling_add_data = void function(const char * p_signature, uint64_t p_line);
}
public extern(C) struct godot_gdnative_ext_nativescript_api_struct_1_1
{
@nogc nothrow:

			mixin ApiStructHeader;
			da_godot_nativescript_set_method_argument_information godot_nativescript_set_method_argument_information;
	da_godot_nativescript_set_class_documentation godot_nativescript_set_class_documentation;
	da_godot_nativescript_set_method_documentation godot_nativescript_set_method_documentation;
	da_godot_nativescript_set_property_documentation godot_nativescript_set_property_documentation;
	da_godot_nativescript_set_signal_documentation godot_nativescript_set_signal_documentation;
	da_godot_nativescript_set_global_type_tag godot_nativescript_set_global_type_tag;
	da_godot_nativescript_get_global_type_tag godot_nativescript_get_global_type_tag;
	da_godot_nativescript_set_type_tag godot_nativescript_set_type_tag;
	da_godot_nativescript_get_type_tag godot_nativescript_get_type_tag;
	da_godot_nativescript_register_instance_binding_data_functions godot_nativescript_register_instance_binding_data_functions;
	da_godot_nativescript_unregister_instance_binding_data_functions godot_nativescript_unregister_instance_binding_data_functions;
	da_godot_nativescript_get_instance_binding_data godot_nativescript_get_instance_binding_data;
	da_godot_nativescript_profiling_add_data godot_nativescript_profiling_add_data;
}

private extern(C) @nogc nothrow
{
	alias da_godot_pluginscript_register_language = void function(const godot_pluginscript_language_desc * language_desc);
}
public extern(C) struct godot_gdnative_ext_pluginscript_api_struct_1_0
{
@nogc nothrow:

			mixin ApiStructHeader;
			da_godot_pluginscript_register_language godot_pluginscript_register_language;
}
__gshared const(godot_gdnative_ext_pluginscript_api_struct_1_0)* _godot_pluginscript_api = null;
private alias apiStruct(ApiType t : ApiType.pluginscript) = _godot_pluginscript_api;

private extern(C) @nogc nothrow
{
	alias da_godot_android_get_env = JNIEnv* function();
	alias da_godot_android_get_activity = jobject function();
	alias da_godot_android_get_surface = jobject function();
	alias da_godot_android_is_activity_resumed = bool function();
}
public extern(C) struct godot_gdnative_ext_android_api_struct_1_1
{
@nogc nothrow:

			mixin ApiStructHeader;
			da_godot_android_get_env godot_android_get_env;
	da_godot_android_get_activity godot_android_get_activity;
	da_godot_android_get_surface godot_android_get_surface;
	da_godot_android_is_activity_resumed godot_android_is_activity_resumed;
}
__gshared const(godot_gdnative_ext_android_api_struct_1_1)* _godot_android_api = null;
private alias apiStruct(ApiType t : ApiType.android) = _godot_android_api;

private extern(C) @nogc nothrow
{
	alias da_godot_arvr_register_interface = void function(const godot_arvr_interface_gdnative * p_interface);
	alias da_godot_arvr_get_worldscale = godot_real function();
	alias da_godot_arvr_get_reference_frame = godot_transform function();
	alias da_godot_arvr_blit = void function(int p_eye, godot_rid * p_render_target, godot_rect2 * p_screen_rect);
	alias da_godot_arvr_get_texid = godot_int function(godot_rid * p_render_target);
	alias da_godot_arvr_add_controller = godot_int function(char * p_device_name, godot_int p_hand, godot_bool p_tracks_orientation, godot_bool p_tracks_position);
	alias da_godot_arvr_remove_controller = void function(godot_int p_controller_id);
	alias da_godot_arvr_set_controller_transform = void function(godot_int p_controller_id, godot_transform * p_transform, godot_bool p_tracks_orientation, godot_bool p_tracks_position);
	alias da_godot_arvr_set_controller_button = void function(godot_int p_controller_id, godot_int p_button, godot_bool p_is_pressed);
	alias da_godot_arvr_set_controller_axis = void function(godot_int p_controller_id, godot_int p_exis, godot_real p_value, godot_bool p_can_be_negative);
	alias da_godot_arvr_get_controller_rumble = godot_real function(godot_int p_controller_id);
}
public extern(C) struct godot_gdnative_ext_arvr_api_struct_1_1
{
@nogc nothrow:

			mixin ApiStructHeader;
			da_godot_arvr_register_interface godot_arvr_register_interface;
	da_godot_arvr_get_worldscale godot_arvr_get_worldscale;
	da_godot_arvr_get_reference_frame godot_arvr_get_reference_frame;
	da_godot_arvr_blit godot_arvr_blit;
	da_godot_arvr_get_texid godot_arvr_get_texid;
	da_godot_arvr_add_controller godot_arvr_add_controller;
	da_godot_arvr_remove_controller godot_arvr_remove_controller;
	da_godot_arvr_set_controller_transform godot_arvr_set_controller_transform;
	da_godot_arvr_set_controller_button godot_arvr_set_controller_button;
	da_godot_arvr_set_controller_axis godot_arvr_set_controller_axis;
	da_godot_arvr_get_controller_rumble godot_arvr_get_controller_rumble;
const(godot_gdnative_ext_arvr_api_struct_1_2*) nextVersion() const { return cast(typeof(return))next; }
alias nextVersion this;
}
__gshared const(godot_gdnative_ext_arvr_api_struct_1_1)* _godot_arvr_api = null;
private alias apiStruct(ApiType t : ApiType.arvr) = _godot_arvr_api;

private extern(C) @nogc nothrow
{
	alias da_godot_arvr_set_interface = void function(godot_object  p_arvr_interface, const godot_arvr_interface_gdnative * p_gdn_interface);
	alias da_godot_arvr_get_depthid = godot_int function(godot_rid * p_render_target);
}
public extern(C) struct godot_gdnative_ext_arvr_api_struct_1_2
{
@nogc nothrow:

			mixin ApiStructHeader;
			da_godot_arvr_set_interface godot_arvr_set_interface;
	da_godot_arvr_get_depthid godot_arvr_get_depthid;
}

private extern(C) @nogc nothrow
{
	alias da_godot_videodecoder_file_read = godot_int function(void * file_ptr, uint8_t * buf, int buf_size);
	alias da_godot_videodecoder_file_seek = int64_t function(void * file_ptr, int64_t pos, int whence);
	alias da_godot_videodecoder_register_decoder = void function(const godot_videodecoder_interface_gdnative * p_interface);
}
public extern(C) struct godot_gdnative_ext_videodecoder_api_struct_0_1
{
@nogc nothrow:

			mixin ApiStructHeader;
			da_godot_videodecoder_file_read godot_videodecoder_file_read;
	da_godot_videodecoder_file_seek godot_videodecoder_file_seek;
	da_godot_videodecoder_register_decoder godot_videodecoder_register_decoder;
}
__gshared const(godot_gdnative_ext_videodecoder_api_struct_0_1)* _godot_videodecoder_api = null;
private alias apiStruct(ApiType t : ApiType.videodecoder) = _godot_videodecoder_api;

private extern(C) @nogc nothrow
{
	alias da_godot_net_bind_stream_peer = void function(godot_object  p_obj, const godot_net_stream_peer * p_interface);
	alias da_godot_net_bind_packet_peer = void function(godot_object  p_obj, const godot_net_packet_peer * p_interface);
	alias da_godot_net_bind_multiplayer_peer = void function(godot_object  p_obj, const godot_net_multiplayer_peer * p_interface);
}
public extern(C) struct godot_gdnative_ext_net_api_struct_3_1
{
@nogc nothrow:

			mixin ApiStructHeader;
			da_godot_net_bind_stream_peer godot_net_bind_stream_peer;
	da_godot_net_bind_packet_peer godot_net_bind_packet_peer;
	da_godot_net_bind_multiplayer_peer godot_net_bind_multiplayer_peer;
const(godot_gdnative_ext_net_api_struct_3_2*) nextVersion() const { return cast(typeof(return))next; }
alias nextVersion this;
}
__gshared const(godot_gdnative_ext_net_api_struct_3_1)* _godot_net_api = null;
private alias apiStruct(ApiType t : ApiType.net) = _godot_net_api;

private extern(C) @nogc nothrow
{
	alias da_godot_net_set_webrtc_library = godot_error function(const godot_net_webrtc_library * p_library);
	alias da_godot_net_bind_webrtc_peer_connection = void function(godot_object  p_obj, const godot_net_webrtc_peer_connection * p_interface);
	alias da_godot_net_bind_webrtc_data_channel = void function(godot_object  p_obj, const godot_net_webrtc_data_channel * p_interface);
}
public extern(C) struct godot_gdnative_ext_net_api_struct_3_2
{
@nogc nothrow:

			mixin ApiStructHeader;
			da_godot_net_set_webrtc_library godot_net_set_webrtc_library;
	da_godot_net_bind_webrtc_peer_connection godot_net_bind_webrtc_peer_connection;
	da_godot_net_bind_webrtc_data_channel godot_net_bind_webrtc_data_channel;
}


			@nogc nothrow
			void godot_gdnative_api_struct_init(in godot_gdnative_core_api_struct* s)
			{
				import std.traits : EnumMembers;
				
				@nogc nothrow static void initVersions(ApiType type)(in godot_gdnative_api_struct* main)
				{
					const(godot_gdnative_api_struct)* part = main;
					while(part)
					{
						foreach(int[2] v; SupportedVersions!type)
						{
							if(part.ver.major == v[0] && part.ver.minor == v[1]) mixin(format!"has%s_%d_%d"
								(type.text.capitalize, v[0], v[1])) = true;
						}
						part = part.next;
					}
				}
				
				if(!s) assert(0, "godot_gdnative_core_api_struct is null");
				if(_godot_api) return; // already initialized
				_godot_api = s;
				initVersions!(ApiType.core)(cast(const(godot_gdnative_api_struct)*)(cast(void*)s));
				foreach(ext; s.extensions[0..s.num_extensions])
				{
					// check the actual extension type at runtime, instead of relying on the order in the JSON
					if(ext.type == 0) continue; // core? should never happen
					if(ext.type >= EnumMembers!ApiType.length)
					{
						continue; // unknown extension type
					}
					ApiTypeSwitch: final switch(cast(ApiType)ext.type)
					{
						foreach(E; EnumMembers!ApiType)
						{
							case E:
								apiStruct!E = cast(typeof(apiStruct!E))(cast(void*)ext);
								initVersions!E(ext);
								break ApiTypeSwitch;
						}
					}
				}
			}
		