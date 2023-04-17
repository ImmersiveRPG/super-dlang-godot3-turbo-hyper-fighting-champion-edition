/**


Copyright:
Copyright (c) 2007-2018 Juan Linietsky, Ariel Manzur.  
Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md).  
Copyright (c) 2017-2021 Godot-D contributors  

License: $(LINK2 https://opensource.org/licenses/MIT, MIT License)


*/
module godot.webrtcmultiplayer;
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
import godot.networkedmultiplayerpeer;
import godot.packetpeer;
import godot.reference;
import godot.webrtcpeerconnection;
/**

*/
@GodotBaseClass struct WebRTCMultiplayer
{
	package(godot) enum string _GODOT_internal_name = "WebRTCMultiplayer";
public:
@nogc nothrow:
	union { /** */ godot_object _godot_object; /** */ NetworkedMultiplayerPeer _GODOT_base; }
	alias _GODOT_base this;
	alias BaseClasses = AliasSeq!(typeof(_GODOT_base), typeof(_GODOT_base).BaseClasses);
	package(godot) __gshared bool _classBindingInitialized = false;
	package(godot) static struct GDNativeClassBinding
	{
		__gshared:
		@GodotName("add_peer") GodotMethod!(GodotError, WebRTCPeerConnection, long, long) addPeer;
		@GodotName("close") GodotMethod!(void) close;
		@GodotName("get_peer") GodotMethod!(Dictionary, long) getPeer;
		@GodotName("get_peers") GodotMethod!(Dictionary) getPeers;
		@GodotName("has_peer") GodotMethod!(bool, long) hasPeer;
		@GodotName("initialize") GodotMethod!(GodotError, long, bool) initialize;
		@GodotName("remove_peer") GodotMethod!(void, long) removePeer;
	}
	/// 
	pragma(inline, true) bool opEquals(in WebRTCMultiplayer other) const
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
	/// Construct a new instance of WebRTCMultiplayer.
	/// Note: use `memnew!WebRTCMultiplayer` instead.
	static WebRTCMultiplayer _new()
	{
		static godot_class_constructor constructor;
		if(constructor is null) constructor = _godot_api.godot_get_class_constructor("WebRTCMultiplayer");
		if(constructor is null) return typeof(this).init;
		return cast(WebRTCMultiplayer)(constructor());
	}
	/**
	
	*/
	GodotError addPeer(WebRTCPeerConnection peer, in long peer_id, in long unreliable_lifetime = 1)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(GodotError)(GDNativeClassBinding.addPeer, _godot_object, peer, peer_id, unreliable_lifetime);
	}
	/**
	
	*/
	void close()
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.close, _godot_object);
	}
	/**
	
	*/
	Dictionary getPeer(in long peer_id)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Dictionary)(GDNativeClassBinding.getPeer, _godot_object, peer_id);
	}
	/**
	
	*/
	Dictionary getPeers()
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(Dictionary)(GDNativeClassBinding.getPeers, _godot_object);
	}
	/**
	
	*/
	bool hasPeer(in long peer_id)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(bool)(GDNativeClassBinding.hasPeer, _godot_object, peer_id);
	}
	/**
	
	*/
	GodotError initialize(in long peer_id, in bool server_compatibility = false)
	{
		checkClassBinding!(typeof(this))();
		return ptrcall!(GodotError)(GDNativeClassBinding.initialize, _godot_object, peer_id, server_compatibility);
	}
	/**
	
	*/
	void removePeer(in long peer_id)
	{
		checkClassBinding!(typeof(this))();
		ptrcall!(void)(GDNativeClassBinding.removePeer, _godot_object, peer_id);
	}
}
