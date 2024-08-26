// Inherit the parent event
event_inherited();

// Pull the icon
var _binding = input_binding_get(action, 0, 0)
var _icon = input_binding_get_icon(_binding)

// Draw input icon
if !is_string(_icon) draw_sprite(_icon, 0, x + (sprite_width / 2) + (sprite_get_width(_icon) * 0.4), ystart - (sprite_height / 2))

// Alert to remap button
if input_binding_scan_in_progress() {
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	draw_rectangle(room_width * 0.33, room_height * 0.33, room_width - (room_width * 0.33), room_height - (room_height * 0.33), 0)
	draw_set_color(c_white)

	draw_set_alpha(1)
	draw_rectangle(room_width * 0.33, room_height * 0.33, room_width - (room_width * 0.33), room_height - (room_height * 0.33), 1)
	
	scribble_draw_text_ext(room_width / 2, room_height / 2, "Select new input...", MENU_LIST_SCALE)
	scribble_draw_text_ext(room_width / 2, room_height / 2 + 64, string(ceil(input_binding_scan_time_remaining() / 1000)), MENU_SMALL_SCALE)
}