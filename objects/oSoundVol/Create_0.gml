// Inherit the parent event
event_inherited()

// Display this text on the button
buttonText = locale("sound")

// Create sliders to the right
slider = instance_create_layer(x + (sprite_width / 2) + 32, y, "Instances", oSlider)
slider.value = global.sfxVolume
slider.type = SLIDER_TYPE_SOUND
slider.owner = id

// Muting
muted = false
previousValue = slider.value