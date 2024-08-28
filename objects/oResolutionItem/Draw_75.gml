if DEV_MODE {
	var _tw = string_width("controllerHovered: " + string(controllerHovered))
	var _th = string_height("controllerHovered: " + string(controllerHovered))
	var _x = x + sprite_width / 2
	var _y = y + sprite_height / 2
	draw_set_color(c_black)
	draw_rectangle(_x, _y, _x + _tw, _y + _th, false)
	if controllerHovered draw_set_color(DEBUG_COLOR)
	else draw_set_color(c_white)
	draw_text(_x, _y, "controllerHovered: " + string(controllerHovered))
	draw_set_color(c_white)
}