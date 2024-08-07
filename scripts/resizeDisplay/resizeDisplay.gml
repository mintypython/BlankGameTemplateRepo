function resizeDisplay() {
	// Set the resolution to display, or get this value from the device
	var _displayWidth = global.width
	var _displayHeight = global.height

	// Set the size of GUI
	display_set_gui_size(_displayWidth, _displayHeight)

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