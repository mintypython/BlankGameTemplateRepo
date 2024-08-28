if (global.pause == 1) {

	// Dim the screen
	draw_set_color(c_black)
	draw_set_alpha(0.25)
	draw_rectangle(0, 0, global.width, global.height, false)
	draw_set_color(c_white)
	
	// Pause Menu Title Font
	draw_set_alpha(1)
	scribble_draw_text_ext(global.width / 2, global.height / 3, locale("paused"), MENU_SUBTITLE_SCALE)

	#region Pause Menu
	// Line spacing
	var _space = 64

	// Draw menu items
	var _size = array_length(menu[subMenu])

	for (var _i = 0; _i < _size; _i++) {
		// Reset color
		if _i == index var _col = c_white else _col = c_gray
	
		// Selectable or Plain Text?
		if is_array(menu[subMenu][_i]) {
	
			// Store menu array
			var _menuArray = menu[subMenu][_i]
		
			// Get map array
			var _mapArray = SET[? _menuArray[1]]
		
			// Get the limit/choices array
			var _limitArray = _mapArray[1]
		
			// Show integer or text?
			var _str1 = _menuArray[0]
			if is_real(_limitArray[0]) {
				// Integer
				var _str2 = string(_mapArray[0])
			} else {
				// String
				var _str2 = _limitArray[_mapArray[0]]
			}
		} else {
			// Draw string
			var _str1 = menu[subMenu][_i]
			var _str2 = ""
		}
		// Set up Y position and text width
		// Get struct for menu item
		var _struct = buttonArray[subMenu][_i]
		_struct.y = menuY + _space * _i
	
		// Set widths if on array
		if _str2 = "" {
			_struct.wl = string_width(_str1) / 2
			_struct.wr = string_width(_str1) / 2
		} else {
			_struct.wl = string_width(_str1 + " ")
			_struct.wr = string_width(_str2 + " ")
		}
	
		// Is mouse hovering over menu entry?
		var _hoveringText = 0
		// Control the menu?
		if mouse_y >= menuY and mouse_y <= menuY + _space * _size and global.input == KBM {
			// Check which item is hovered
			if mouse_y > _struct.y and mouse_y < _struct.y + _struct.h {
				// Check X position
				if mouse_x > menuX - _struct.wl and mouse_x < menuX + _struct.wr {
					_col = c_white
					_hoveringText = 1
				}
			}
		}
		// Current index? Highlight it
		if index == _i _col = c_white
	
		// Update index with mouse position if this is the selected text
		if _col = c_white {
			
			// Update index
			prevIndex = index
			index = _i
			if prevIndex != index playSound(sndMenuHover)
			
			// Check left click pressed once or held
			var _leftclick = input_check_pressed("leftclick")
			var _leftclickHeld = input_check_long("leftclick")
			if _leftclickHeld _leftclick = 1
			
			// Clicking and over text? 
			if  _hoveringText and _leftclick {
				// Set menu select true
				var _select = 1
				var _hmove = 0
				// If menu is array, allow movement
				if is_array(menu[subMenu][_i]) {
					// Incr array depending on click location
					if mouse_x < menuX - _struct.wl + clickAreaW _hmove = -1
					else if mouse_x > menuX - clickAreaW and mouse_x < menuX _hmove = 1
				}
				processMenu(_select, _hmove)
			
				// Update size in a new submenu
				_size = array_length(menu[subMenu])
			}
		}
		// Draw text
		if _str2 == "" {
			// Simple entry
			draw_set_halign(fa_center)
			draw_text_color(menuX, menuY + _space * _i, _str1 + " ", _col, _col, _col, _col, 1)
		} else {
			// Array entry
			draw_set_halign(fa_right)
			draw_text_color(menuX, menuY + _space * _i, _str1 + " ", _col, _col, _col, _col, 1)
			draw_set_halign(fa_left)
			draw_text_color(menuX, menuY + _space * _i, " " + _str2, _col, _col, _col, _col, 1)
		}
	}
	#endregion
}