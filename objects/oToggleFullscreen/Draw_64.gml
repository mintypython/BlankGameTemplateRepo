// Inherit the parent event
event_inherited()

// Draw ON and OFF in different transparencies for fullscreen toggle
scribble_draw_text_ext(x + (sprite_width / 2) + 64, ystart, 
						global.fullscreen ? locale("on") : locale("off"), 
						MENU_LIST_SCALE, c_white, noone, fa_left)
