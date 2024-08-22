right = input_check("moveRight")
left = input_check("moveLeft")
up = input_check("moveUp")
down = input_check("moveDown")

xspd = (right - left) * spd
yspd = (down - up) * spd

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
}