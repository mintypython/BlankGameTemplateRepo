moveSpeedBase = 5
moveSpeed = moveSpeedBase
moveSpeedMax = moveSpeedBase
moveSpeedAccelBase = 0.25
moveSpeedAccel = moveSpeedAccelBase
moveSpeedFrictBase = 0.25
moveSpeedFrict = moveSpeedFrictBase
hSpeed = 0
vSpeed = 0

if dbg_view_exists(global.debugViewGame) dbg_view_delete(global.debugViewGame)
global.debugViewGame = dbg_view("Game", false, 10, 30, 350, 410)
	dbg_section("Player", true)
		dbg_slider(ref_create(id, "moveSpeedBase"), 1, 20, "Move Speed Base: ", 0.1)
		dbg_slider(ref_create(id, "moveSpeed"), 1, 20, "Move Speed: ", 0.1)
		dbg_slider(ref_create(id, "moveSpeedAccel"), 0, 10, "Move Speed Acceleration: ", 0.01)
		dbg_slider(ref_create(id, "moveSpeedFrict"), 0, 10, "Move Speed Friction: ", 0.01)
		dbg_slider(ref_create(id, "hSpeed"), -moveSpeedBase, moveSpeedBase, "Horizontal Speed: ", 0.1)
		dbg_slider(ref_create(id, "vSpeed"), -moveSpeedBase, moveSpeedBase, "Vertical Speed: ", 0.1)