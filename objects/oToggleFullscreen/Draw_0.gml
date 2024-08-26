// Inherit the parent event
event_inherited();

// Draw ON and OFF in different transparencies for fullscreen toggle
if global.fullscreen == 1 { // Fullscreen ON
	draw_set_alpha(1)
	scribble_draw_text_ext(x + (sprite_width / 2) + 64, ystart, locale("on"), MENU_SMALL_SCALE)
	draw_set_alpha(0.6)
	scribble_draw_text_ext(x + (sprite_width / 2) + 128, ystart, locale("off"), MENU_SMALL_SCALE)
}
else if global.fullscreen == 0 { // Fullscreen OFF
	draw_set_alpha(0.6)
	scribble_draw_text_ext(x + (sprite_width / 2) + 64, ystart, locale("on"), MENU_SMALL_SCALE)
	draw_set_alpha(1)
	scribble_draw_text_ext(x + (sprite_width / 2) + 128, ystart, locale("off"), MENU_SMALL_SCALE)
}
