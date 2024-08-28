// Set the value to the difference of the mouse location to the origin which is Middle Left of the hitbox
if global.input == 0 {
	if input_check("leftclick") {
		var _buttonX = x + sprite_width * value
		var _buttonY = y
		var _buttonR = sprite_get_width(sSliderButton) / 2
		if point_in_circle(mouse_x, mouse_y, _buttonX, _buttonY, _buttonR) selected = true
	}

	// If there is no mouse input on the slider, it is not selected
	if !input_check("leftclick") selected = 0

	if selected {
		value = clamp((mouse_x - x) / sprite_width, 0, maxValue)
		if type == 0 global.masterVolume = value
		else if type == 1 global.musicVolume = value
		else if type == 2 global.sfxVolume = value
	}
}

// Controller Support
if global.input == 1 {
	if owner.selected {
		if type == 0 global.masterVolume = value
		else if type == 1 global.musicVolume = value
		else if type == 2 global.sfxVolume = value
	}	
}