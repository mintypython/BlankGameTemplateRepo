// Set the value to the difference of the mouse location to the origin which is Middle Left of the hitbox
if global.input == KBM {
	var _tempValue = 0
	if input_check_pressed("leftclick") _tempValue = value
	if input_check("leftclick") {
		var _buttonX = x + sprite_width * value
		var _buttonY = y
		var _buttonR = sprite_get_width(sSliderButton) / 2
		if position_meeting(mouse_x, mouse_y, id) {
			mouseSelected = true
		}
	} else mouseSelected = false

	if mouseSelected {
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
	if input_check_released("leftclick") and value == 0 { // Set previous value to before the dragging started, if you drag to 0.
		owner.previousValue = _tempValue
	}
}

// Controller Support
if global.input == CONTROLLER {
	if owner.controllerHovered {
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

if value > 0 owner.muted = false
else if value == 0 owner.muted = true