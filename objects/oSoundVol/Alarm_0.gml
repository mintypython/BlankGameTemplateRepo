// Inherit the parent event
event_inherited()

if !muted {
	previousValue = slider.value
	slider.value = 0
}
else {
	slider.value = previousValue
}
muted = !muted