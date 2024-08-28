// Inherit the parent event
event_inherited()

// Destroy all submenu items 
if instance_exists(oLanguageItem) {
	with (oLanguageItem) {
		instance_destroy()
	}
} else {   
    // Create resolution buttons
    var _yIncrement = sprite_get_height(sButtonThin)
    var _yy = y - _yIncrement * 2
    for (var _i = 0; _i < array_length(langList); _i++) {
        item = instance_create_layer(x, _yy, "Instances", oLanguageItem)
        item.buttonText = langList[_i] // Used to pull the string
		item.position = _i // Used to pull the value
        item.owner = id // Used to pull the originating button ID
		array_push(items, item.id)
        _yy -= _yIncrement + 2
    }
}