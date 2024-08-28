// Inherit the parent event
event_inherited()

// Destroy all submenu items 
if instance_exists(oDifficultyItem) {
	with (oDifficultyItem) {
		instance_destroy()
	}
} else {   
    // Create resolution buttons
    var _xIncrement = sprite_get_width(sButton)
    var _xx = x + _xIncrement + 6
    for (var _i = 0; _i < array_length(diffList); _i++) {
        var _item = instance_create_layer(_xx, y, "Instances", oDifficultyItem)
        _item.buttonText = diffList[_i] // Used to pull the string
		_item.position = _i // Used to pull the value
        _item.owner = id // This is the link between this menu item and the menu button
		array_push(items, _item.id)
        _xx += _xIncrement + 6
    }
}