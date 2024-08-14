global.gamespeed = game_get_speed(gamespeed_fps)

show_debug_overlay(0)

dbg_view("Debugger", false, 10, 30, 320, 380)
	dbg_section("Globals", true)
		dbg_text_input(ref_create(global, "languageIndex"), "Locale: ", "r")
		dbg_slider(ref_create(global, "masterVolume"), 0, 1, "Master Volume: ", 0.01)
		dbg_slider(ref_create(global, "musicVolume"), 0, 1, "Music Volume: ", 0.01)
		dbg_slider(ref_create(global, "sfxVolume"), 0, 1, "SFX Volume: ", 0.01)
		dbg_text_input(ref_create(global, "fullscreen"), "Fullscreen: ", "r")
		dbg_drop_down(ref_create(global, "difficulty"), "Easy, Normal, Hard", "Difficulty")
		dbg_text_input(ref_create(global, "input"), "Input: ", "r")
	dbg_section("Delta", true)
		dbg_text_input(ref_create(global, "deltaTarget"), "Target: ", "r")
		dbg_text_input(ref_create(global, "deltaActual"), "Actual: ", "r")
		dbg_text_input(ref_create(global, "deltaMulti"), "Multiplier: ", "r")
	dbg_section("Game", true)
		dbg_slider(ref_create(global, "gamespeed"), 0, 144, "Gamespeed: ", 1)
		save = function() {saveGame()}
		dbg_button("Save", save, 40, 20)
		dbg_same_line()
		load = function() {loadGame()}
		dbg_button("Load", load, 40, 20)
		dbg_same_line()
		quit = function() {game_end()}
		dbg_button("Quit", quit, 40, 20)