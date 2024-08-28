// Draw itself
draw_self()

// Draw part of the colored sprite to show value, and draw the button at the current location
draw_sprite_part(
	sprite_index, 
	1, 
	0, 
	0, 
	sprite_width * value, 
	sprite_height, 
	x, 
	y - sprite_get_yoffset(sprite_index)
)
draw_sprite(sSliderButton, 0, x + sprite_width * value, y)

if DEV_MODE {
	var _tw = string_width("mouseSelected: " + string(mouseSelected))
	var _th = string_height("mouseSelected: " + string(mouseSelected))
	var _x = x + sprite_width / 2
	var _y = y + sprite_height / 2
	draw_set_color(c_black)
	draw_rectangle(_x, _y, _x + _tw, _y + _th, false)
	if mouseSelected draw_set_color(DEBUG_COLOR)
	else draw_set_color(c_white)
	draw_text(_x, _y, "mouseSelected: " + string(mouseSelected))
	draw_set_color(c_white)
}