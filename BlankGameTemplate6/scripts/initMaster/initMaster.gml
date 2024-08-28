// Target Controls
#macro DEV_MODE 0
#macro Dev:DEV_MODE 1
#macro DEMO_MODE 0
#macro Demo:DEMO_MODE 1

// Audio
#macro MASTER_VOL 0.7
#macro MUSIC_VOL 0.25
#macro SOUND_VOL 0.9
#macro Dev:MASTER_VOL 1.0
#macro Dev:MUSIC_VOL 0.0
#macro Dev:SOUND_VOL 0.0

// Display
#macro SCREEN_W display_get_width()
#macro SCREEN_H display_get_height()
#macro WINDOW_W window_get_width()
#macro WINDOW_H window_get_height()
#macro FRAMERATE display_get_frequency()
#macro BASE_W 1920
#macro BASE_H 1080
#macro VIEW view_camera[0]
#macro VIEW_W camera_get_view_width(VIEW)
#macro VIEW_H camera_get_view_height(VIEW)
#macro VIEW_X camera_get_view_x(VIEW)
#macro VIEW_Y camera_get_view_y(VIEW)

// GUI
#macro MENU_BUTTON_ALPHA 0.8

// Font
#macro DEFAULT_FONT "fUbuntu"
#macro MENU_TITLE_SCALE 0.45
#macro MENU_SUBTITLE_SCALE 0.30
#macro MENU_BUTTON_SCALE 0.25
#macro MENU_LIST_SCALE 0.2
#macro MENU_SMALL_SCALE 0.12

// Saving
global.saveDir = game_save_id

// Delta Time
global.deltaTarget = 1 / FRAMERATE
global.deltaActual = delta_time / 1000000
global.deltaMulti = global.deltaActual / global.deltaTarget
game_set_speed(FRAMERATE, gamespeed_fps)
global.gamespeed = game_get_speed(gamespeed_fps)

// Video
global.width = SCREEN_W
global.height = SCREEN_H

// Sounds are loaded in the Creation Event of the Main Menu Room on Boot
global.sfxLoaded = false
global.musicLoaded = false

// Audio
global.masterVolume = MASTER_VOL
global.sfxVolume = SOUND_VOL
global.musicVolume = MUSIC_VOL

// Video
global.fullscreen = 1
global.resolution = 5

// Difficulty (Easy = 0, Normal = 1, Hard = 2)
global.difficulty = 1

// Player profiles (First = 0, Second = 1, Third = 2) [NOT IN USE]
global.profile = 0

// Pausing
global.pause = 0

// Switching between KBM and controller (KBM = 0, Controller = 1)
global.input = 1

// Debug Views
global.debugViewGame = 0