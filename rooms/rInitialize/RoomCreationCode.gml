// Set GAME SPEED to monitor HZ
game_set_speed(FRAMERATE, gamespeed_fps)

// Load audio group for sound effects and music
audio_group_load(agSoundFX)
audio_group_load(agMusic)

// Load Previous Game Data
loadGame()