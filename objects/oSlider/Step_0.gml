// Set the value to the difference of the mouse location to the origin which is Middle Left of the hitbox
if global.input == KBM {
	if input_check("leftclick") {
		var _buttonX = x + sprite_width * value
		var _buttonY = y
		var _buttonR = sprite_get_width(sSliderButton) / 2
		if point_in_circle(mouse_x, mouse_y, _buttonX, _buttonY, _buttonR) {
			selected = true
		}
	} else selected = false

	if selected {
		value = clamp((mouse_x - x) / sprite_width, 0, maxValue)
		if type == SLIDER_TYPE_MASTER {
			global.masterVolume = value
			owner.previousValue = value
		}
		else if type == SLIDER_TYPE_MUSIC {
			global.musicVolume = value
			owner.previousValue = value
		}
		else if type == SLIDER_TYPE_SOUND {
			global.sfxVolume = value
			owner.previousValue = value
		}
	}
}

// Controller Support
if global.input == CONTROLLER {
	if owner.selected {
		if type == SLIDER_TYPE_MASTER {
			global.masterVolume = value
			owner.previousValue = value
		}
		else if type == SLIDER_TYPE_MUSIC {
			global.musicVolume = value
			owner.previousValue = value
		}
		else if type == SLIDER_TYPE_SOUND {
			global.sfxVolume = value
			owner.previousValue = value
		}
	}	
}