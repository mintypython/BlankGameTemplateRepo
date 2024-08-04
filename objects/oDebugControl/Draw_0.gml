draw_self()

var d = 20
draw_set_font(global.A11)
draw_set_halign(fa_left)
draw_text(x, y+d*0, $"Locale: {global.languageIndex}")
draw_text(x, y+d*1, $"Master Volume: {global.masterVolume}")
draw_text(x, y+d*2, $"Music Volume: {global.musicVolume}")
draw_text(x, y+d*3, $"SFX Volume: {global.sfxVolume}")
draw_text(x, y+d*4, $"Fullscreen: {global.fullscreen}")
draw_text(x, y+d*5, $"Difficulty: {global.difficulty}")
draw_text(x, y+d*6, $"Input: {global.input}")