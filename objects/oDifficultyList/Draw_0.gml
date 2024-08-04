// Draw itself
draw_self() 

// Choose font
draw_set_font(global.A40) 

// Draw the centered text at the objects origin
drawCenterText(x, y, buttonText)

// Show current difficulty
if !instance_exists(oDifficultyItem) {
	draw_set_font(global.A24)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	if global.difficulty == 0 draw_text(x + (sprite_width / 2) + 32, ystart, locale("easy"))
	if global.difficulty == 1 draw_text(x + (sprite_width / 2) + 32, ystart, locale("normal"))
	if global.difficulty == 2 draw_text(x + (sprite_width / 2) + 32, ystart, locale("hard"))
}