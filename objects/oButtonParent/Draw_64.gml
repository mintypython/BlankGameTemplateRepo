// Draw itself
draw_self() 

scribble_draw_text_ext(x, y, buttonText, MENU_BUTTON_SCALE, c_white, sButton)

if DEV_MODE {
	draw_set_color(DEBUG_COLOR)
	draw_text(x + 32, y + 32, "selected: " + string(selected))
	draw_set_color(c_white)
}