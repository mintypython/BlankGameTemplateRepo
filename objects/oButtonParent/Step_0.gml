// Top Left Origin
var _originX = x - (sprite_width / 2)
var _originY = y - (sprite_height / 2)

#region Mouse Controls
if global.input == 0 {
	if mouse_x > _originX and mouse_x < _originX + sprite_width 
		and mouse_y > _originY and mouse_y < _originY + sprite_height { // Mouse Enter Event Constant

	   // Raises the transparency when the cursor is hovering the button
		image_alpha = 1

		// Toggle hovering when hovering
		hovering = true

		// Play sound when hovering button
		if runOnce == false playSound(sndMenuHover)
		// Run only once flag
		runOnce = true

	} else { // Mouse Leave Event

	   // Resets the transparency when the cursor leaves the button
		image_alpha = MENU_BUTT_ALPHA

		// Toggle hovering and runOnce flag off when leaving
		hovering = false
		runOnce = false
	}

	// Mouse Clicking Effects
	if hovering and mouse_check_button_pressed(mb_left) {
		// Lower the position of the button slightly when it's clicked on
		y = ystart + 4

		// Start a timer for 10 frames that will reset the position of the button
		alarm[0] = 10

		// Play sound when clicking button
		playSound(sndMenuClick)
	}
}
#endregion

#region Controller Support
if global.input == 1 {
	if selected == 1 { // Selection Event Constant

	   // Raises the transparency when the button is selected
		image_alpha = 1
	
		// Toggle hovering when hovering
		hovering = true

		// Play sound when hovering button
		if runOnce == false playSound(sndMenuHover)
		// Run only once flag
		runOnce = true

	} else if selected == 0 { // Deselection Event Constant

	   // Resets the transparency when the controller selects something else
		image_alpha = MENU_BUTT_ALPHA

		// Toggle  off when leaving
		hovering = false
		runOnce = false
		selected = 0
	}
	
	// Controller A/X accept
	if hovering and input_check_pressed("accept") {
		// Lower the position of the button slightly when it's clicked on
		y = ystart + 4

		// Start a timer for 10 frames that will reset the position of the button
		alarm[0] = 10

		// Play sound when clicking button
		playSound(sndMenuClick)
	}
}
#endregion