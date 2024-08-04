// Inherit the parent event
event_inherited()

// Display this text on the button
buttonText = locale("music")

// Create sliders to the right
slider = instance_create_layer(x + (sprite_width / 2) + 32, y, "Instances", oSlider)
slider.value = global.musicVolume
slider.type = 1
slider.owner = id