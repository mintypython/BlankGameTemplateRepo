// Inherit the parent event
event_inherited()

if !muted {
	previousValue = slider.value
	global.musicVolume = 0
	slider.value = 0
}
else {
	slider.value = previousValue
	global.musicVolume = previousValue
}
muted = !muted