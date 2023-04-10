/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-2018 Godot Engine contributors (cf. AUTHORS.md)  
Copyright (c) 2017-2018 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.graphedit;
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
import godot.control;
import godot.canvasitem;
import godot.node;
import godot.inputevent;
import godot.hboxcontainer;
/**

*/
@GodotBaseClass struct GraphEdit
{
	package(godot) enum string _GODOT_internal_name = "GraphEdit";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ Control _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("_connections_layer_draw") GodotMethod!(void) _connectionsLayerDraw;
		@GodotName("_graph_node_moved") GodotMethod!(void, Node) _graphNodeMoved;
		@GodotName("_graph_node_raised") GodotMethod!(void, Node) _graphNodeRaised;
		@GodotName("_graph_node_slot_updated") GodotMethod!(void, long, Node) _graphNodeSlotUpdated;
		@GodotName("_gui_input") GodotMethod!(void, InputEvent) _guiInput;
		@GodotName("_minimap_draw") GodotMethod!(void) _minimapDraw;
		@GodotName("_minimap_toggled") GodotMethod!(void) _minimapToggled;
		@GodotName("_scroll_moved") GodotMethod!(void, double) _scrollMoved;
		@GodotName("_snap_toggled") GodotMethod!(void) _snapToggled;
		@GodotName("_snap_value_changed") GodotMethod!(void, double) _snapValueChanged;
		@GodotName("_top_layer_draw") GodotMethod!(void) _topLayerDraw;
		@GodotName("_top_layer_input") GodotMethod!(void, InputEvent) _topLayerInput;
		@GodotName("_update_scroll_offset") GodotMethod!(void) _updateScrollOffset;
		@GodotName("_zoom_minus") GodotMethod!(void) _zoomMinus;
		@GodotName("_zoom_plus") GodotMethod!(void) _zoomPlus;
		@GodotName("_zoom_reset") GodotMethod!(void) _zoomReset;
		@GodotName("add_valid_connection_type") GodotMethod!(void, long, long) addValidConnectionType;
		@GodotName("add_valid_left_disconnect_type") GodotMethod!(void, long) addValidLeftDisconnectType;
		@GodotName("add_valid_right_disconnect_type") GodotMethod!(void, long) addValidRightDisconnectType;
		@GodotName("clear_connections") GodotMethod!(void) clearConnections;
		@GodotName("connect_node") GodotMethod!(GodotError, String, long, String, long) connectNode;
		@GodotName("disconnect_node") GodotMethod!(void, String, long, String, long) disconnectNode;
		@GodotName("get_connection_list") GodotMethod!(Array) getConnectionList;
		@GodotName("get_minimap_opacity") GodotMethod!(double) getMinimapOpacity;
		@GodotName("get_minimap_size") GodotMethod!(Vector2) getMinimapSize;
		@GodotName("get_scroll_ofs") GodotMethod!(Vector2) getScrollOfs;
		@GodotName("get_snap") GodotMethod!(long) getSnap;
		@GodotName("get_zoom") GodotMethod!(double) getZoom;
		@GodotName("get_zoom_hbox") GodotMethod!(HBoxContainer) getZoomHbox;
		@GodotName("get_zoom_max") GodotMethod!(double) getZoomMax;
		@GodotName("get_zoom_min") GodotMethod!(double) getZoomMin;
		@GodotName("get_zoom_step") GodotMethod!(double) getZoomStep;
		@GodotName("is_minimap_enabled") GodotMethod!(bool) isMinimapEnabled;
		@GodotName("is_node_connected") GodotMethod!(bool, String, long, String, long) isNodeConnected;
		@GodotName("is_right_disconnects_enabled") GodotMethod!(bool) isRightDisconnectsEnabled;
		@GodotName("is_showing_zoom_label") GodotMethod!(bool) isShowingZoomLabel;
		@GodotName("is_using_snap") GodotMethod!(bool) isUsingSnap;
		@GodotName("is_valid_connection_type") GodotMethod!(bool, long, long) isValidConnectionType;
		@GodotName("remove_valid_connection_type") GodotMethod!(void, long, long) removeValidConnectionType;
		@GodotName("remove_valid_left_disconnect_type") GodotMethod!(void, long) removeValidLeftDisconnectType;
		@GodotName("remove_valid_right_disconnect_type") GodotMethod!(void, long) removeValidRightDisconnectType;
		@GodotName("set_connection_activity") GodotMethod!(void, String, long, String, long, double) setConnectionActivity;
		@GodotName("set_minimap_enabled") GodotMethod!(void, bool) setMinimapEnabled;
		@GodotName("set_minimap_opacity") GodotMethod!(void, double) setMinimapOpacity;
		@GodotName("set_minimap_size") GodotMethod!(void, Vector2) setMinimapSize;
		@GodotName("set_right_disconnects") GodotMethod!(void, bool) setRightDisconnects;
		@GodotName("set_scroll_ofs") GodotMethod!(void, Vector2) setScrollOfs;
		@GodotName("set_selected") GodotMethod!(void, Node) setSelected;
		@GodotName("set_show_zoom_label") GodotMethod!(void, bool) setShowZoomLabel;
		@GodotName("set_snap") GodotMethod!(void, long) setSnap;
		@GodotName("set_use_snap") GodotMethod!(void, bool) setUseSnap;
		@GodotName("set_zoom") GodotMethod!(void, double) setZoom;
		@GodotName("set_zoom_max") GodotMethod!(void, double) setZoomMax;
		@GodotName("set_zoom_min") GodotMethod!(void, double) setZoomMin;
		@GodotName("set_zoom_step") GodotMethod!(void, double) setZoomStep;
	}
	/// 
	pragma(inline, true) bool opEquals(in GraphEdit other) const
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
	/// Construct a new instance of GraphEdit.
	/// Note: use `memnew!GraphEdit` instead.
	static GraphEdit _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("GraphEdit");
		if(constructor is null) return typeof(this).init;
		return cast(GraphEdit)(constructor());
	}
	/**
	
	*/
	void _connectionsLayerDraw()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_connections_layer_draw");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _graphNodeMoved(Node arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_graph_node_moved");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _graphNodeRaised(Node arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_graph_node_raised");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _graphNodeSlotUpdated(in long arg0, Node arg1)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		_GODOT_args.append(arg1);
		String _GODOT_method_name = String("_graph_node_slot_updated");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _guiInput(InputEvent arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_gui_input");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _minimapDraw()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_minimap_draw");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _minimapToggled()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_minimap_toggled");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _scrollMoved(in double arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_scroll_moved");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _snapToggled()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_snap_toggled");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _snapValueChanged(in double arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_snap_value_changed");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _topLayerDraw()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_top_layer_draw");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _topLayerInput(InputEvent arg0)
	{
		Array _GODOT_args = Array.make();
		_GODOT_args.append(arg0);
		String _GODOT_method_name = String("_top_layer_input");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _updateScrollOffset()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_update_scroll_offset");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _zoomMinus()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_zoom_minus");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _zoomPlus()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_zoom_plus");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void _zoomReset()
	{
		Array _GODOT_args = Array.make();
		String _GODOT_method_name = String("_zoom_reset");
		this.callv(_GODOT_method_name, _GODOT_args);
	}
	/**
	
	*/
	void addValidConnectionType(in long from_type, in long to_type)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.addValidConnectionType, _godot_object, from_type, to_type);
	}
	/**
	
	*/
	void addValidLeftDisconnectType(in long type)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.addValidLeftDisconnectType, _godot_object, type);
	}
	/**
	
	*/
	void addValidRightDisconnectType(in long type)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.addValidRightDisconnectType, _godot_object, type);
	}
	/**
	
	*/
	void clearConnections()
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.clearConnections, _godot_object);
	}
	/**
	
	*/
	GodotError connectNode(in String from, in long from_port, in String to, in long to_port)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(GodotError)(GDNativeClassBinding.connectNode, _godot_object, from, from_port, to, to_port);
	}
	/**
	
	*/
	void disconnectNode(in String from, in long from_port, in String to, in long to_port)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.disconnectNode, _godot_object, from, from_port, to, to_port);
	}
	/**
	
	*/
	Array getConnectionList() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Array)(GDNativeClassBinding.getConnectionList, _godot_object);
	}
	/**
	
	*/
	double getMinimapOpacity() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getMinimapOpacity, _godot_object);
	}
	/**
	
	*/
	Vector2 getMinimapSize() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getMinimapSize, _godot_object);
	}
	/**
	
	*/
	Vector2 getScrollOfs() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Vector2)(GDNativeClassBinding.getScrollOfs, _godot_object);
	}
	/**
	
	*/
	long getSnap() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(long)(GDNativeClassBinding.getSnap, _godot_object);
	}
	/**
	
	*/
	double getZoom() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getZoom, _godot_object);
	}
	/**
	
	*/
	HBoxContainer getZoomHbox()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(HBoxContainer)(GDNativeClassBinding.getZoomHbox, _godot_object);
	}
	/**
	
	*/
	double getZoomMax() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getZoomMax, _godot_object);
	}
	/**
	
	*/
	double getZoomMin() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getZoomMin, _godot_object);
	}
	/**
	
	*/
	double getZoomStep() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(double)(GDNativeClassBinding.getZoomStep, _godot_object);
	}
	/**
	
	*/
	bool isMinimapEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isMinimapEnabled, _godot_object);
	}
	/**
	
	*/
	bool isNodeConnected(in String from, in long from_port, in String to, in long to_port)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isNodeConnected, _godot_object, from, from_port, to, to_port);
	}
	/**
	
	*/
	bool isRightDisconnectsEnabled() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isRightDisconnectsEnabled, _godot_object);
	}
	/**
	
	*/
	bool isShowingZoomLabel() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isShowingZoomLabel, _godot_object);
	}
	/**
	
	*/
	bool isUsingSnap() const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isUsingSnap, _godot_object);
	}
	/**
	
	*/
	bool isValidConnectionType(in long from_type, in long to_type) const
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.isValidConnectionType, _godot_object, from_type, to_type);
	}
	/**
	
	*/
	void removeValidConnectionType(in long from_type, in long to_type)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.removeValidConnectionType, _godot_object, from_type, to_type);
	}
	/**
	
	*/
	void removeValidLeftDisconnectType(in long type)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.removeValidLeftDisconnectType, _godot_object, type);
	}
	/**
	
	*/
	void removeValidRightDisconnectType(in long type)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.removeValidRightDisconnectType, _godot_object, type);
	}
	/**
	
	*/
	void setConnectionActivity(in String from, in long from_port, in String to, in long to_port, in double amount)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setConnectionActivity, _godot_object, from, from_port, to, to_port, amount);
	}
	/**
	
	*/
	void setMinimapEnabled(in bool enable)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setMinimapEnabled, _godot_object, enable);
	}
	/**
	
	*/
	void setMinimapOpacity(in double p_opacity)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setMinimapOpacity, _godot_object, p_opacity);
	}
	/**
	
	*/
	void setMinimapSize(in Vector2 p_size)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setMinimapSize, _godot_object, p_size);
	}
	/**
	
	*/
	void setRightDisconnects(in bool enable)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setRightDisconnects, _godot_object, enable);
	}
	/**
	
	*/
	void setScrollOfs(in Vector2 ofs)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setScrollOfs, _godot_object, ofs);
	}
	/**
	
	*/
	void setSelected(Node node)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSelected, _godot_object, node);
	}
	/**
	
	*/
	void setShowZoomLabel(in bool enable)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setShowZoomLabel, _godot_object, enable);
	}
	/**
	
	*/
	void setSnap(in long pixels)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setSnap, _godot_object, pixels);
	}
	/**
	
	*/
	void setUseSnap(in bool enable)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setUseSnap, _godot_object, enable);
	}
	/**
	
	*/
	void setZoom(in double p_zoom)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setZoom, _godot_object, p_zoom);
	}
	/**
	
	*/
	void setZoomMax(in double zoom_max)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setZoomMax, _godot_object, zoom_max);
	}
	/**
	
	*/
	void setZoomMin(in double zoom_min)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setZoomMin, _godot_object, zoom_min);
	}
	/**
	
	*/
	void setZoomStep(in double zoom_step)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.setZoomStep, _godot_object, zoom_step);
	}
	/**
	
	*/
	@property bool minimapEnabled()
	{
		return isMinimapEnabled();
	}
	/// ditto
	@property void minimapEnabled(bool v)
	{
		setMinimapEnabled(v);
	}
	/**
	
	*/
	@property double minimapOpacity()
	{
		return getMinimapOpacity();
	}
	/// ditto
	@property void minimapOpacity(double v)
	{
		setMinimapOpacity(v);
	}
	/**
	
	*/
	@property Vector2 minimapSize()
	{
		return getMinimapSize();
	}
	/// ditto
	@property void minimapSize(Vector2 v)
	{
		setMinimapSize(v);
	}
	/**
	
	*/
	@property bool rightDisconnects()
	{
		return isRightDisconnectsEnabled();
	}
	/// ditto
	@property void rightDisconnects(bool v)
	{
		setRightDisconnects(v);
	}
	/**
	
	*/
	@property Vector2 scrollOffset()
	{
		return getScrollOfs();
	}
	/// ditto
	@property void scrollOffset(Vector2 v)
	{
		setScrollOfs(v);
	}
	/**
	
	*/
	@property bool showZoomLabel()
	{
		return isShowingZoomLabel();
	}
	/// ditto
	@property void showZoomLabel(bool v)
	{
		setShowZoomLabel(v);
	}
	/**
	
	*/
	@property long snapDistance()
	{
		return getSnap();
	}
	/// ditto
	@property void snapDistance(long v)
	{
		setSnap(v);
	}
	/**
	
	*/
	@property bool useSnap()
	{
		return isUsingSnap();
	}
	/// ditto
	@property void useSnap(bool v)
	{
		setUseSnap(v);
	}
	/**
	
	*/
	@property double zoom()
	{
		return getZoom();
	}
	/// ditto
	@property void zoom(double v)
	{
		setZoom(v);
	}
	/**
	
	*/
	@property double zoomMax()
	{
		return getZoomMax();
	}
	/// ditto
	@property void zoomMax(double v)
	{
		setZoomMax(v);
	}
	/**
	
	*/
	@property double zoomMin()
	{
		return getZoomMin();
	}
	/// ditto
	@property void zoomMin(double v)
	{
		setZoomMin(v);
	}
	/**
	
	*/
	@property double zoomStep()
	{
		return getZoomStep();
	}
	/// ditto
	@property void zoomStep(double v)
	{
		setZoomStep(v);
	}
}
