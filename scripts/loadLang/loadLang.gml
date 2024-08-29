// Shift to the next available locale language

function loadLang(_pos) {
	global.languageIndex = _pos
	if global.languageIndex >= array_length(global.languages) {
		global.languageIndex = 0
	}
	
	global.localeWords = ds_map_find_value(global.localeMap, global.languages[global.languageIndex])
	show_debug_message("Language is now " + global.languages[global.languageIndex])
}