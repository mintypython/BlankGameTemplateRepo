#region Delta, Background Update, FPS Update
// Delta Time Update
global.deltaActual = delta_time / 1000000
global.deltaMulti = global.deltaActual / global.deltaTarget

// Background Animation Delta
var _bg = layer_get_id("Background")
var _dt = global.deltaMulti
if layer_get_hspeed(_bg) != 0 or layer_get_vspeed(_bg) != 0 {
	layer_hspeed(_bg, 0.5 * _dt)
	layer_vspeed(_bg, 0.5 * _dt)
}

// Update FPS
game_set_speed(global.gamespeed, gamespeed_fps)
#endregion

#region Music Control
// Update master and music volumes
audio_master_gain(global.masterVolume)
if audio_group_is_loaded(agSoundFX) audio_group_set_gain(agSoundFX, global.sfxVolume, 1)
if audio_group_is_loaded(agMusic) {
	
	// Update music volume
	audio_group_set_gain(agMusic, global.musicVolume, 1)

	// Check if there music is not playing, then start background music
	if !audio_is_playing(playlist[randSong]) {
		randSong = irandom_range(0, array_length(playlist) - 1)
		var _music = audio_play_sound(playlist[randSong], 1, false)
		audio_sound_gain(_music, global.musicVolume, 0)
	}
	
	// Pause music if it's still playing when game window is not in focus
	if !window_has_focus() and !audio_is_paused(playlist[randSong]) {
		audio_pause_sound(playlist[randSong])
	}
	
	// Resume music once the window is selected again 
	if window_has_focus() and audio_is_paused(playlist[randSong]) {
		audio_resume_sound(playlist[randSong])
	}
}
#endregion

#region Controller / KBM Detection

// Draw custom mouse cursor or not
/*if global.input == KBM cursor_sprite = sCursor
else if global.input == CONTROLLER cursor_sprite = cr_none*/

// Switch back to KBM if the mouse moves or any keyboard key is pressed
if ((mouse_x != xx) 
	or (mouse_y != yy) 
	or keyboard_check_pressed(vk_anykey)) 
	and global.input == CONTROLLER {
		global.input = KBM
}
// Update previous mouse position to the new current position
xx = mouse_x;
yy = mouse_y;

// Find and ID the controller
var _controller = input_source_detect_input(INPUT_GAMEPAD)

// Turn the global controller flag on when the controller is used, if it's off already
if _controller and global.input == KBM global.input = CONTROLLER 


#endregion

