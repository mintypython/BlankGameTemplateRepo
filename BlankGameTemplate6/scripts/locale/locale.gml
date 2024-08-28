// Return the locale string for a given key

function locale(_key) {
	if ds_map_exists(global.localeWords, _key) {
		return ds_map_find_value(global.localeWords, _key)	
	} else {
		return "!ERROR!"	
	}
}