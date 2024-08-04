global.languages = []
global.languageIndex = 0
global.localeMap = ds_map_create()

var _defaultLocaleCode = "en"
var _defaultLocaleIndex = 0

var _nativeLocaleCode = os_get_language()
var _nativeLocaleIndex = 0

// Find the first file matching the naming convention
var _localeFileName = file_find_first("locale_*.json", 0)
if _localeFileName == "" {
	show_error("No locale files found!", 1)
	return
}
while _localeFileName != "" {
	
	show_debug_message("Loading locale file: " + _localeFileName)
	
	// Open file for reading
	var _localeFile = file_text_open_read(_localeFileName)
	if _localeFile == -1 {
		show_error("Error reading locale file " + _localeFileName, 1)	
	}
	
	// Build the JSON text
	var _jsonStr = ""
	var _j = 0
	while !file_text_eof(_localeFile) {
		_jsonStr += file_text_read_string(_localeFile)
		file_text_readln(_localeFile)
		_j++
	}
	file_text_close(_localeFile)
	show_debug_message("Loaded locale_map from " + string(_j) + " lines of text.")
	
	// Convert JASON to DS Map
	var _localeMap = json_decode(_jsonStr)

	if _localeMap == -1 or !ds_map_exists(_localeMap, "locale_code") {
		show_error("Invalid locale data inside: " + _localeFileName, 1)
		return
	}

	// Get the locale code from the locale data
	var _localeCode = _localeMap[? "locale_code"]
	ds_map_add(global.localeMap, _localeCode, _localeMap)
	
	// If this is the native locale, set the native locale index
	if _localeCode == _nativeLocaleCode _nativeLocaleIndex = global.languageIndex
	else if _localeCode == _defaultLocaleCode _defaultLocaleIndex = global.languageIndex
	
	// Add this locale code to the list of available locales
	global.languages[global.languageIndex] = _localeCode
	global.languageIndex++
	
	_localeFileName = file_find_next()
}
file_find_close()

// Set the default locale to the player's native locale if possible
if ds_map_exists(global.localeMap, _nativeLocaleCode) {
	show_debug_message("Setting locale to native language.")
	global.localeWords = global.localeMap[? _nativeLocaleCode]
	global.languageIndex = _nativeLocaleIndex
}
// Otherwise set to English
else if ds_map_exists(global.localeMap, _defaultLocaleCode) {
	show_debug_message("Setting locale to default language.")
	global.localeWords = global.localeMap[? _defaultLocaleCode]
	global.languageIndex = _defaultLocaleIndex
}
// If all else fails, use the first language on the stack
else {
	show_debug_message("Setting locale to fallback language.")
	global.languageIndex = 0
	global.localeWords = global.localeMap[? global.languages[0]]
}

show_debug_message("Locale set to " + global.languages[global.languageIndex])

