// Delta Time
var _dt = global.deltaMulti

// Go through room, appear on other side
if x > room_width + hwidth x = hwidth
if y > room_height + hheight y = hheight
if x < -hwidth x = room_width - hwidth
if y < -hheight y = room_height - hheight

// Movement
speed = 3 * _dt

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