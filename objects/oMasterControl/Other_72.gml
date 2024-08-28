#region Music Control
// Check to see if audio groups are loaded and if so, allow sounds to be played 
// Sounds are loaded in the Creation Event of the Main Menu Room
if audio_group_is_loaded(agMusic) global.musicLoaded = true
if audio_group_is_loaded(agSoundFX) global.sfxLoaded = true
#endregion

