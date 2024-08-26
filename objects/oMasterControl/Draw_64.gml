#region Display Game Title / Subtitle / Version Number

// Draw text
if room != rGameRoom scribble_draw_text_ext(room_width / 2, 0 + (room_height * 0.059), locale("game_title"), MENU_TITLE_SCALE)

if room == rSettings scribble_draw_text_ext(room_width / 2, 0 + (room_height * 0.162), locale("settings"), MENU_SUBTITLE_SCALE)
else if room == rAudio scribble_draw_text_ext(room_width / 2, 0 + (room_height * 0.162), locale("audio"), MENU_SUBTITLE_SCALE)
else if room == rVideo scribble_draw_text_ext(room_width / 2, 0 + (room_height * 0.162), locale("video"), MENU_SUBTITLE_SCALE)
else if room == rGameplay scribble_draw_text_ext(room_width / 2, 0 + (room_height * 0.162), locale("gameplay"), MENU_SUBTITLE_SCALE)
else if room == rControls scribble_draw_text_ext(room_width / 2, 0 + (room_height * 0.162), locale("controls"), MENU_SUBTITLE_SCALE)

scribble_draw_text_ext(room_width - 48, room_height - (room_height * 0.0148), "v0.0.5", MENU_SMALL_SCALE)

#endregion
