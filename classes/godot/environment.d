/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.environment;
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
import godot.resource;
import godot.texture;
import godot.sky;
/**

*/
@GodotBaseClass struct Environment
{
	package(godot) enum string _GODOT_internal_name = "Environment";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Resource _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("get_adjustment_brightness") GodotMethod!(double) getAdjustmentBrightness;
		@GodotName("get_adjustment_color_correction") GodotMethod!(Texture) getAdjustmentColorCorrection;
		@GodotName("get_adjustment_contrast") GodotMethod!(double) getAdjustmentContrast;
		@GodotName("get_adjustment_saturation") GodotMethod!(double) getAdjustmentSaturation;
		@GodotName("get_ambient_light_color") GodotMethod!(Color) getAmbientLightColor;
		@GodotName("get_ambient_light_energy") GodotMethod!(double) getAmbientLightEnergy;
		@GodotName("get_ambient_light_sky_contribution") GodotMethod!(double) getAmbientLightSkyContribution;
		@GodotName("get_background") GodotMethod!(Environment.BGMode) getBackground;
		@GodotName("get_bg_color") GodotMethod!(Color) getBgColor;
		@GodotName("get_bg_energy") GodotMethod!(double) getBgEnergy;
		@GodotName("get_camera_feed_id") GodotMethod!(long) getCameraFeedId;
		@GodotName("get_canvas_max_layer") GodotMethod!(long) getCanvasMaxLayer;
		@GodotName("get_dof_blur_far_amount") GodotMethod!(double) getDofBlurFarAmount;
		@GodotName("get_dof_blur_far_distance") GodotMethod!(double) getDofBlurFarDistance;
		@GodotName("get_dof_blur_far_quality") GodotMethod!(Environment.DOFBlurQuality) getDofBlurFarQuality;
		@GodotName("get_dof_blur_far_transition") GodotMethod!(double) getDofBlurFarTransition;
		@GodotName("get_dof_blur_near_amount") GodotMethod!(double) getDofBlurNearAmount;
		@GodotName("get_dof_blur_near_distance") GodotMethod!(double) getDofBlurNearDistance;
		@GodotName("get_dof_blur_near_quality") GodotMethod!(Environment.DOFBlurQuality) getDofBlurNearQuality;
		@GodotName("get_dof_blur_near_transition") GodotMethod!(double) getDofBlurNearTransition;
		@GodotName("get_fog_color") GodotMethod!(Color) getFogColor;
		@GodotName("get_fog_depth_begin") GodotMethod!(double) getFogDepthBegin;
		@GodotName("get_fog_depth_curve") GodotMethod!(double) getFogDepthCurve;
		@GodotName("get_fog_depth_end") GodotMethod!(double) getFogDepthEnd;
		@GodotName("get_fog_height_curve") GodotMethod!(double) getFogHeightCurve;
		@GodotName("get_fog_height_max") GodotMethod!(double) getFogHeightMax;
		@GodotName("get_fog_height_min") GodotMethod!(double) getFogHeightMin;
		@GodotName("get_fog_sun_amount") GodotMethod!(double) getFogSunAmount;
		@GodotName("get_fog_sun_color") GodotMethod!(Color) getFogSunColor;
		@GodotName("get_fog_transmit_curve") GodotMethod!(double) getFogTransmitCurve;
		@GodotName("get_glow_blend_mode") GodotMethod!(Environment.GlowBlendMode) getGlowBlendMode;
		@GodotName("get_glow_bloom") GodotMethod!(double) getGlowBloom;
		@GodotName("get_glow_hdr_bleed_scale") GodotMethod!(double) getGlowHdrBleedScale;
		@GodotName("get_glow_hdr_bleed_threshold") GodotMethod!(double) getGlowHdrBleedThreshold;
		@GodotName("get_glow_hdr_luminance_cap") GodotMethod!(double) getGlowHdrLuminanceCap;
		@GodotName("get_glow_intensity") GodotMethod!(double) getGlowIntensity;
		@GodotName("get_glow_strength") GodotMethod!(double) getGlowStrength;
		@GodotName("get_sky") GodotMethod!(Sky) getSky;
		@GodotName("get_sky_custom_fov") GodotMethod!(double) getSkyCustomFov;
		@GodotName("get_sky_orientation") GodotMethod!(Basis) getSkyOrientation;
		@GodotName("get_sky_rotation") GodotMethod!(Vector3) getSkyRotation;
		@GodotName("get_sky_rotation_degrees") GodotMethod!(Vector3) getSkyRotationDegrees;
		@GodotName("get_ssao_ao_channel_affect") GodotMethod!(double) getSsaoAoChannelAffect;
		@GodotName("get_ssao_bias") GodotMethod!(double) getSsaoBias;
		@GodotName("get_ssao_blur") GodotMethod!(Environment.SSAOBlur) getSsaoBlur;
		@GodotName("get_ssao_color") GodotMethod!(Color) getSsaoColor;
		@GodotName("get_ssao_direct_light_affect") GodotMethod!(double) getSsaoDirectLightAffect;
		@GodotName("get_ssao_edge_sharpness") GodotMethod!(double) getSsaoEdgeSharpness;
		@GodotName("get_ssao_intensity") GodotMethod!(double) getSsaoIntensity;
		@GodotName("get_ssao_intensity2") GodotMethod!(double) getSsaoIntensity2;
		@GodotName("get_ssao_quality") GodotMethod!(Environment.SSAOQuality) getSsaoQuality;
		@GodotName("get_ssao_radius") GodotMethod!(double) getSsaoRadius;
		@GodotName("get_ssao_radius2") GodotMethod!(double) getSsaoRadius2;
		@GodotName("get_ssr_depth_tolerance") GodotMethod!(double) getSsrDepthTolerance;
		@GodotName("get_ssr_fade_in") GodotMethod!(double) getSsrFadeIn;
		@GodotName("get_ssr_fade_out") GodotMethod!(double) getSsrFadeOut;
		@GodotName("get_ssr_max_steps") GodotMethod!(long) getSsrMaxSteps;
		@GodotName("get_tonemap_auto_exposure") GodotMethod!(bool) getTonemapAutoExposure;
		@GodotName("get_tonemap_auto_exposure_grey") GodotMethod!(double) getTonemapAutoExposureGrey;
		@GodotName("get_tonemap_auto_exposure_max") GodotMethod!(double) getTonemapAutoExposureMax;
		@GodotName("get_tonemap_auto_exposure_min") GodotMethod!(double) getTonemapAutoExposureMin;
		@GodotName("get_tonemap_auto_exposure_speed") GodotMethod!(double) getTonemapAutoExposureSpeed;
		@GodotName("get_tonemap_exposure") GodotMethod!(double) getTonemapExposure;
		@GodotName("get_tonemap_white") GodotMethod!(double) getTonemapWhite;
		@GodotName("get_tonemapper") GodotMethod!(Environment.ToneMapper) getTonemapper;
		@GodotName("is_adjustment_enabled") GodotMethod!(bool) isAdjustmentEnabled;
		@GodotName("is_dof_blur_far_enabled") GodotMethod!(bool) isDofBlurFarEnabled;
		@GodotName("is_dof_blur_near_enabled") GodotMethod!(bool) isDofBlurNearEnabled;
		@GodotName("is_fog_depth_enabled") GodotMethod!(bool) isFogDepthEnabled;
		@GodotName("is_fog_enabled") GodotMethod!(bool) isFogEnabled;
		@GodotName("is_fog_height_enabled") GodotMethod!(bool) isFogHeightEnabled;
		@GodotName("is_fog_transmit_enabled") GodotMethod!(bool) isFogTransmitEnabled;
		@GodotName("is_glow_bicubic_upscale_enabled") GodotMethod!(bool) isGlowBicubicUpscaleEnabled;
		@GodotName("is_glow_enabled") GodotMethod!(bool) isGlowEnabled;
		@GodotName("is_glow_high_quality_enabled") GodotMethod!(bool) isGlowHighQualityEnabled;
		@GodotName("is_glow_level_enabled") GodotMethod!(bool, long) isGlowLevelEnabled;
		@GodotName("is_ssao_enabled") GodotMethod!(bool) isSsaoEnabled;
		@GodotName("is_ssr_enabled") GodotMethod!(bool) isSsrEnabled;
		@GodotName("is_ssr_rough") GodotMethod!(bool) isSsrRough;
		@GodotName("set_adjustment_brightness") GodotMethod!(void, double) setAdjustmentBrightness;
		@GodotName("set_adjustment_color_correction") GodotMethod!(void, Texture) setAdjustmentColorCorrection;
		@GodotName("set_adjustment_contrast") GodotMethod!(void, double) setAdjustmentContrast;
		@GodotName("set_adjustment_enable") GodotMethod!(void, bool) setAdjustmentEnable;
		@GodotName("set_adjustment_saturation") GodotMethod!(void, double) setAdjustmentSaturation;
		@GodotName("set_ambient_light_color") GodotMethod!(void, Color) setAmbientLightColor;
		@GodotName("set_ambient_light_energy") GodotMethod!(void, double) setAmbientLightEnergy;
		@GodotName("set_ambient_light_sky_contribution") GodotMethod!(void, double) setAmbientLightSkyContribution;
		@GodotName("set_background") GodotMethod!(void, long) setBackground;
		@GodotName("set_bg_color") GodotMethod!(void, Color) setBgColor;
		@GodotName("set_bg_energy") GodotMethod!(void, double) setBgEnergy;
		@GodotName("set_camera_feed_id") GodotMethod!(void, long) setCameraFeedId;
		@GodotName("set_canvas_max_layer") GodotMethod!(void, long) setCanvasMaxLayer;
		@GodotName("set_dof_blur_far_amount") GodotMethod!(void, double) setDofBlurFarAmount;
		@GodotName("set_dof_blur_far_distance") GodotMethod!(void, double) setDofBlurFarDistance;
		@GodotName("set_dof_blur_far_enabled") GodotMethod!(void, bool) setDofBlurFarEnabled;
		@GodotName("set_dof_blur_far_quality") GodotMethod!(void, long) setDofBlurFarQuality;
		@GodotName("set_dof_blur_far_transition") GodotMethod!(void, double) setDofBlurFarTransition;
		@GodotName("set_dof_blur_near_amount") GodotMethod!(void, double) setDofBlurNearAmount;
		@GodotName("set_dof_blur_near_distance") GodotMethod!(void, double) setDofBlurNearDistance;
		@GodotName("set_dof_blur_near_enabled") GodotMethod!(void, bool) setDofBlurNearEnabled;
		@GodotName("set_dof_blur_near_quality") GodotMethod!(void, long) setDofBlurNearQuality;
		@GodotName("set_dof_blur_near_transition") GodotMethod!(void, double) setDofBlurNearTransition;
		@GodotName("set_fog_color") GodotMethod!(void, Color) setFogColor;
		@GodotName("set_fog_depth_begin") GodotMethod!(void, double) setFogDepthBegin;
		@GodotName("set_fog_depth_curve") GodotMethod!(void, double) setFogDepthCurve;
		@GodotName("set_fog_depth_enabled") GodotMethod!(void, bool) setFogDepthEnabled;
		@GodotName("set_fog_depth_end") GodotMethod!(void, double) setFogDepthEnd;
		@GodotName("set_fog_enabled") GodotMethod!(void, bool) setFogEnabled;
		@GodotName("set_fog_height_curve") GodotMethod!(void, double) setFogHeightCurve;
		@GodotName("set_fog_height_enabled") GodotMethod!(void, bool) setFogHeightEnabled;
		@GodotName("set_fog_height_max") GodotMethod!(void, double) setFogHeightMax;
		@GodotName("set_fog_height_min") GodotMethod!(void, double) setFogHeightMin;
		@GodotName("set_fog_sun_amount") GodotMethod!(void, double) setFogSunAmount;
		@GodotName("set_fog_sun_color") GodotMethod!(void, Color) setFogSunColor;
		@GodotName("set_fog_transmit_curve") GodotMethod!(void, double) setFogTransmitCurve;
		@GodotName("set_fog_transmit_enabled") GodotMethod!(void, bool) setFogTransmitEnabled;
		@GodotName("set_glow_bicubic_upscale") GodotMethod!(void, bool) setGlowBicubicUpscale;
		@GodotName("set_glow_blend_mode") GodotMethod!(void, long) setGlowBlendMode;
		@GodotName("set_glow_bloom") GodotMethod!(void, double) setGlowBloom;
		@GodotName("set_glow_enabled") GodotMethod!(void, bool) setGlowEnabled;
		@GodotName("set_glow_hdr_bleed_scale") GodotMethod!(void, double) setGlowHdrBleedScale;
		@GodotName("set_glow_hdr_bleed_threshold") GodotMethod!(void, double) setGlowHdrBleedThreshold;
		@GodotName("set_glow_hdr_luminance_cap") GodotMethod!(void, double) setGlowHdrLuminanceCap;
		@GodotName("set_glow_high_quality") GodotMethod!(void, bool) setGlowHighQuality;
		@GodotName("set_glow_intensity") GodotMethod!(void, double) setGlowIntensity;
		@GodotName("set_glow_level") GodotMethod!(void, long, bool) setGlowLevel;
		@GodotName("set_glow_strength") GodotMethod!(void, double) setGlowStrength;
		@GodotName("set_sky") GodotMethod!(void, Sky) setSky;
		@GodotName("set_sky_custom_fov") GodotMethod!(void, double) setSkyCustomFov;
		@GodotName("set_sky_orientation") GodotMethod!(void, Basis) setSkyOrientation;
		@GodotName("set_sky_rotation") GodotMethod!(void, Vector3) setSkyRotation;
		@GodotName("set_sky_rotation_degrees") GodotMethod!(void, Vector3) setSkyRotationDegrees;
		@GodotName("set_ssao_ao_channel_affect") GodotMethod!(void, double) setSsaoAoChannelAffect;
		@GodotName("set_ssao_bias") GodotMethod!(void, double) setSsaoBias;
		@GodotName("set_ssao_blur") GodotMethod!(void, long) setSsaoBlur;
		@GodotName("set_ssao_color") GodotMethod!(void, Color) setSsaoColor;
		@GodotName("set_ssao_direct_light_affect") GodotMethod!(void, double) setSsaoDirectLightAffect;
		@GodotName("set_ssao_edge_sharpness") GodotMethod!(void, double) setSsaoEdgeSharpness;
		@GodotName("set_ssao_enabled") GodotMethod!(void, bool) setSsaoEnabled;
		@GodotName("set_ssao_intensity") GodotMethod!(void, double) setSsaoIntensity;
		@GodotName("set_ssao_intensity2") GodotMethod!(void, double) setSsaoIntensity2;
		@GodotName("set_ssao_quality") GodotMethod!(void, long) setSsaoQuality;
		@GodotName("set_ssao_radius") GodotMethod!(void, double) setSsaoRadius;
		@GodotName("set_ssao_radius2") GodotMethod!(void, double) setSsaoRadius2;
		@GodotName("set_ssr_depth_tolerance") GodotMethod!(void, double) setSsrDepthTolerance;
		@GodotName("set_ssr_enabled") GodotMethod!(void, bool) setSsrEnabled;
		@GodotName("set_ssr_fade_in") GodotMethod!(void, double) setSsrFadeIn;
		@GodotName("set_ssr_fade_out") GodotMethod!(void, double) setSsrFadeOut;
		@GodotName("set_ssr_max_steps") GodotMethod!(void, long) setSsrMaxSteps;
		@GodotName("set_ssr_rough") GodotMethod!(void, bool) setSsrRough;
		@GodotName("set_tonemap_auto_exposure") GodotMethod!(void, bool) setTonemapAutoExposure;
		@GodotName("set_tonemap_auto_exposure_grey") GodotMethod!(void, double) setTonemapAutoExposureGrey;
		@GodotName("set_tonemap_auto_exposure_max") GodotMethod!(void, double) setTonemapAutoExposureMax;
		@GodotName("set_tonemap_auto_exposure_min") GodotMethod!(void, double) setTonemapAutoExposureMin;
		@GodotName("set_tonemap_auto_exposure_speed") GodotMethod!(void, double) setTonemapAutoExposureSpeed;
		@GodotName("set_tonemap_exposure") GodotMethod!(void, double) setTonemapExposure;
		@GodotName("set_tonemap_white") GodotMethod!(void, double) setTonemapWhite;
		@GodotName("set_tonemapper") GodotMethod!(void, long) setTonemapper;
	}
	/// 
	pragma(inline, true) bool opEquals(in Environment other) const
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
	/// Construct a new instance of Environment.
	/// Note: use `memnew!Environment` instead.
	static Environment _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("Environment");
		if(constructor is null) return typeof(this).init;
		return cast(Environment)(constructor());
	}
	/// 
	enum SSAOBlur : int
	{
		/** */
		ssaoBlurDisabled = 0,
		/** */
		ssaoBlur1x1 = 1,
		/** */
		ssaoBlur2x2 = 2,
		/** */
		ssaoBlur3x3 = 3,
	}
	/// 
	enum ToneMapper : int
	{
		/** */
		toneMapperLinear = 0,
		/** */
		toneMapperReinhardt = 1,
		/** */
		toneMapperFilmic = 2,
		/** */
		toneMapperAces = 3,
		/** */
		toneMapperAcesFitted = 4,
	}
	/// 
	enum GlowBlendMode : int
	{
		/** */
		glowBlendModeAdditive = 0,
		/** */
		glowBlendModeScreen = 1,
		/** */
		glowBlendModeSoftlight = 2,
		/** */
		glowBlendModeReplace = 3,
	}
	/// 
	enum BGMode : int
	{
		/** */
		bgClearColor = 0,
		/** */
		bgColor = 1,
		/** */
		bgSky = 2,
		/** */
		bgColorSky = 3,
		/** */
		bgCanvas = 4,
		/** */
		bgKeep = 5,
		/** */
		bgCameraFeed = 6,
		/** */
		bgMax = 7,
	}
	/// 
	enum SSAOQuality : int
	{
		/** */
		ssaoQualityLow = 0,
		/** */
		ssaoQualityMedium = 1,
		/** */
		ssaoQualityHigh = 2,
	}
	/// 
	enum DOFBlurQuality : int
	{
		/** */
		dofBlurQualityLow = 0,
		/** */
		dofBlurQualityMedium = 1,
		/** */
		dofBlurQualityHigh = 2,
	}
	/// 
	enum Constants : int
	{
		bgClearColor = 0,
		glowBlendModeAdditive = 0,
		ssaoBlurDisabled = 0,
		dofBlurQualityLow = 0,
		toneMapperLinear = 0,
		ssaoQualityLow = 0,
		bgColor = 1,
		toneMapperReinhardt = 1,
		ssaoQualityMedium = 1,
		dofBlurQualityMedium = 1,
		glowBlendModeScreen = 1,
		ssaoBlur1x1 = 1,
		glowBlendModeSoftlight = 2,
		bgSky = 2,
		ssaoQualityHigh = 2,
		toneMapperFilmic = 2,
		ssaoBlur2x2 = 2,
		dofBlurQualityHigh = 2,
		glowBlendModeReplace = 3,
		bgColorSky = 3,
		ssaoBlur3x3 = 3,
		toneMapperAces = 3,
		bgCanvas = 4,
		toneMapperAcesFitted = 4,
		bgKeep = 5,
		bgCameraFeed = 6,
		bgMax = 7,
	}
	/**
	
	*/
	double getAdjustmentBrightness() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getAdjustmentBrightness, _godot_object);
	}
	/**
	
	*/
	Ref!Texture getAdjustmentColorCorrection() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Texture)(GDNativeClassBinding.getAdjustmentColorCorrection, _godot_object);
	}
	/**
	
	*/
	double getAdjustmentContrast() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getAdjustmentContrast, _godot_object);
	}
	/**
	
	*/
	double getAdjustmentSaturation() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getAdjustmentSaturation, _godot_object);
	}
	/**
	
	*/
	Color getAmbientLightColor() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Color)(GDNativeClassBinding.getAmbientLightColor, _godot_object);
	}
	/**
	
	*/
	double getAmbientLightEnergy() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getAmbientLightEnergy, _godot_object);
	}
	/**
	
	*/
	double getAmbientLightSkyContribution() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getAmbientLightSkyContribution, _godot_object);
	}
	/**
	
	*/
	Environment.BGMode getBackground() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Environment.BGMode)(GDNativeClassBinding.getBackground, _godot_object);
	}
	/**
	
	*/
	Color getBgColor() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Color)(GDNativeClassBinding.getBgColor, _godot_object);
	}
	/**
	
	*/
	double getBgEnergy() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getBgEnergy, _godot_object);
	}
	/**
	
	*/
	long getCameraFeedId() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getCameraFeedId, _godot_object);
	}
	/**
	
	*/
	long getCanvasMaxLayer() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getCanvasMaxLayer, _godot_object);
	}
	/**
	
	*/
	double getDofBlurFarAmount() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getDofBlurFarAmount, _godot_object);
	}
	/**
	
	*/
	double getDofBlurFarDistance() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getDofBlurFarDistance, _godot_object);
	}
	/**
	
	*/
	Environment.DOFBlurQuality getDofBlurFarQuality() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Environment.DOFBlurQuality)(GDNativeClassBinding.getDofBlurFarQuality, _godot_object);
	}
	/**
	
	*/
	double getDofBlurFarTransition() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getDofBlurFarTransition, _godot_object);
	}
	/**
	
	*/
	double getDofBlurNearAmount() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getDofBlurNearAmount, _godot_object);
	}
	/**
	
	*/
	double getDofBlurNearDistance() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getDofBlurNearDistance, _godot_object);
	}
	/**
	
	*/
	Environment.DOFBlurQuality getDofBlurNearQuality() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Environment.DOFBlurQuality)(GDNativeClassBinding.getDofBlurNearQuality, _godot_object);
	}
	/**
	
	*/
	double getDofBlurNearTransition() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getDofBlurNearTransition, _godot_object);
	}
	/**
	
	*/
	Color getFogColor() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Color)(GDNativeClassBinding.getFogColor, _godot_object);
	}
	/**
	
	*/
	double getFogDepthBegin() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getFogDepthBegin, _godot_object);
	}
	/**
	
	*/
	double getFogDepthCurve() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getFogDepthCurve, _godot_object);
	}
	/**
	
	*/
	double getFogDepthEnd() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getFogDepthEnd, _godot_object);
	}
	/**
	
	*/
	double getFogHeightCurve() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getFogHeightCurve, _godot_object);
	}
	/**
	
	*/
	double getFogHeightMax() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getFogHeightMax, _godot_object);
	}
	/**
	
	*/
	double getFogHeightMin() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getFogHeightMin, _godot_object);
	}
	/**
	
	*/
	double getFogSunAmount() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getFogSunAmount, _godot_object);
	}
	/**
	
	*/
	Color getFogSunColor() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Color)(GDNativeClassBinding.getFogSunColor, _godot_object);
	}
	/**
	
	*/
	double getFogTransmitCurve() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getFogTransmitCurve, _godot_object);
	}
	/**
	
	*/
	Environment.GlowBlendMode getGlowBlendMode() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Environment.GlowBlendMode)(GDNativeClassBinding.getGlowBlendMode, _godot_object);
	}
	/**
	
	*/
	double getGlowBloom() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getGlowBloom, _godot_object);
	}
	/**
	
	*/
	double getGlowHdrBleedScale() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getGlowHdrBleedScale, _godot_object);
	}
	/**
	
	*/
	double getGlowHdrBleedThreshold() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getGlowHdrBleedThreshold, _godot_object);
	}
	/**
	
	*/
	double getGlowHdrLuminanceCap() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getGlowHdrLuminanceCap, _godot_object);
	}
	/**
	
	*/
	double getGlowIntensity() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getGlowIntensity, _godot_object);
	}
	/**
	
	*/
	double getGlowStrength() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getGlowStrength, _godot_object);
	}
	/**
	
	*/
	Ref!Sky getSky() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Sky)(GDNativeClassBinding.getSky, _godot_object);
	}
	/**
	
	*/
	double getSkyCustomFov() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSkyCustomFov, _godot_object);
	}
	/**
	
	*/
	Basis getSkyOrientation() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Basis)(GDNativeClassBinding.getSkyOrientation, _godot_object);
	}
	/**
	
	*/
	Vector3 getSkyRotation() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector3)(GDNativeClassBinding.getSkyRotation, _godot_object);
	}
	/**
	
	*/
	Vector3 getSkyRotationDegrees() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector3)(GDNativeClassBinding.getSkyRotationDegrees, _godot_object);
	}
	/**
	
	*/
	double getSsaoAoChannelAffect() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSsaoAoChannelAffect, _godot_object);
	}
	/**
	
	*/
	double getSsaoBias() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSsaoBias, _godot_object);
	}
	/**
	
	*/
	Environment.SSAOBlur getSsaoBlur() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Environment.SSAOBlur)(GDNativeClassBinding.getSsaoBlur, _godot_object);
	}
	/**
	
	*/
	Color getSsaoColor() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Color)(GDNativeClassBinding.getSsaoColor, _godot_object);
	}
	/**
	
	*/
	double getSsaoDirectLightAffect() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSsaoDirectLightAffect, _godot_object);
	}
	/**
	
	*/
	double getSsaoEdgeSharpness() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSsaoEdgeSharpness, _godot_object);
	}
	/**
	
	*/
	double getSsaoIntensity() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSsaoIntensity, _godot_object);
	}
	/**
	
	*/
	double getSsaoIntensity2() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSsaoIntensity2, _godot_object);
	}
	/**
	
	*/
	Environment.SSAOQuality getSsaoQuality() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Environment.SSAOQuality)(GDNativeClassBinding.getSsaoQuality, _godot_object);
	}
	/**
	
	*/
	double getSsaoRadius() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSsaoRadius, _godot_object);
	}
	/**
	
	*/
	double getSsaoRadius2() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSsaoRadius2, _godot_object);
	}
	/**
	
	*/
	double getSsrDepthTolerance() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSsrDepthTolerance, _godot_object);
	}
	/**
	
	*/
	double getSsrFadeIn() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSsrFadeIn, _godot_object);
	}
	/**
	
	*/
	double getSsrFadeOut() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getSsrFadeOut, _godot_object);
	}
	/**
	
	*/
	long getSsrMaxSteps() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getSsrMaxSteps, _godot_object);
	}
	/**
	
	*/
	bool getTonemapAutoExposure() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.getTonemapAutoExposure, _godot_object);
	}
	/**
	
	*/
	double getTonemapAutoExposureGrey() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getTonemapAutoExposureGrey, _godot_object);
	}
	/**
	
	*/
	double getTonemapAutoExposureMax() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getTonemapAutoExposureMax, _godot_object);
	}
	/**
	
	*/
	double getTonemapAutoExposureMin() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getTonemapAutoExposureMin, _godot_object);
	}
	/**
	
	*/
	double getTonemapAutoExposureSpeed() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getTonemapAutoExposureSpeed, _godot_object);
	}
	/**
	
	*/
	double getTonemapExposure() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getTonemapExposure, _godot_object);
	}
	/**
	
	*/
	double getTonemapWhite() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getTonemapWhite, _godot_object);
	}
	/**
	
	*/
	Environment.ToneMapper getTonemapper() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Environment.ToneMapper)(GDNativeClassBinding.getTonemapper, _godot_object);
	}
	/**
	
	*/
	bool isAdjustmentEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isAdjustmentEnabled, _godot_object);
	}
	/**
	
	*/
	bool isDofBlurFarEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isDofBlurFarEnabled, _godot_object);
	}
	/**
	
	*/
	bool isDofBlurNearEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isDofBlurNearEnabled, _godot_object);
	}
	/**
	
	*/
	bool isFogDepthEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isFogDepthEnabled, _godot_object);
	}
	/**
	
	*/
	bool isFogEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isFogEnabled, _godot_object);
	}
	/**
	
	*/
	bool isFogHeightEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isFogHeightEnabled, _godot_object);
	}
	/**
	
	*/
	bool isFogTransmitEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isFogTransmitEnabled, _godot_object);
	}
	/**
	
	*/
	bool isGlowBicubicUpscaleEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isGlowBicubicUpscaleEnabled, _godot_object);
	}
	/**
	
	*/
	bool isGlowEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isGlowEnabled, _godot_object);
	}
	/**
	
	*/
	bool isGlowHighQualityEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isGlowHighQualityEnabled, _godot_object);
	}
	/**
	
	*/
	bool isGlowLevelEnabled(in long idx) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isGlowLevelEnabled, _godot_object, idx);
	}
	/**
	
	*/
	bool isSsaoEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isSsaoEnabled, _godot_object);
	}
	/**
	
	*/
	bool isSsrEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isSsrEnabled, _godot_object);
	}
	/**
	
	*/
	bool isSsrRough() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isSsrRough, _godot_object);
	}
	/**
	
	*/
	void setAdjustmentBrightness(in double brightness)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setAdjustmentBrightness, _godot_object, brightness);
	}
	/**
	
	*/
	void setAdjustmentColorCorrection(Texture color_correction)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setAdjustmentColorCorrection, _godot_object, color_correction);
	}
	/**
	
	*/
	void setAdjustmentContrast(in double contrast)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setAdjustmentContrast, _godot_object, contrast);
	}
	/**
	
	*/
	void setAdjustmentEnable(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setAdjustmentEnable, _godot_object, enabled);
	}
	/**
	
	*/
	void setAdjustmentSaturation(in double saturation)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setAdjustmentSaturation, _godot_object, saturation);
	}
	/**
	
	*/
	void setAmbientLightColor(in Color color)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setAmbientLightColor, _godot_object, color);
	}
	/**
	
	*/
	void setAmbientLightEnergy(in double energy)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setAmbientLightEnergy, _godot_object, energy);
	}
	/**
	
	*/
	void setAmbientLightSkyContribution(in double energy)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setAmbientLightSkyContribution, _godot_object, energy);
	}
	/**
	
	*/
	void setBackground(in long mode)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setBackground, _godot_object, mode);
	}
	/**
	
	*/
	void setBgColor(in Color color)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setBgColor, _godot_object, color);
	}
	/**
	
	*/
	void setBgEnergy(in double energy)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setBgEnergy, _godot_object, energy);
	}
	/**
	
	*/
	void setCameraFeedId(in long camera_feed_id)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setCameraFeedId, _godot_object, camera_feed_id);
	}
	/**
	
	*/
	void setCanvasMaxLayer(in long layer)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setCanvasMaxLayer, _godot_object, layer);
	}
	/**
	
	*/
	void setDofBlurFarAmount(in double intensity)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDofBlurFarAmount, _godot_object, intensity);
	}
	/**
	
	*/
	void setDofBlurFarDistance(in double intensity)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDofBlurFarDistance, _godot_object, intensity);
	}
	/**
	
	*/
	void setDofBlurFarEnabled(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDofBlurFarEnabled, _godot_object, enabled);
	}
	/**
	
	*/
	void setDofBlurFarQuality(in long intensity)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDofBlurFarQuality, _godot_object, intensity);
	}
	/**
	
	*/
	void setDofBlurFarTransition(in double intensity)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDofBlurFarTransition, _godot_object, intensity);
	}
	/**
	
	*/
	void setDofBlurNearAmount(in double intensity)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDofBlurNearAmount, _godot_object, intensity);
	}
	/**
	
	*/
	void setDofBlurNearDistance(in double intensity)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDofBlurNearDistance, _godot_object, intensity);
	}
	/**
	
	*/
	void setDofBlurNearEnabled(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDofBlurNearEnabled, _godot_object, enabled);
	}
	/**
	
	*/
	void setDofBlurNearQuality(in long level)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDofBlurNearQuality, _godot_object, level);
	}
	/**
	
	*/
	void setDofBlurNearTransition(in double intensity)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setDofBlurNearTransition, _godot_object, intensity);
	}
	/**
	
	*/
	void setFogColor(in Color color)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogColor, _godot_object, color);
	}
	/**
	
	*/
	void setFogDepthBegin(in double distance)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogDepthBegin, _godot_object, distance);
	}
	/**
	
	*/
	void setFogDepthCurve(in double curve)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogDepthCurve, _godot_object, curve);
	}
	/**
	
	*/
	void setFogDepthEnabled(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogDepthEnabled, _godot_object, enabled);
	}
	/**
	
	*/
	void setFogDepthEnd(in double distance)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogDepthEnd, _godot_object, distance);
	}
	/**
	
	*/
	void setFogEnabled(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogEnabled, _godot_object, enabled);
	}
	/**
	
	*/
	void setFogHeightCurve(in double curve)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogHeightCurve, _godot_object, curve);
	}
	/**
	
	*/
	void setFogHeightEnabled(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogHeightEnabled, _godot_object, enabled);
	}
	/**
	
	*/
	void setFogHeightMax(in double height)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogHeightMax, _godot_object, height);
	}
	/**
	
	*/
	void setFogHeightMin(in double height)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogHeightMin, _godot_object, height);
	}
	/**
	
	*/
	void setFogSunAmount(in double amount)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogSunAmount, _godot_object, amount);
	}
	/**
	
	*/
	void setFogSunColor(in Color color)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogSunColor, _godot_object, color);
	}
	/**
	
	*/
	void setFogTransmitCurve(in double curve)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogTransmitCurve, _godot_object, curve);
	}
	/**
	
	*/
	void setFogTransmitEnabled(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setFogTransmitEnabled, _godot_object, enabled);
	}
	/**
	
	*/
	void setGlowBicubicUpscale(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setGlowBicubicUpscale, _godot_object, enabled);
	}
	/**
	
	*/
	void setGlowBlendMode(in long mode)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setGlowBlendMode, _godot_object, mode);
	}
	/**
	
	*/
	void setGlowBloom(in double amount)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setGlowBloom, _godot_object, amount);
	}
	/**
	
	*/
	void setGlowEnabled(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setGlowEnabled, _godot_object, enabled);
	}
	/**
	
	*/
	void setGlowHdrBleedScale(in double scale)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setGlowHdrBleedScale, _godot_object, scale);
	}
	/**
	
	*/
	void setGlowHdrBleedThreshold(in double threshold)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setGlowHdrBleedThreshold, _godot_object, threshold);
	}
	/**
	
	*/
	void setGlowHdrLuminanceCap(in double amount)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setGlowHdrLuminanceCap, _godot_object, amount);
	}
	/**
	
	*/
	void setGlowHighQuality(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setGlowHighQuality, _godot_object, enabled);
	}
	/**
	
	*/
	void setGlowIntensity(in double intensity)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setGlowIntensity, _godot_object, intensity);
	}
	/**
	
	*/
	void setGlowLevel(in long idx, in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setGlowLevel, _godot_object, idx, enabled);
	}
	/**
	
	*/
	void setGlowStrength(in double strength)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setGlowStrength, _godot_object, strength);
	}
	/**
	
	*/
	void setSky(Sky sky)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSky, _godot_object, sky);
	}
	/**
	
	*/
	void setSkyCustomFov(in double scale)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSkyCustomFov, _godot_object, scale);
	}
	/**
	
	*/
	void setSkyOrientation(in Basis orientation)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSkyOrientation, _godot_object, orientation);
	}
	/**
	
	*/
	void setSkyRotation(in Vector3 euler_radians)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSkyRotation, _godot_object, euler_radians);
	}
	/**
	
	*/
	void setSkyRotationDegrees(in Vector3 euler_degrees)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSkyRotationDegrees, _godot_object, euler_degrees);
	}
	/**
	
	*/
	void setSsaoAoChannelAffect(in double amount)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsaoAoChannelAffect, _godot_object, amount);
	}
	/**
	
	*/
	void setSsaoBias(in double bias)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsaoBias, _godot_object, bias);
	}
	/**
	
	*/
	void setSsaoBlur(in long mode)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsaoBlur, _godot_object, mode);
	}
	/**
	
	*/
	void setSsaoColor(in Color color)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsaoColor, _godot_object, color);
	}
	/**
	
	*/
	void setSsaoDirectLightAffect(in double amount)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsaoDirectLightAffect, _godot_object, amount);
	}
	/**
	
	*/
	void setSsaoEdgeSharpness(in double edge_sharpness)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsaoEdgeSharpness, _godot_object, edge_sharpness);
	}
	/**
	
	*/
	void setSsaoEnabled(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsaoEnabled, _godot_object, enabled);
	}
	/**
	
	*/
	void setSsaoIntensity(in double intensity)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsaoIntensity, _godot_object, intensity);
	}
	/**
	
	*/
	void setSsaoIntensity2(in double intensity)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsaoIntensity2, _godot_object, intensity);
	}
	/**
	
	*/
	void setSsaoQuality(in long quality)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsaoQuality, _godot_object, quality);
	}
	/**
	
	*/
	void setSsaoRadius(in double radius)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsaoRadius, _godot_object, radius);
	}
	/**
	
	*/
	void setSsaoRadius2(in double radius)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsaoRadius2, _godot_object, radius);
	}
	/**
	
	*/
	void setSsrDepthTolerance(in double depth_tolerance)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsrDepthTolerance, _godot_object, depth_tolerance);
	}
	/**
	
	*/
	void setSsrEnabled(in bool enabled)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsrEnabled, _godot_object, enabled);
	}
	/**
	
	*/
	void setSsrFadeIn(in double fade_in)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsrFadeIn, _godot_object, fade_in);
	}
	/**
	
	*/
	void setSsrFadeOut(in double fade_out)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsrFadeOut, _godot_object, fade_out);
	}
	/**
	
	*/
	void setSsrMaxSteps(in long max_steps)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsrMaxSteps, _godot_object, max_steps);
	}
	/**
	
	*/
	void setSsrRough(in bool rough)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSsrRough, _godot_object, rough);
	}
	/**
	
	*/
	void setTonemapAutoExposure(in bool auto_exposure)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setTonemapAutoExposure, _godot_object, auto_exposure);
	}
	/**
	
	*/
	void setTonemapAutoExposureGrey(in double exposure_grey)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setTonemapAutoExposureGrey, _godot_object, exposure_grey);
	}
	/**
	
	*/
	void setTonemapAutoExposureMax(in double exposure_max)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setTonemapAutoExposureMax, _godot_object, exposure_max);
	}
	/**
	
	*/
	void setTonemapAutoExposureMin(in double exposure_min)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setTonemapAutoExposureMin, _godot_object, exposure_min);
	}
	/**
	
	*/
	void setTonemapAutoExposureSpeed(in double exposure_speed)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setTonemapAutoExposureSpeed, _godot_object, exposure_speed);
	}
	/**
	
	*/
	void setTonemapExposure(in double exposure)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setTonemapExposure, _godot_object, exposure);
	}
	/**
	
	*/
	void setTonemapWhite(in double white)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setTonemapWhite, _godot_object, white);
	}
	/**
	
	*/
	void setTonemapper(in long mode)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setTonemapper, _godot_object, mode);
	}
	/**
	
	*/
	@property double adjustmentBrightness()
	{
		return getAdjustmentBrightness();
	}
	/// ditto
	@property void adjustmentBrightness(double v)
	{
		setAdjustmentBrightness(v);
	}
	/**
	
	*/
	@property Texture adjustmentColorCorrection()
	{
		return getAdjustmentColorCorrection();
	}
	/// ditto
	@property void adjustmentColorCorrection(Texture v)
	{
		setAdjustmentColorCorrection(v);
	}
	/**
	
	*/
	@property double adjustmentContrast()
	{
		return getAdjustmentContrast();
	}
	/// ditto
	@property void adjustmentContrast(double v)
	{
		setAdjustmentContrast(v);
	}
	/**
	
	*/
	@property bool adjustmentEnabled()
	{
		return isAdjustmentEnabled();
	}
	/// ditto
	@property void adjustmentEnabled(bool v)
	{
		setAdjustmentEnable(v);
	}
	/**
	
	*/
	@property double adjustmentSaturation()
	{
		return getAdjustmentSaturation();
	}
	/// ditto
	@property void adjustmentSaturation(double v)
	{
		setAdjustmentSaturation(v);
	}
	/**
	
	*/
	@property Color ambientLightColor()
	{
		return getAmbientLightColor();
	}
	/// ditto
	@property void ambientLightColor(Color v)
	{
		setAmbientLightColor(v);
	}
	/**
	
	*/
	@property double ambientLightEnergy()
	{
		return getAmbientLightEnergy();
	}
	/// ditto
	@property void ambientLightEnergy(double v)
	{
		setAmbientLightEnergy(v);
	}
	/**
	
	*/
	@property double ambientLightSkyContribution()
	{
		return getAmbientLightSkyContribution();
	}
	/// ditto
	@property void ambientLightSkyContribution(double v)
	{
		setAmbientLightSkyContribution(v);
	}
	/**
	
	*/
	@property bool autoExposureEnabled()
	{
		return getTonemapAutoExposure();
	}
	/// ditto
	@property void autoExposureEnabled(bool v)
	{
		setTonemapAutoExposure(v);
	}
	/**
	
	*/
	@property double autoExposureMaxLuma()
	{
		return getTonemapAutoExposureMax();
	}
	/// ditto
	@property void autoExposureMaxLuma(double v)
	{
		setTonemapAutoExposureMax(v);
	}
	/**
	
	*/
	@property double autoExposureMinLuma()
	{
		return getTonemapAutoExposureMin();
	}
	/// ditto
	@property void autoExposureMinLuma(double v)
	{
		setTonemapAutoExposureMin(v);
	}
	/**
	
	*/
	@property double autoExposureScale()
	{
		return getTonemapAutoExposureGrey();
	}
	/// ditto
	@property void autoExposureScale(double v)
	{
		setTonemapAutoExposureGrey(v);
	}
	/**
	
	*/
	@property double autoExposureSpeed()
	{
		return getTonemapAutoExposureSpeed();
	}
	/// ditto
	@property void autoExposureSpeed(double v)
	{
		setTonemapAutoExposureSpeed(v);
	}
	/**
	
	*/
	@property long backgroundCameraFeedId()
	{
		return getCameraFeedId();
	}
	/// ditto
	@property void backgroundCameraFeedId(long v)
	{
		setCameraFeedId(v);
	}
	/**
	
	*/
	@property long backgroundCanvasMaxLayer()
	{
		return getCanvasMaxLayer();
	}
	/// ditto
	@property void backgroundCanvasMaxLayer(long v)
	{
		setCanvasMaxLayer(v);
	}
	/**
	
	*/
	@property Color backgroundColor()
	{
		return getBgColor();
	}
	/// ditto
	@property void backgroundColor(Color v)
	{
		setBgColor(v);
	}
	/**
	
	*/
	@property double backgroundEnergy()
	{
		return getBgEnergy();
	}
	/// ditto
	@property void backgroundEnergy(double v)
	{
		setBgEnergy(v);
	}
	/**
	
	*/
	@property Environment.BGMode backgroundMode()
	{
		return getBackground();
	}
	/// ditto
	@property void backgroundMode(long v)
	{
		setBackground(v);
	}
	/**
	
	*/
	@property Sky backgroundSky()
	{
		return getSky();
	}
	/// ditto
	@property void backgroundSky(Sky v)
	{
		setSky(v);
	}
	/**
	
	*/
	@property double backgroundSkyCustomFov()
	{
		return getSkyCustomFov();
	}
	/// ditto
	@property void backgroundSkyCustomFov(double v)
	{
		setSkyCustomFov(v);
	}
	/**
	
	*/
	@property Basis backgroundSkyOrientation()
	{
		return getSkyOrientation();
	}
	/// ditto
	@property void backgroundSkyOrientation(Basis v)
	{
		setSkyOrientation(v);
	}
	/**
	
	*/
	@property Vector3 backgroundSkyRotation()
	{
		return getSkyRotation();
	}
	/// ditto
	@property void backgroundSkyRotation(Vector3 v)
	{
		setSkyRotation(v);
	}
	/**
	
	*/
	@property Vector3 backgroundSkyRotationDegrees()
	{
		return getSkyRotationDegrees();
	}
	/// ditto
	@property void backgroundSkyRotationDegrees(Vector3 v)
	{
		setSkyRotationDegrees(v);
	}
	/**
	
	*/
	@property double dofBlurFarAmount()
	{
		return getDofBlurFarAmount();
	}
	/// ditto
	@property void dofBlurFarAmount(double v)
	{
		setDofBlurFarAmount(v);
	}
	/**
	
	*/
	@property double dofBlurFarDistance()
	{
		return getDofBlurFarDistance();
	}
	/// ditto
	@property void dofBlurFarDistance(double v)
	{
		setDofBlurFarDistance(v);
	}
	/**
	
	*/
	@property bool dofBlurFarEnabled()
	{
		return isDofBlurFarEnabled();
	}
	/// ditto
	@property void dofBlurFarEnabled(bool v)
	{
		setDofBlurFarEnabled(v);
	}
	/**
	
	*/
	@property Environment.DOFBlurQuality dofBlurFarQuality()
	{
		return getDofBlurFarQuality();
	}
	/// ditto
	@property void dofBlurFarQuality(long v)
	{
		setDofBlurFarQuality(v);
	}
	/**
	
	*/
	@property double dofBlurFarTransition()
	{
		return getDofBlurFarTransition();
	}
	/// ditto
	@property void dofBlurFarTransition(double v)
	{
		setDofBlurFarTransition(v);
	}
	/**
	
	*/
	@property double dofBlurNearAmount()
	{
		return getDofBlurNearAmount();
	}
	/// ditto
	@property void dofBlurNearAmount(double v)
	{
		setDofBlurNearAmount(v);
	}
	/**
	
	*/
	@property double dofBlurNearDistance()
	{
		return getDofBlurNearDistance();
	}
	/// ditto
	@property void dofBlurNearDistance(double v)
	{
		setDofBlurNearDistance(v);
	}
	/**
	
	*/
	@property bool dofBlurNearEnabled()
	{
		return isDofBlurNearEnabled();
	}
	/// ditto
	@property void dofBlurNearEnabled(bool v)
	{
		setDofBlurNearEnabled(v);
	}
	/**
	
	*/
	@property Environment.DOFBlurQuality dofBlurNearQuality()
	{
		return getDofBlurNearQuality();
	}
	/// ditto
	@property void dofBlurNearQuality(long v)
	{
		setDofBlurNearQuality(v);
	}
	/**
	
	*/
	@property double dofBlurNearTransition()
	{
		return getDofBlurNearTransition();
	}
	/// ditto
	@property void dofBlurNearTransition(double v)
	{
		setDofBlurNearTransition(v);
	}
	/**
	
	*/
	@property Color fogColor()
	{
		return getFogColor();
	}
	/// ditto
	@property void fogColor(Color v)
	{
		setFogColor(v);
	}
	/**
	
	*/
	@property double fogDepthBegin()
	{
		return getFogDepthBegin();
	}
	/// ditto
	@property void fogDepthBegin(double v)
	{
		setFogDepthBegin(v);
	}
	/**
	
	*/
	@property double fogDepthCurve()
	{
		return getFogDepthCurve();
	}
	/// ditto
	@property void fogDepthCurve(double v)
	{
		setFogDepthCurve(v);
	}
	/**
	
	*/
	@property bool fogDepthEnabled()
	{
		return isFogDepthEnabled();
	}
	/// ditto
	@property void fogDepthEnabled(bool v)
	{
		setFogDepthEnabled(v);
	}
	/**
	
	*/
	@property double fogDepthEnd()
	{
		return getFogDepthEnd();
	}
	/// ditto
	@property void fogDepthEnd(double v)
	{
		setFogDepthEnd(v);
	}
	/**
	
	*/
	@property bool fogEnabled()
	{
		return isFogEnabled();
	}
	/// ditto
	@property void fogEnabled(bool v)
	{
		setFogEnabled(v);
	}
	/**
	
	*/
	@property double fogHeightCurve()
	{
		return getFogHeightCurve();
	}
	/// ditto
	@property void fogHeightCurve(double v)
	{
		setFogHeightCurve(v);
	}
	/**
	
	*/
	@property bool fogHeightEnabled()
	{
		return isFogHeightEnabled();
	}
	/// ditto
	@property void fogHeightEnabled(bool v)
	{
		setFogHeightEnabled(v);
	}
	/**
	
	*/
	@property double fogHeightMax()
	{
		return getFogHeightMax();
	}
	/// ditto
	@property void fogHeightMax(double v)
	{
		setFogHeightMax(v);
	}
	/**
	
	*/
	@property double fogHeightMin()
	{
		return getFogHeightMin();
	}
	/// ditto
	@property void fogHeightMin(double v)
	{
		setFogHeightMin(v);
	}
	/**
	
	*/
	@property double fogSunAmount()
	{
		return getFogSunAmount();
	}
	/// ditto
	@property void fogSunAmount(double v)
	{
		setFogSunAmount(v);
	}
	/**
	
	*/
	@property Color fogSunColor()
	{
		return getFogSunColor();
	}
	/// ditto
	@property void fogSunColor(Color v)
	{
		setFogSunColor(v);
	}
	/**
	
	*/
	@property double fogTransmitCurve()
	{
		return getFogTransmitCurve();
	}
	/// ditto
	@property void fogTransmitCurve(double v)
	{
		setFogTransmitCurve(v);
	}
	/**
	
	*/
	@property bool fogTransmitEnabled()
	{
		return isFogTransmitEnabled();
	}
	/// ditto
	@property void fogTransmitEnabled(bool v)
	{
		setFogTransmitEnabled(v);
	}
	/**
	
	*/
	@property bool glowBicubicUpscale()
	{
		return isGlowBicubicUpscaleEnabled();
	}
	/// ditto
	@property void glowBicubicUpscale(bool v)
	{
		setGlowBicubicUpscale(v);
	}
	/**
	
	*/
	@property Environment.GlowBlendMode glowBlendMode()
	{
		return getGlowBlendMode();
	}
	/// ditto
	@property void glowBlendMode(long v)
	{
		setGlowBlendMode(v);
	}
	/**
	
	*/
	@property double glowBloom()
	{
		return getGlowBloom();
	}
	/// ditto
	@property void glowBloom(double v)
	{
		setGlowBloom(v);
	}
	/**
	
	*/
	@property bool glowEnabled()
	{
		return isGlowEnabled();
	}
	/// ditto
	@property void glowEnabled(bool v)
	{
		setGlowEnabled(v);
	}
	/**
	
	*/
	@property double glowHdrLuminanceCap()
	{
		return getGlowHdrLuminanceCap();
	}
	/// ditto
	@property void glowHdrLuminanceCap(double v)
	{
		setGlowHdrLuminanceCap(v);
	}
	/**
	
	*/
	@property double glowHdrScale()
	{
		return getGlowHdrBleedScale();
	}
	/// ditto
	@property void glowHdrScale(double v)
	{
		setGlowHdrBleedScale(v);
	}
	/**
	
	*/
	@property double glowHdrThreshold()
	{
		return getGlowHdrBleedThreshold();
	}
	/// ditto
	@property void glowHdrThreshold(double v)
	{
		setGlowHdrBleedThreshold(v);
	}
	/**
	
	*/
	@property bool glowHighQuality()
	{
		return isGlowHighQualityEnabled();
	}
	/// ditto
	@property void glowHighQuality(bool v)
	{
		setGlowHighQuality(v);
	}
	/**
	
	*/
	@property double glowIntensity()
	{
		return getGlowIntensity();
	}
	/// ditto
	@property void glowIntensity(double v)
	{
		setGlowIntensity(v);
	}
	/**
	
	*/
	@property bool glowLevels1()
	{
		return isGlowLevelEnabled(0);
	}
	/// ditto
	@property void glowLevels1(bool v)
	{
		setGlowLevel(0, v);
	}
	/**
	
	*/
	@property bool glowLevels2()
	{
		return isGlowLevelEnabled(1);
	}
	/// ditto
	@property void glowLevels2(bool v)
	{
		setGlowLevel(1, v);
	}
	/**
	
	*/
	@property bool glowLevels3()
	{
		return isGlowLevelEnabled(2);
	}
	/// ditto
	@property void glowLevels3(bool v)
	{
		setGlowLevel(2, v);
	}
	/**
	
	*/
	@property bool glowLevels4()
	{
		return isGlowLevelEnabled(3);
	}
	/// ditto
	@property void glowLevels4(bool v)
	{
		setGlowLevel(3, v);
	}
	/**
	
	*/
	@property bool glowLevels5()
	{
		return isGlowLevelEnabled(4);
	}
	/// ditto
	@property void glowLevels5(bool v)
	{
		setGlowLevel(4, v);
	}
	/**
	
	*/
	@property bool glowLevels6()
	{
		return isGlowLevelEnabled(5);
	}
	/// ditto
	@property void glowLevels6(bool v)
	{
		setGlowLevel(5, v);
	}
	/**
	
	*/
	@property bool glowLevels7()
	{
		return isGlowLevelEnabled(6);
	}
	/// ditto
	@property void glowLevels7(bool v)
	{
		setGlowLevel(6, v);
	}
	/**
	
	*/
	@property double glowStrength()
	{
		return getGlowStrength();
	}
	/// ditto
	@property void glowStrength(double v)
	{
		setGlowStrength(v);
	}
	/**
	
	*/
	@property double ssReflectionsDepthTolerance()
	{
		return getSsrDepthTolerance();
	}
	/// ditto
	@property void ssReflectionsDepthTolerance(double v)
	{
		setSsrDepthTolerance(v);
	}
	/**
	
	*/
	@property bool ssReflectionsEnabled()
	{
		return isSsrEnabled();
	}
	/// ditto
	@property void ssReflectionsEnabled(bool v)
	{
		setSsrEnabled(v);
	}
	/**
	
	*/
	@property double ssReflectionsFadeIn()
	{
		return getSsrFadeIn();
	}
	/// ditto
	@property void ssReflectionsFadeIn(double v)
	{
		setSsrFadeIn(v);
	}
	/**
	
	*/
	@property double ssReflectionsFadeOut()
	{
		return getSsrFadeOut();
	}
	/// ditto
	@property void ssReflectionsFadeOut(double v)
	{
		setSsrFadeOut(v);
	}
	/**
	
	*/
	@property long ssReflectionsMaxSteps()
	{
		return getSsrMaxSteps();
	}
	/// ditto
	@property void ssReflectionsMaxSteps(long v)
	{
		setSsrMaxSteps(v);
	}
	/**
	
	*/
	@property bool ssReflectionsRoughness()
	{
		return isSsrRough();
	}
	/// ditto
	@property void ssReflectionsRoughness(bool v)
	{
		setSsrRough(v);
	}
	/**
	
	*/
	@property double ssaoAoChannelAffect()
	{
		return getSsaoAoChannelAffect();
	}
	/// ditto
	@property void ssaoAoChannelAffect(double v)
	{
		setSsaoAoChannelAffect(v);
	}
	/**
	
	*/
	@property double ssaoBias()
	{
		return getSsaoBias();
	}
	/// ditto
	@property void ssaoBias(double v)
	{
		setSsaoBias(v);
	}
	/**
	
	*/
	@property Environment.SSAOBlur ssaoBlur()
	{
		return getSsaoBlur();
	}
	/// ditto
	@property void ssaoBlur(long v)
	{
		setSsaoBlur(v);
	}
	/**
	
	*/
	@property Color ssaoColor()
	{
		return getSsaoColor();
	}
	/// ditto
	@property void ssaoColor(Color v)
	{
		setSsaoColor(v);
	}
	/**
	
	*/
	@property double ssaoEdgeSharpness()
	{
		return getSsaoEdgeSharpness();
	}
	/// ditto
	@property void ssaoEdgeSharpness(double v)
	{
		setSsaoEdgeSharpness(v);
	}
	/**
	
	*/
	@property bool ssaoEnabled()
	{
		return isSsaoEnabled();
	}
	/// ditto
	@property void ssaoEnabled(bool v)
	{
		setSsaoEnabled(v);
	}
	/**
	
	*/
	@property double ssaoIntensity()
	{
		return getSsaoIntensity();
	}
	/// ditto
	@property void ssaoIntensity(double v)
	{
		setSsaoIntensity(v);
	}
	/**
	
	*/
	@property double ssaoIntensity2()
	{
		return getSsaoIntensity2();
	}
	/// ditto
	@property void ssaoIntensity2(double v)
	{
		setSsaoIntensity2(v);
	}
	/**
	
	*/
	@property double ssaoLightAffect()
	{
		return getSsaoDirectLightAffect();
	}
	/// ditto
	@property void ssaoLightAffect(double v)
	{
		setSsaoDirectLightAffect(v);
	}
	/**
	
	*/
	@property Environment.SSAOQuality ssaoQuality()
	{
		return getSsaoQuality();
	}
	/// ditto
	@property void ssaoQuality(long v)
	{
		setSsaoQuality(v);
	}
	/**
	
	*/
	@property double ssaoRadius()
	{
		return getSsaoRadius();
	}
	/// ditto
	@property void ssaoRadius(double v)
	{
		setSsaoRadius(v);
	}
	/**
	
	*/
	@property double ssaoRadius2()
	{
		return getSsaoRadius2();
	}
	/// ditto
	@property void ssaoRadius2(double v)
	{
		setSsaoRadius2(v);
	}
	/**
	
	*/
	@property double tonemapExposure()
	{
		return getTonemapExposure();
	}
	/// ditto
	@property void tonemapExposure(double v)
	{
		setTonemapExposure(v);
	}
	/**
	
	*/
	@property Environment.ToneMapper tonemapMode()
	{
		return getTonemapper();
	}
	/// ditto
	@property void tonemapMode(long v)
	{
		setTonemapper(v);
	}
	/**
	
	*/
	@property double tonemapWhite()
	{
		return getTonemapWhite();
	}
	/// ditto
	@property void tonemapWhite(double v)
	{
		setTonemapWhite(v);
	}
}
