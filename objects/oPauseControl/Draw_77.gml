#region Pause Function
// Disable alpha blending
gpu_set_blendenable(false);

if global.pause { // Draw frozen image to the screen while paused
	surface_set_target(application_surface)
		if (surface_exists(pauseSurf)) {
			draw_surface(pauseSurf, 0, 0)
		} else { // Restore from the buffer if we lost the surface
			pauseSurf = surface_create(global.width, global.height)
			buffer_set_surface(pauseSurfBuffer, pauseSurf, 0)
		}
	surface_reset_target()
}

if /*!window_has_focus() 
	or*/ (input_check_pressed("pause") 
	and room != rMainMenu and room != rSettings 
	and room != rAudio and room != rVideo 
	and room != rGameplay  and room != rControls) { // Pause toggle except for the main menus
	if !global.pause {
		global.pause = 1
		
		// Deactivate everything other than this instance and the input controller
		instance_deactivate_all(true)
		neverDeactive() // Never deactivate the these objects


		pauseSurf = surface_create(global.width, global.height)
		surface_set_target(pauseSurf, 0)
		draw_surface(application_surface, 0, 0)
		surface_reset_target()
		
		// Back up this surface to a buffer
		if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer)
		pauseSurfBuffer = buffer_create(global.width * global.height * 4, buffer_fixed, 1)
		buffer_get_surface(pauseSurfBuffer, pauseSurf, 0)
		
	} 
	else {  // Unpause
		global.pause = 0
		instance_activate_all()
		if (surface_exists(pauseSurf)) surface_free(pauseSurf)
		if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer)
		
		// Reset menu to beginning
		subMenu = MAIN
		index = 1
	}
}

// Enable alpha blending
gpu_set_blendenable(true)
#endregion