// Inherit the parent event
event_inherited()

if !muted {
	previousValue = slider.value
	global.sfxVolume = 0
	slider.value = 0
}
else {
	slider.value = previousValue
	global.sfxVolume = previousValue
}
muted = !muted