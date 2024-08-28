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