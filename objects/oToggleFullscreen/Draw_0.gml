// Inherit the parent event
event_inherited();

// Draw ON and OFF in different transparencies for fullscreen toggle
draw_set_font(global.A26)

if global.fullscreen == 1 { // Fullscreen ON
	draw_set_alpha(1)
	drawCenterText(x + (sprite_width / 2) + 64, ystart, locale("on"))
	draw_set_alpha(0.6)
	drawCenterText(x + (sprite_width / 2) + 128, ystart, locale("off"))
}
else if global.fullscreen == 0 { // Fullscreen OFF
	draw_set_alpha(0.6)
	drawCenterText(x + (sprite_width / 2) + 64, ystart, locale("on"))
	draw_set_alpha(1)
	drawCenterText(x + (sprite_width / 2) + 128, ystart, locale("off"))
}
