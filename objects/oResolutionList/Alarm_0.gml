// Inherit the parent event
event_inherited()

// Destroy all submenu items 
if instance_exists(oResolutionItem) {
	with (oResolutionItem) {
		instance_destroy()
	}
} else {   
    // Create resolution buttons
    var _yIncrement = sprite_get_height(sButtonThin)
    var _yy = y - _yIncrement * 2
    for (var _i = 0; _i < array_length(resList); _i++) {
        item = instance_create_layer(x, _yy, "Instances", oResolutionItem)
        item.buttonText = resList[_i] // Used to pull the string
		item.position = _i // Used to pull the value
        item.owner = id // Used to pull the originating button ID
		array_push(items, item.id)
        _yy -= _yIncrement + 2
    }
}