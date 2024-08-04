function drawCenterText(x, y, _str) {

	// Set text alignment to be centered in the middle of the object
	draw_set_halign(fa_center) 
	draw_set_valign(fa_middle)

	// Draw the text at the objects origin (which is set to be centered)
	draw_text(x, y, _str)

	// Reset the text alignment for other Draw Events
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_alpha(1)
	
}