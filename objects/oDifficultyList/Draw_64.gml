// Inherit the parent event
event_inherited()

// Show current difficulty to the right of the button.
if !instance_exists(oDifficultyItem) {
	if global.difficulty == DIFFICULTY_EASY scribble_draw_text_ext(x + (sprite_width / 2) + 32, ystart, locale("easy"), MENU_LIST_SCALE, c_white, noone, fa_left)
	if global.difficulty == DIFFICULTY_NORM scribble_draw_text_ext(x + (sprite_width / 2) + 32, ystart, locale("normal"), MENU_LIST_SCALE, c_white, noone, fa_left)
	if global.difficulty == DIFFICULTY_HARD scribble_draw_text_ext(x + (sprite_width / 2) + 32, ystart, locale("hard"), MENU_LIST_SCALE, c_white, noone, fa_left)
}