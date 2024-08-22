#region Display Game Title / Subtitle / Version Number

// Draw text
draw_set_font(global.A60)
if room != rGameRoom drawCenterText(room_width / 2, 0 + (room_height * 0.059), locale("game_title"))

draw_set_font(global.A30)
if room == rSettings drawCenterText(room_width / 2, 0 + (room_height * 0.162), locale("settings"))
else if room == rAudio drawCenterText(room_width / 2, 0 + (room_height * 0.162), locale("audio"))
else if room == rVideo drawCenterText(room_width / 2, 0 + (room_height * 0.162), locale("video"))
else if room == rGameplay drawCenterText(room_width / 2, 0 + (room_height * 0.162), locale("gameplay"))
else if room == rControls drawCenterText(room_width / 2, 0 + (room_height * 0.162), locale("controls"))

draw_set_font(global.A11)
drawCenterText(room_width - 48, room_height - (room_height * 0.0148), "v0.0.5")

#endregion

