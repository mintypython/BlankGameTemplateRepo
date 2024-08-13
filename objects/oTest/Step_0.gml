// Go through room, appear on other side
if x > room_width + hwidth x = hwidth
if y > room_height + hheight y = hheight
if x < -hwidth x = room_width - hwidth
if y < -hheight y = room_height - hheight

// Rotate
image_angle += 3

// Light
light.x = x
light.y = y
light.color = c_green
light.size = 256

// Light
mouse_light.x = mouse_x
mouse_light.y = mouse_y
mouse_light.color = c_white
mouse_light.size = 256