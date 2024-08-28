// Inherit the parent event
event_inherited()

// Display this text on the button
buttonText = locale("master")

// Create sliders to the right
slider = instance_create_layer(x + (sprite_width / 2) + 32, y, "Instances", oSlider)
slider.value = global.masterVolume
slider.type = SLIDER_TYPE_MASTER
slider.owner = id

// Default selection for controller navigation
controllerHovered = true
controllerHoveredBase = true

// Muting
muted = false
previousValue = slider.value