// Inherit the parent event
event_inherited()

if !muted {
	previousValue = slider.value
	global.masterVolume = 0
	slider.value = 0
}
else {
	slider.value = previousValue
	global.masterVolume = previousValue
}
muted = !muted