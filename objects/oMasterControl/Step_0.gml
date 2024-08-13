// Create these objects if they do not exist
if !instance_exists(oDebugControl) instance_create_layer(0, 0, "Control", oDebugControl)
if !instance_exists(oAudioControl) instance_create_layer(0, 0, "Control", oAudioControl)
if !instance_exists(oNavControl) instance_create_layer(0, 0, "Control", oNavControl)