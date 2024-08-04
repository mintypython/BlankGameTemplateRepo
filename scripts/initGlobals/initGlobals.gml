// Initialize global variables

// Camera
global.width = display_get_width()
global.height = display_get_height()
global.view_width = camera_get_view_width(view_camera[0])
global.view_height = camera_get_view_height(view_camera[0])
display_set_gui_size(global.view_width, global.view_height)

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

// Player profiles (First = 0, Second = 1, Third = 2)
global.profile = 0

// Controls
global.up = ord("W")
global.left = ord("A")
global.down = ord("S")
global.right = ord("D")

// Pausing
global.pause = 0

// Switching between KBM and controller (KBM = 0, Controller = 1)
global.input = 1

// Fonts
global.A60 = font_add("ArialUni.ttf", 60, 0, 0, 0, 255)
global.A40 = font_add("ArialUni.ttf", 40, 0, 0, 0, 255)
global.A30 = font_add("ArialUni.ttf", 30, 0, 0, 0, 255)
global.A26 = font_add("ArialUni.ttf", 26, 0, 0, 0, 255)
global.A24 = font_add("ArialUni.ttf", 24, 0, 0, 0, 255)
global.A20 = font_add("ArialUni.ttf", 20, 0, 0, 0, 255)
global.A11 = font_add("ArialUni.ttf", 11, 0, 0, 0, 255)