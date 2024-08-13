function saveGame() {
	
	var _struct =
	{
		profile: global.profile,
		locale: global.languageIndex,
		masterVol: global.masterVolume,
		musicVol: global.musicVolume,
		soundVol: global.sfxVolume,
		resolution: global.resolution,
		fullscreen: global.fullscreen,
		difficulty: global.difficulty,
		controls: input_player_export(),
	}
	
	var _string = json_stringify(_struct)
	var _file = file_text_open_write("game.save")
	file_text_write_string(_file, _string)
	file_text_close(_file)
	
	// Show saving
	if (!instance_exists(oSaving)) instance_create_layer(room_width - (sprite_get_width(sSaving) * 1.5), sprite_get_height(sSaving), "Control", oSaving)
}

function loadGame() {
	if file_exists("game.save") {
		var _file = file_text_open_read("game.save")
		var _json = file_text_read_string(_file)
		var _struct = json_parse(_json)

		global.profile = _struct.profile
		global.languageIndex = _struct.locale
		global.masterVolume = _struct.masterVol
		global.musicVolume = _struct.musicVol
		global.sfxVolume = _struct.soundVol
		global.resolution = _struct.resolution
		global.fullscreen = _struct.fullscreen
		global.difficulty = _struct.difficulty
		input_player_import(_struct.controls)
		
		file_text_close(_file)
		
		// Update video settings after load
		updateVideo()
		
		// Update language settings after load
		loadLang(global.languageIndex)
	}
}