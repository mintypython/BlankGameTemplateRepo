// Inherit the parent event
event_inherited()

if !muted {
	previousValue = slider.value
	global.musicVolume = 0
}
else global.musicVolume = previousValue
muted = !muted