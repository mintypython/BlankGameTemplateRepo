#region Pause Function
pauseSurf = -1
pauseSurfBuffer = -1

// Game resolution
resW = global.width
resH = global.height
#endregion

#region Pause Menu
// Init macros
#macro MAIN	0
#macro SETTINGS 1
#macro TOTAL 2 // The last entry of the menu (always)

// Store key and values in a DS map
global.settings = ds_map_create()
#macro SET global.settings

ds_map_add(SET, "master", [round(global.masterVolume * 100), [0, 100]])
ds_map_add(SET, "music", [round(global.musicVolume * 100), [0, 100]])
ds_map_add(SET, "sound", [round(global.sfxVolume * 100), [0, 100]])
// Toggle: ds_map_add(SET, "toggle", [0, ["ON", "OFF"]]) [INDEX, [OPT1, OPT2, OPT3]]


// List of menu items
menu[MAIN][0] = locale("resume")
menu[MAIN][1] = locale("settings")
menu[MAIN][2] = locale("main_menu")

// Settings
menu[SETTINGS][0] = [locale("master_vol"), "master"]
menu[SETTINGS][1] = [locale("music_vol"), "music"]
menu[SETTINGS][2] = [locale("sound_vol"), "sound"]
menu[SETTINGS][3] = locale("back")

// Menu position
index = 0
prevIndex = index
subMenu = 0

menuX = room_width * 0.5 // X position of Menu
menuY = room_height * 0.4 // Y position of Menu
clickAreaW = 35 // Width of the clickable area

function button(_y, _wl, _wr, _h) constructor {
	y = _y // Selection position Y
	wl = _wl // Click area width, left side
	wr = _wr // Click area width, right side
	h = _h // Click area height
}

// Init button struct for each menu entry
var _h = 64 // Change by text font size

for (var _i = 0; _i < TOTAL; _i++) {
    for (var _j = 0; _j < array_length(menu[_i]); _j++) {
		buttonArray[_i][_j] = new button(0, room_width / 2, room_width / 2, _h)
	}
}
#endregion