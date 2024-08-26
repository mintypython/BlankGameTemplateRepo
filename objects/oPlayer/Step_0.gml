// Delta Time
var _dt = global.deltaMulti

// Input
right = input_check("moveRight")
left = input_check("moveLeft")
up = input_check("moveUp")
down = input_check("moveDown")

// Input Direction Keyboard
hInput = right - left
vInput = down - up

// Input Direction Controller


// Delta Time Updates
moveSpeedAccel = moveSpeedAccelBase * _dt
moveSpeedFrict = moveSpeedFrictBase * _dt
moveSpeedMax = moveSpeedBase * _dt

// Horizontal Calculation
if abs(hInput) {
	hSpeed += hInput * moveSpeedAccel // Accelerate
} else {
	hSpeed = approach(hSpeed, 0, moveSpeedFrict) // Decelerate
}

// Vertical Calculation
if abs(vInput) {
	vSpeed += vInput * moveSpeedAccel // Accelerate
} else {
	vSpeed = approach(vSpeed, 0, moveSpeedFrict) // Decelerate
}

// Horizontal and Vertical Speed Limits
hSpeed = clamp(hSpeed, -moveSpeedMax, moveSpeedMax)
vSpeed = clamp(vSpeed, -moveSpeedMax, moveSpeedMax)

// New Collisions
var _col = move_and_collide_simple_tag(hSpeed, vSpeed, "solid")
if (_col.z != noone) {
	if _col.x hSpeed = 0
	if _col.y vsp = 0
}

/*/ Old Collision
// Horizontal Collision
repeat(abs(xspd)) {
	if place_meeting(x + sign(xspd), y, oWall) {
		xspd = 0
		break
	}
x += sign(xspd)
}

// Vertical Collision
repeat(abs(yspd)) {
	if place_meeting(x, y + sign(yspd), oWall) {
		yspd = 0
		break
	}
y += sign(yspd)
}*/