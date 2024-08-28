// Inherit the parent event
event_inherited()

if !muted {
	previousValue = slider.value
	global.masterVolume = 0
}
else global.masterVolume = previousValue
muted = !muted