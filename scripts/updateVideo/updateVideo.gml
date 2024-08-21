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
	resizeDisplay()
}
