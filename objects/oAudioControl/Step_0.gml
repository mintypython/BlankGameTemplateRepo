// Update master and music volumes
audio_master_gain(global.masterVolume)
if audio_group_is_loaded(agSoundFX) audio_group_set_gain(agSoundFX, global.sfxVolume, 1)
if audio_group_is_loaded(agMusic) {
	
	// Update music volume
	audio_group_set_gain(agMusic, global.musicVolume, 1)

	// Check if there music is not playing, then start background music
	if !audio_is_playing(playlist[randSong]) {
		audio_stop_sound(playlist[randSong])
		randSong = irandom_range(0, array_length(playlist) - 1)
		var _music = audio_play_sound(playlist[randSong], 1, false)
		audio_sound_gain(_music, global.musicVolume, 0)
	}
	
	/*
	// Pause music if it's still playing when game window is not in focus
	if !window_has_focus() and !audio_is_paused(playlist[randSong]) {
		audio_pause_sound(playlist[randSong])
	}
	
	// Resume music once the window is selected again 
	if window_has_focus() and audio_is_paused(playlist[randSong]) {
		audio_resume_sound(playlist[randSong])
	}*/
	
}