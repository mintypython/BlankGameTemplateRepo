#region Controller Support
if global.input == 1 {
	if selected == 1 { // Selection Event Constant

	   // Raises the transparency when the button is selected
		image_alpha = 1

		// Play sound when hovering button
		if runOnce == 0 playSound(sndMenuHover)
		// Run only once flag
		runOnce = 1

	} else if selected == 0 { // Deselection Event Constant

	   // Resets the transparency when the controller selects something else
		image_alpha = MENU_BUTTON_ALPHA

		// Toggle  off when leaving
		runOnce = 0
		selected = 0
	}

	// Controller A/X accept
	if hovering and input_check_pressed("accept") {
		// Lower the position of the button slightly when it's clicked on
		y = ystart + 4

		// Play sound when selecting button
		playSound(sndMenuClick)
	}
}
#endregion