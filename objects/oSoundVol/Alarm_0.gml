// Inherit the parent event
event_inherited()

if !muted {
	previousValue = slider.value
	global.sfxVolume = 0
}
else global.sfxVolume = previousValue
muted = !muted