#region Controller Navigation
if global.input == CONTROLLER {
	
	#region Main Menu
		if room == rMainMenu { // If the controller is active in the main menu

			if oButtonPlay.selected == true and input_check_pressed("down") { // Play
				oButtonPlay.selected = false
				oButtonSettings.selected = true
			}
			else if oButtonSettings.selected == true and input_check_pressed("up") { // Settings
				oButtonSettings.selected = false
				oButtonPlay.selected = true
		
			}
			else if oButtonSettings.selected == true and input_check_pressed("down") { // Settings
				oButtonSettings.selected = false
				oButtonQuit.selected = true
			}
			else if oButtonQuit.selected == true and input_check_pressed("up") { // Quit
				oButtonQuit.selected = false
				oButtonSettings.selected = true
			}
			else if oLanguageList.selected == true and input_check_pressed("left") { // Language List
				oLanguageList.selected = false
				with oLanguageItem instance_destroy()
				oButtonPlay.selected = true
			}
			else if oButtonPlay.selected == true and input_check_pressed("right") { // Play
				oButtonPlay.selected = false
				oLanguageList.selected = true
			}
			else if oButtonSettings.selected == true and input_check_pressed("right") { // Settings
				oButtonSettings.selected = false
				oLanguageList.selected = true
		
			}
			else if oButtonQuit.selected == true and input_check_pressed("right") { // Quit
				oButtonQuit.selected = false
				oLanguageList.selected = true
			}
			
			
			// Language selection
			if instance_exists(oLanguageItem) {
				
				if oLanguageList.selected == true and input_check_pressed("up") { // Language List
					oLanguageList.selected = false
					oLanguageList.items[0].selected = true
				}

				else if oLanguageList.items[0].selected == true and input_check_pressed("down") { // Item 0
					oLanguageList.items[0].selected = false
					oLanguageList.selected = true
				}

				else if oLanguageList.items[0].selected == true and input_check_pressed("up") { // Item 0
					oLanguageList.items[0].selected = false
					oLanguageList.items[1].selected = true
				}
			
				else if oLanguageList.items[1].selected == true and input_check_pressed("down") { // Item 1
					oLanguageList.items[1].selected = false
					oLanguageList.items[0].selected = true
				}

				else if oLanguageList.items[1].selected == true and input_check_pressed("up") { // Item 1
					oLanguageList.items[1].selected = false
					oLanguageList.items[2].selected = true
				}
			
				else if oLanguageList.items[2].selected == true and input_check_pressed("down") { // Item 2
					oLanguageList.items[2].selected = false
					oLanguageList.items[1].selected = true
				}

				else if oLanguageList.items[2].selected == true and input_check_pressed("up") { // Item 2
					oLanguageList.items[2].selected = false
					oLanguageList.items[3].selected = true
				}
				
				else if oLanguageList.items[3].selected == true and input_check_pressed("down") { // Item 3
					oLanguageList.items[3].selected = false
					oLanguageList.items[2].selected = true
				}

				else if oLanguageList.items[3].selected == true and input_check_pressed("up") { // Item 3
					oLanguageList.items[3].selected = false
					oLanguageList.items[4].selected = true
				}
				
				else if oLanguageList.items[4].selected == true and input_check_pressed("down") { // Item 4
					oLanguageList.items[4].selected = false
					oLanguageList.items[3].selected = true
				}

				else if oLanguageList.items[4].selected == true and input_check_pressed("up") { // Item 4
					oLanguageList.items[4].selected = false
					oLanguageList.items[5].selected = true
				}
			
				else if oLanguageList.items[5].selected == true and input_check_pressed("down") { // Item 5
					oLanguageList.items[5].selected = false
					oLanguageList.items[4].selected = true
				}
				
				else if input_check_pressed("left") or input_check_pressed("back") { // Play
					oLanguageList.selected = false
					with oLanguageItem instance_destroy()
					oButtonPlay.selected = true
				}
			}
		}
	#endregion

	#region Settings
		if room == rSettings { // If the controller is active in the main menu
		
			if oButtonAudio.selected == true and input_check_pressed("down") { // Audio
				oButtonAudio.selected = false
				oButtonVideo.selected = true
			}
			else if oButtonVideo.selected == true and input_check_pressed("up") { // Video
				oButtonVideo.selected = false
				oButtonAudio.selected = true
			}
			else if oButtonVideo.selected == true and input_check_pressed("down") { // Video
				oButtonVideo.selected = false
				oButtonGameplay.selected = true
			}
			else if oButtonGameplay.selected == true and input_check_pressed("up") { // Difficulty
				oButtonGameplay.selected = false
				oButtonVideo.selected = true
			}
			else if oButtonGameplay.selected == true and input_check_pressed("down") { // Difficulty
				oButtonGameplay.selected = false
				oButtonControls.selected = true
			}
			else if oButtonControls.selected == true and input_check_pressed("up") { // Controls
				oButtonControls.selected = false
				oButtonGameplay.selected = true
			}
			else if oButtonControls.selected == true and input_check_pressed("down") { // Controls
				oButtonControls.selected = false
				oButtonBackMenu.selected = true
			}
			else if oButtonBackMenu.selected == true and input_check_pressed("up") { // Back
				oButtonBackMenu.selected = false
				oButtonControls.selected = true
			}

		}
	#endregion

	#region Audio
		if room == rAudio { // If the controller is active in the main menu
			
			if oMasterVol.selected == true and input_check_pressed("down") { // MasterVol
				oMasterVol.selected = false
				oMusicVol.selected = true
			}
			else if oMusicVol.selected == true and input_check_pressed("up") { // MusicVol
				oMusicVol.selected = false
				oMasterVol.selected = true
			}
			else if oMusicVol.selected == true and input_check_pressed("down") { // MusicVol
				oMusicVol.selected = false
				oSoundVol.selected = true
			}
			else if oSoundVol.selected == true and input_check_pressed("up") { // SoundVol
				oSoundVol.selected = false
				oMusicVol.selected = true
			}
			else if oSoundVol.selected == true and input_check_pressed("down") { // SoundVol
				oSoundVol.selected = false
				oButtonBackSettings.selected = true
			}
			else if oButtonBackSettings.selected == true and input_check_pressed("up") { // Back
				oButtonBackSettings.selected = false
				oSoundVol.selected = true
			}
			
			var _left = input_check_pressed("left")
			var _right = input_check_pressed("right")
			var _leftHeld = input_check_long("left")
			var _rightHeld = input_check_long("right")
			if _leftHeld _left = 1
			if _rightHeld _right = 1
			
			if oMasterVol.selected == true
				and _right
				and oMasterVol.slider.value < 1
					oMasterVol.slider.value += 0.01
			else if oMasterVol.selected == true
				and _left
				and oMasterVol.slider.value > 0
					oMasterVol.slider.value -= 0.01
			
			else if oMusicVol.selected == true
				and _right
				and oMusicVol.slider.value < 1
					oMusicVol.slider.value += 0.01
			else if oMusicVol.selected == true
				and _left
				and oMusicVol.slider.value > 0
					oMusicVol.slider.value -= 0.01
			
			else if oSoundVol.selected == true
				and _right
				and oSoundVol.slider.value < 1
					oSoundVol.slider.value += 0.01
			else if oSoundVol.selected == true
				and _left
				and oSoundVol.slider.value > 0
					oSoundVol.slider.value -= 0.01

		}
	#endregion

	#region Video
		if room == rVideo { // If the controller is active in the main menu
			
			if oResolutionList.selected == true and input_check_pressed("down") { // Resolution List
				oResolutionList.selected = false
				oToggleFullscreen.selected = true
			}
			else if oToggleFullscreen.selected == true and input_check_pressed("up") { // Toggle Fullscreen
				oToggleFullscreen.selected = false
				oResolutionList.selected = true
			}
			else if oToggleFullscreen.selected == true and input_check_pressed("down") { // Toggle Fullscreen
				oToggleFullscreen.selected = false
				oButtonBackSettings.selected = true
			}
			else if oButtonBackSettings.selected == true and input_check_pressed("up") { // Button Back Settings
				oButtonBackSettings.selected = false
				oToggleFullscreen.selected = true
			}
			else if oApply.selected == true and input_check_pressed("left") { // Button Back Settings
				oApply.selected = false
				oButtonBackSettings.selected = true
			}
			else if oApply.selected == true and input_check_pressed("up") { // Button Back Settings
				oApply.selected = false
				oToggleFullscreen.selected = true
			}
			else if input_check_pressed("right") { // Apply
				oResolutionList.selected = false
				oToggleFullscreen.selected = false
				oButtonBackSettings.selected = false
				with oResolutionItem instance_destroy()
				oApply.selected = true
			}
			
			// Item selection
			if instance_exists(oResolutionItem) {
				
				if oResolutionList.selected == true and input_check_pressed("up") { // Resolution List
					oResolutionList.selected = false
					oResolutionList.items[0].selected = true
				}

				else if oResolutionList.items[0].selected == true and input_check_pressed("down") { // Item 0
					oResolutionList.items[0].selected = false
					oResolutionList.selected = true
				}

				else if oResolutionList.items[0].selected == true and input_check_pressed("up") { // Item 0
					oResolutionList.items[0].selected = false
					oResolutionList.items[1].selected = true
				}
			
				else if oResolutionList.items[1].selected == true and input_check_pressed("down") { // Item 1
					oResolutionList.items[1].selected = false
					oResolutionList.items[0].selected = true
				}

				else if oResolutionList.items[1].selected == true and input_check_pressed("up") { // Item 1
					oResolutionList.items[1].selected = false
					oResolutionList.items[2].selected = true
				}
			
				else if oResolutionList.items[2].selected == true and input_check_pressed("down") { // Item 2
					oResolutionList.items[2].selected = false
					oResolutionList.items[1].selected = true
				}

				else if oResolutionList.items[2].selected == true and input_check_pressed("up") { // Item 2
					oResolutionList.items[2].selected = false
					oResolutionList.items[3].selected = true
				}
				
				else if oResolutionList.items[3].selected == true and input_check_pressed("down") { // Item 3
					oResolutionList.items[3].selected = false
					oResolutionList.items[2].selected = true
				}

				else if oResolutionList.items[3].selected == true and input_check_pressed("up") { // Item 3
					oResolutionList.items[3].selected = false
					oResolutionList.items[4].selected = true
				}
				
				else if oResolutionList.items[4].selected == true and input_check_pressed("down") { // Item 4
					oResolutionList.items[4].selected = false
					oResolutionList.items[3].selected = true
				}

				else if oResolutionList.items[4].selected == true and input_check_pressed("up") { // Item 4
					oResolutionList.items[4].selected = false
					oResolutionList.items[5].selected = true
				}
			
				else if oResolutionList.items[5].selected == true and input_check_pressed("down") { // Item 5
					oResolutionList.items[5].selected = false
					oResolutionList.items[4].selected = true
				}
				
				else if input_check_pressed("right") { // Apply
					oResolutionList.selected = false
					oToggleFullscreen.selected = false
					oButtonBackSettings.selected = false
					with oResolutionItem instance_destroy()
					oApply.selected = true
				}
			}
		}
	#endregion

	#region Gameplay
		if room == rGameplay { // If the controller is active in the main menu
		
			if oDifficultyList.selected == true and input_check_pressed("down") { // Difficulty List
				oDifficultyList.selected = false
				oButtonBackSettings.selected = true
			}
			else if oButtonBackSettings.selected == true and input_check_pressed("up") { // Button Back Settings
				oButtonBackSettings.selected = false
				oDifficultyList.selected = true
			}
			
			// Item selection
			if instance_exists(oDifficultyItem) {
				
				if oDifficultyList.selected == true and input_check_pressed("right") { // Resolution List
					oDifficultyList.selected = false
					oDifficultyList.items[0].selected = true
				}
				else if oDifficultyList.items[0].selected == true and input_check_pressed("left") { // Item 0
					oDifficultyList.items[0].selected = false
					oDifficultyList.selected = true
				}
				else if oDifficultyList.items[0].selected == true and input_check_pressed("right") { // Item 0
					oDifficultyList.items[0].selected = false
					oDifficultyList.items[1].selected = true
				}
				else if oDifficultyList.items[1].selected == true and input_check_pressed("left") { // Item 1
					oDifficultyList.items[1].selected = false
					oDifficultyList.items[0].selected = true
				}
				else if oDifficultyList.items[1].selected == true and input_check_pressed("right") { // Item 1
					oDifficultyList.items[1].selected = false
					oDifficultyList.items[2].selected = true
				}
				else if oDifficultyList.items[2].selected == true and input_check_pressed("left") { // Item 2
					oDifficultyList.items[2].selected = false
					oDifficultyList.items[1].selected = true
				}
				else if input_check_pressed("down") { // Apply
					oDifficultyList.selected = false
					oButtonBackSettings.selected = false
					with oDifficultyItem instance_destroy()
					oButtonBackSettings.selected = true
				}
				
				// Controller Accept
				if input_check_pressed("accept") {
					if oDifficultyList.items[0].selected == true global.difficulty = DIFFICULTY_EASY
					else if oDifficultyList.items[1].selected == true global.difficulty = DIFFICULTY_NORM
					else if oDifficultyList.items[2].selected == true global.difficulty = DIFFICULTY_HARD
				}
			}
		}
	#endregion

	#region Controls
		if room == rControls { // If the controller is active in the main menu
			
			if oUp.selected == true and input_check_pressed("down") { // Up
				oUp.selected = false
				oLeft.selected = true
			}
			else if oUp.selected == true and input_check_pressed("right") { // Up
				oUp.selected = false
				oInteract.selected = true
			}
			else if oLeft.selected == true and input_check_pressed("up") { // Left
				oLeft.selected = false
				oUp.selected = true
			}
			else if oLeft.selected == true and input_check_pressed("down") { // Left
				oLeft.selected = false
				oDown.selected = true
			}
			else if oLeft.selected == true and input_check_pressed("right") { // Left
				oLeft.selected = false
				oJump.selected = true
			}
			else if oDown.selected == true and input_check_pressed("up") { // Down
				oDown.selected = false
				oLeft.selected = true
			}
			else if oDown.selected == true and input_check_pressed("down") { // Down
				oDown.selected = false
				oRight.selected = true
			}
			else if oDown.selected == true and input_check_pressed("right") { // Down
				oDown.selected = false
				oRun.selected = true
			}
			else if oRight.selected == true and input_check_pressed("up") { // Right
				oRight.selected = false
				oDown.selected = true
			}
			else if oRight.selected == true and input_check_pressed("down") { // Right
				oRight.selected = false
				oButtonBackSettings.selected = true
			}
			else if oRight.selected == true and input_check_pressed("right") { // Right
				oRight.selected = false
				oInventory.selected = true
			}
			else if oInteract.selected == true and input_check_pressed("left") { // Interact
				oInteract.selected = false
				oUp.selected = true
			}
			else if oInteract.selected == true and input_check_pressed("down") { // Interact
				oInteract.selected = false
				oJump.selected = true
			}
			else if oJump.selected == true and input_check_pressed("up") { // Jump
				oJump.selected = false
				oInteract.selected = true
			}
			else if oJump.selected == true and input_check_pressed("left") { // Jump
				oJump.selected = false
				oLeft.selected = true
			}
			else if oJump.selected == true and input_check_pressed("down") { // Jump
				oJump.selected = false
				oRun.selected = true
			}
			else if oRun.selected == true and input_check_pressed("up") { // Run
				oRun.selected = false
				oJump.selected = true
			}
			else if oRun.selected == true and input_check_pressed("left") { // Run
				oRun.selected = false
				oDown.selected = true
			}
			else if oRun.selected == true and input_check_pressed("down") { // Run
				oRun.selected = false
				oInventory.selected = true
			}
			else if oInventory.selected == true and input_check_pressed("up") { // Inventory
				oInventory.selected = false
				oRun.selected = true
			}
			else if oInventory.selected == true and input_check_pressed("left") { // Inventory
				oInventory.selected = false
				oRight.selected = true
			}
			else if oInventory.selected == true and input_check_pressed("down") { // Inventory
				oInventory.selected = false
				oButtonBackSettings.selected = true
			}
			else if oButtonBackSettings.selected == true and input_check_pressed("up") { // Back
				oButtonBackSettings.selected = false
				oRight.selected = true
			}
			else if oButtonBackSettings.selected == true and input_check_pressed("right") { // Back
				oButtonBackSettings.selected = false
				oInventory.selected = true
			}
		}
	#endregion
	
	#region Anywhere in the menus
		if input_check_pressed("back") and room == rSettings room_goto(rMainMenu)
		if input_check_pressed("back") and room == rAudio {
			room_goto(rSettings)
			saveGame()
		}
		if input_check_pressed("back") and room == rVideo room_goto(rSettings)
		if input_check_pressed("back") and room == rGameplay room_goto(rSettings)
		if input_check_pressed("back") and room == rControls room_goto(rSettings)
	#endregion

}
#endregion

