spd = 1
xspd = 0
yspd = 0

dbg_view("Game", false, 10, 30, 350, 410)
	dbg_section("Player", true)
		dbg_slider(ref_create(id, "spd"), 1, 10, "Speed: ", 0.5)