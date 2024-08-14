// Create these objects if they do not exist
if !instance_exists(oDebugControl) instance_create_layer(0, 0, "Control", oDebugControl)
if !instance_exists(oAudioControl) instance_create_layer(0, 0, "Control", oAudioControl)
if !instance_exists(oNavControl) instance_create_layer(0, 0, "Control", oNavControl)

// Delta Time
global.deltaActual = delta_time / 1000000
global.deltaMulti = global.deltaActual / global.deltaTarget

// Background Animation Delta
var _bg = layer_get_id("Background")
if layer_get_hspeed(_bg) != 0 or layer_get_vspeed(_bg) != 0 {
	layer_hspeed(_bg, 0.5 * global.deltaMulti)
	layer_vspeed(_bg, 0.5 * global.deltaMulti)
}