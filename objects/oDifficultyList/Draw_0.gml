// Draw itself
draw_self() 

// Draw the centered text at the objects origin
scribble_draw_text_ext(x, y, buttonText, MENU_BUTTON_SCALE, c_white, sButton)

// Show current difficulty
if !instance_exists(oDifficultyItem) {
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	if global.difficulty == 0 draw_text(x + (sprite_width / 2) + 32, ystart, locale("easy"))
	if global.difficulty == 1 draw_text(x + (sprite_width / 2) + 32, ystart, locale("normal"))
	if global.difficulty == 2 draw_text(x + (sprite_width / 2) + 32, ystart, locale("hard"))
}