// Top Left Origin
var _originX = x - (sprite_width / 2)
var _originY = y - (sprite_height / 2)

#region Mouse Controls
if global.input == KBM {
	if mouse_x > _originX 
		and mouse_x < _originX + sprite_width 
		and mouse_y > _originY 
		and mouse_y < _originY + sprite_height { // Mouse Enter Event Constant

	   // Raises the transparency when the cursor is mouseHovered the button
		image_alpha = 1

		// Toggle mouseHovered when mouseHovered
		mouseHovered = true

		// Play sound when mouseHovered button
		if runOnce == false playSound(sndMenuHover)
		// Run only once flag
		runOnce = true

	} else { // Mouse Leave Event

	   // Resets the transparency when the cursor leaves the button
		image_alpha = MENU_BUTTON_ALPHA

		// Toggle mouseHovered and runOnce flag off when leaving
		mouseHovered = false
		runOnce = false
	}

	// Mouse Clicking Effects
	if mouseHovered and input_check_pressed("leftclick") {
		// Lower the position of the button slightly when it's clicked on
		y = ystart + 4

		// Start a timer for 10 frames that will reset the position of the button and run it's purpose.
		alarm[0] = 10

		// Play sound when clicking button
		playSound(sndMenuClick)
	}
}
#endregion

#region Controller Support
if global.input == CONTROLLER {
	if controllerHovered == true { // Selection Event Constant

	   // Raises the transparency when the button is controllerHovered
		image_alpha = 1
	
		// Toggle mouseHovered when mouseHovered
		controllerHovered = true

		// Play sound when mouseHovered button
		if runOnce == false playSound(sndMenuHover)
		// Run only once flag
		runOnce = true

	} else if controllerHovered == false { // Deselection Event Constant

	   // Resets the transparency when the controller selects something else
		image_alpha = MENU_BUTTON_ALPHA

		// Toggle  off when leaving
		controllerHovered = false
		runOnce = false
	}
	
	// Controller A accept
	if controllerHovered and input_check_pressed("accept") {
		// Lower the position of the button slightly when it's clicked on
		y = ystart + 4

		// Start a timer for 10 frames that will reset the position of the button and run its' action
		alarm[0] = 10

		// Play sound when clicking button
		playSound(sndMenuClick)
	}
}
#endregion