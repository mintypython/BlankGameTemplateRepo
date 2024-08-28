function scribble_draw_text_ext(x, y, _str, _scale, _color = c_white, _buttonSprite = noone) {
	var _text = scribble(_str)
		_text.starting_format(DEFAULT_FONT, _color)
		_text.align(fa_center, fa_middle)
		
		if _buttonSprite != noone {
			var _wButton = sprite_get_width(_buttonSprite)
			var _hButton = sprite_get_height(_buttonSprite)
			//draw_sprite_stretched_ext(_buttonSprite, 0, x-(_wButton/2), y-(_hButton/2), _wButton, _hButton, c_white, 1)
		}
		
		_text.scale(_scale)
		_text.draw(x, y)
}