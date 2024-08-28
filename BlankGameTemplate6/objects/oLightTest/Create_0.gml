// Move around randomly
direction = random_range(0, 360)
speed = 3

hwidth = sprite_width / 2
hheight = sprite_height / 2

// Spawn Light
light = instance_create_layer(x, y, "Instances", oLight)

// Spawn Light
mouse_light = instance_create_layer(x, y, "Instances", oLight)