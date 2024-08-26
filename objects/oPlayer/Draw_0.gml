draw_self()

var _dir = point_direction(x, y, mouse_x, mouse_y)
var _dist = 300

var _col = raycast_tag_hit_point_2d(x, y, "solid", false, _dir, _dist)
if (_col.z != noone) {
	draw_circle(_col.x, _col.y, 4, true)
	var _dist = point_distance(x, y, _col.x, _col.y)
}
draw_line_vector(x, y, _dir, _dist)