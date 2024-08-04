#region Pause Menu
if (global.pause == 1) {
	// Navigation
	var _up = input_check_pressed("up")
	var _down = input_check_pressed("down")
	var _left = input_check_pressed("left")
	var _right = input_check_pressed("right")
	var _accept = input_check_pressed("accept")
	// Held down
	var _leftHeld = input_check_long("left")
	var _rightHeld = input_check_long("right")
	if _leftHeld _left = 1
	else if _rightHeld _right = 1

	// Check if we are moving down (+1) or Up (-1)
	var _move = _down - _up

	// Check if we are moving Right (+1) or Left (-1)
	var _hmove = _right - _left

	if _move != 0 { // Up or Down pressed
		// Move the index
		prevIndex = index
		index += _move
		if prevIndex != index playSound(sndMenuHover)
	
		// Clamp inside the array
		var _size = array_length(menu[subMenu])
		if index < 0 index = _size - 1 // At start, loop to menu end
		else if index >= _size index = 0 // At end, loop to menu start
	}

	function processMenu(_select, _hmove) {
		if _select or (is_array(menu[subMenu][index]) and _hmove != 0) {
			// Play sound when clicked on
			playSound(sndMenuClick)
			switch (subMenu) {
				case MAIN:
					switch (index) {
						case 0: // Resume
							global.pause = 0
							instance_activate_all()
							if (surface_exists(pauseSurf)) surface_free(pauseSurf)
							if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer)
						break
						case 1: // Settings
							subMenu = SETTINGS
							index = 0
						break
						case 2: // Main Menu
							global.pause = 0
							room_goto(rMainMenu)
						break
					}
				break
				case SETTINGS:
					switch (index) {
						case 0: // Master Volume
							global.masterVolume = changePauseMenu(_hmove, "master")
						break
						case 1: // Music Volume
							global.musicVolume = changePauseMenu(_hmove, "music")
						break
						case 2: // SFX Volume
							global.sfxVolume = changePauseMenu(_hmove, "sound")
						break
						case 3: // Back
							subMenu = MAIN
							index = 0
							saveGame()
						break
					}
				break
			}
		}	
		// If the user presses the back button (CONTROLLER) go to previous menu or end the pause menu.
		if input_check_pressed("back") {
			if subMenu == SETTINGS {
				subMenu = MAIN
				index = 0
				saveGame()
			}
			else if subMenu == MAIN {
				global.pause = 0
				instance_activate_all()
				if (surface_exists(pauseSurf)) surface_free(pauseSurf)
				if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer)
			}
		}
	}
	processMenu(_accept, _hmove)
}
#endregion