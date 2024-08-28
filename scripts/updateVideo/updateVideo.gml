function updateVideo() {
	var _width, _height
	switch (global.resolution) {
		case 0:
		_width = 800
		_height = 480
		break
	
		case 1:
		_width = 1024
		_height = 768
		break
	
		case 2:
		_width = 1280
		_height = 720
		break
	
		case 3:
		_width = 1366
		_height = 768
		break
	
		case 4:
		_width = 1600
		_height = 900
		break
	
		case 5:
		_width = 1920
		_height = 1080
		break
	}

	global.width = _width
	global.height = _height
	if global.fullscreen == 0 window_set_fullscreen(false)
	else if global.fullscreen == 1 window_set_fullscreen(true)
	
	// Set the resolution to display, or get this value from the device
	var _displayWidth = global.width
	var _displayHeight = global.height

	// Set the size of GUI
	// display_set_gui_size(_displayWidth, _displayHeight)

	// Set the size of the game window
	window_set_size(_displayWidth, _displayHeight)

	// Set the resolution
	var _baseWidth = 1920
	var _baseHeight = 1080

	// Determine aspect ratio
	var _aspect = _baseWidth / _baseHeight

	// Work out the adjusted height and width
	if (_displayWidth >= _displayHeight) {
		var _height = min(_baseHeight, _displayHeight)
		var _width = _height * _aspect
	}

	// Resize application surface
	surface_resize(application_surface, _width, _height)
}