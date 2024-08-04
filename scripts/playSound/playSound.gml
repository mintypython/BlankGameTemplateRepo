/// @param {real} sound		The sound to play
/// @description			Play a sound
function playSound(sound) {
	if (global.sfxLoaded == true) {
		var _vol = audio_play_sound(sound, 1, false)
		audio_sound_gain(_vol, global.sfxVolume, 1)
	}
}