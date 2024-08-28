moveSpeedBase = 5
moveSpeed = moveSpeedBase
moveSpeedMax = moveSpeedBase
moveSpeedAccelBase = 0.25
moveSpeedAccel = moveSpeedAccelBase
moveSpeedFrictBase = 0.25
moveSpeedFrict = moveSpeedFrictBase
hSpeed = 0
vSpeed = 0

image_index = 1
image_speed = 0

if dbg_view_exists(global.debugViewGame) dbg_view_delete(global.debugViewGame)
global.debugViewGame = dbg_view("Game", false, 10, 30, 350, 410)
	dbg_section("Player", true)
		dbg_slider(ref_create(id, "moveSpeedBase"), 1, 20, "Move Speed Base: ", 0.1)
		dbg_slider(ref_create(id, "moveSpeed"), 1, 20, "Move Speed: ", 0.1)
		dbg_slider(ref_create(id, "moveSpeedAccelBase"), 0, 10, "Move Speed AccelerationBase: ", 0.01)
		dbg_slider(ref_create(id, "moveSpeedFrictBase"), 0, 10, "Move Speed Friction Base: ", 0.01)
		dbg_slider(ref_create(id, "hSpeed"), -moveSpeedBase, moveSpeedBase, "Horizontal Speed: ", 0.1)
		dbg_slider(ref_create(id, "vSpeed"), -moveSpeedBase, moveSpeedBase, "Vertical Speed: ", 0.1)