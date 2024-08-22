#region Delta, Background Update, FPS Update
// Delta Time
global.deltaActual = delta_time / 1000000
global.deltaMulti = global.deltaActual / global.deltaTarget

// Background Animation Delta
var _bg = layer_get_id("Background")
if layer_get_hspeed(_bg) != 0 or layer_get_vspeed(_bg) != 0 {
	layer_hspeed(_bg, 0.5 * global.deltaMulti)
	layer_vspeed(_bg, 0.5 * global.deltaMulti)
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
/*if global.input == 0 cursor_sprite = sCursor
else if global.input == 1 cursor_sprite = cr_none*/

// Switch back to KBM if the mouse moves or any keyboard key is pressed
if ((mouse_x != xx) 
	or (mouse_y != yy) 
	or keyboard_check_pressed(vk_anykey)) 
	and global.input == 1 {
		global.input = 0
}
// Update previous mouse position to the new current position
xx = mouse_x;
yy = mouse_y;

// Find and ID the controller
var _controller = input_source_detect_input(INPUT_GAMEPAD)

// Turn the global controller flag on when the controller is used, if it's off already
if _controller and global.input == 0 global.input = 1 


#endregion

#region Controller Navigation
if global.input == 1 {
	
	#region Main Menu
		if room == rMainMenu { // If the controller is active in the main menu

			if oButtonPlay.selected == 1 and input_check_pressed("down") { // Play
				oButtonPlay.selected = 0
				oButtonSettings.selected = 1
			}
			else if oButtonSettings.selected == 1 and input_check_pressed("up") { // Settings
				oButtonSettings.selected = 0
				oButtonPlay.selected = 1
		
			}
			else if oButtonSettings.selected == 1 and input_check_pressed("down") { // Settings
				oButtonSettings.selected = 0
				oButtonQuit.selected = 1
			}
			else if oButtonQuit.selected == 1 and input_check_pressed("up") { // Quit
				oButtonQuit.selected = 0
				oButtonSettings.selected = 1
			}
			else if oLanguageList.selected == 1 and input_check_pressed("left") { // Language List
				oLanguageList.selected = 0
				with oLanguageItem instance_destroy()
				oButtonPlay.selected = 1
			}
			else if oButtonPlay.selected == 1 and input_check_pressed("right") { // Play
				oButtonPlay.selected = 0
				oLanguageList.selected = 1
			}
			else if oButtonSettings.selected == 1 and input_check_pressed("right") { // Settings
				oButtonSettings.selected = 0
				oLanguageList.selected = 1
		
			}
			else if oButtonQuit.selected == 1 and input_check_pressed("right") { // Quit
				oButtonQuit.selected = 0
				oLanguageList.selected = 1
			}
			
			
			// Language selection
			if instance_exists(oLanguageItem) {
				
				if oLanguageList.selected == 1 and input_check_pressed("up") { // Language List
					oLanguageList.selected = 0
					oLanguageList.items[0].selected = 1
				}

				else if oLanguageList.items[0].selected == 1 and input_check_pressed("down") { // Item 0
					oLanguageList.items[0].selected = 0
					oLanguageList.selected = 1
				}

				else if oLanguageList.items[0].selected == 1 and input_check_pressed("up") { // Item 0
					oLanguageList.items[0].selected = 0
					oLanguageList.items[1].selected = 1
				}
			
				else if oLanguageList.items[1].selected == 1 and input_check_pressed("down") { // Item 1
					oLanguageList.items[1].selected = 0
					oLanguageList.items[0].selected = 1
				}

				else if oLanguageList.items[1].selected == 1 and input_check_pressed("up") { // Item 1
					oLanguageList.items[1].selected = 0
					oLanguageList.items[2].selected = 1
				}
			
				else if oLanguageList.items[2].selected == 1 and input_check_pressed("down") { // Item 2
					oLanguageList.items[2].selected = 0
					oLanguageList.items[1].selected = 1
				}

				else if oLanguageList.items[2].selected == 1 and input_check_pressed("up") { // Item 2
					oLanguageList.items[2].selected = 0
					oLanguageList.items[3].selected = 1
				}
				
				else if oLanguageList.items[3].selected == 1 and input_check_pressed("down") { // Item 3
					oLanguageList.items[3].selected = 0
					oLanguageList.items[2].selected = 1
				}

				else if oLanguageList.items[3].selected == 1 and input_check_pressed("up") { // Item 3
					oLanguageList.items[3].selected = 0
					oLanguageList.items[4].selected = 1
				}
				
				else if oLanguageList.items[4].selected == 1 and input_check_pressed("down") { // Item 4
					oLanguageList.items[4].selected = 0
					oLanguageList.items[3].selected = 1
				}

				else if oLanguageList.items[4].selected == 1 and input_check_pressed("up") { // Item 4
					oLanguageList.items[4].selected = 0
					oLanguageList.items[5].selected = 1
				}
			
				else if oLanguageList.items[5].selected == 1 and input_check_pressed("down") { // Item 5
					oLanguageList.items[5].selected = 0
					oLanguageList.items[4].selected = 1
				}
				else if oLanguageList.items[5].selected == 1 and input_check_pressed("up") { // Item 5
					oLanguageList.items[5].selected = 0
					oLanguageList.items[6].selected = 1
				}
							
				else if oLanguageList.items[6].selected == 1 and input_check_pressed("down") { // Item 6
					oLanguageList.items[6].selected = 0
					oLanguageList.items[5].selected = 1
				}
				else if oLanguageList.items[6].selected == 1 and input_check_pressed("up") { // Item 6
					oLanguageList.items[6].selected = 0
					oLanguageList.items[7].selected = 1
				}
							
				else if oLanguageList.items[7].selected == 1 and input_check_pressed("down") { // Item 7
					oLanguageList.items[7].selected = 0
					oLanguageList.items[6].selected = 1
				}
				else if oLanguageList.items[7].selected == 1 and input_check_pressed("up") { // Item 7
					oLanguageList.items[7].selected = 0
					oLanguageList.items[8].selected = 1
				}
							
				else if oLanguageList.items[8].selected == 1 and input_check_pressed("down") { // Item 8
					oLanguageList.items[8].selected = 0
					oLanguageList.items[7].selected = 1
				}
				else if oLanguageList.items[8].selected == 1 and input_check_pressed("up") { // Item 8
					oLanguageList.items[8].selected = 0
					oLanguageList.items[9].selected = 1
				}
							
				else if oLanguageList.items[9].selected == 1 and input_check_pressed("down") { // Item 9
					oLanguageList.items[9].selected = 0
					oLanguageList.items[8].selected = 1
				}
				
				else if input_check_pressed("left") or input_check_pressed("back") { // Play
					oLanguageList.selected = 0
					with oLanguageItem instance_destroy()
					oButtonPlay.selected = 1
				}
			}
		}
	#endregion

	#region Settings
		if room == rSettings { // If the controller is active in the main menu
		
			if oButtonAudio.selected == 1 and input_check_pressed("down") { // Audio
				oButtonAudio.selected = 0
				oButtonVideo.selected = 1
			}
			else if oButtonVideo.selected == 1 and input_check_pressed("up") { // Video
				oButtonVideo.selected = 0
				oButtonAudio.selected = 1
			}
			else if oButtonVideo.selected == 1 and input_check_pressed("down") { // Video
				oButtonVideo.selected = 0
				oButtonGameplay.selected = 1
			}
			else if oButtonGameplay.selected == 1 and input_check_pressed("up") { // Difficulty
				oButtonGameplay.selected = 0
				oButtonVideo.selected = 1
			}
			else if oButtonGameplay.selected == 1 and input_check_pressed("down") { // Difficulty
				oButtonGameplay.selected = 0
				oButtonControls.selected = 1
			}
			else if oButtonControls.selected == 1 and input_check_pressed("up") { // Controls
				oButtonControls.selected = 0
				oButtonGameplay.selected = 1
			}
			else if oButtonControls.selected == 1 and input_check_pressed("down") { // Controls
				oButtonControls.selected = 0
				oButtonBackMenu.selected = 1
			}
			else if oButtonBackMenu.selected == 1 and input_check_pressed("up") { // Back
				oButtonBackMenu.selected = 0
				oButtonControls.selected = 1
			}

		}
	#endregion

	#region Audio
		if room == rAudio { // If the controller is active in the main menu
			
			if oMasterVol.selected == 1 and input_check_pressed("down") { // MasterVol
				oMasterVol.selected = 0
				oMusicVol.selected = 1
			}
			else if oMusicVol.selected == 1 and input_check_pressed("up") { // MusicVol
				oMusicVol.selected = 0
				oMasterVol.selected = 1
			}
			else if oMusicVol.selected == 1 and input_check_pressed("down") { // MusicVol
				oMusicVol.selected = 0
				oSoundVol.selected = 1
			}
			else if oSoundVol.selected == 1 and input_check_pressed("up") { // SoundVol
				oSoundVol.selected = 0
				oMusicVol.selected = 1
			}
			else if oSoundVol.selected == 1 and input_check_pressed("down") { // SoundVol
				oSoundVol.selected = 0
				oButtonBackSettings.selected = 1
			}
			else if oButtonBackSettings.selected == 1 and input_check_pressed("up") { // Back
				oButtonBackSettings.selected = 0
				oSoundVol.selected = 1
			}
			
			var _left = input_check_pressed("left")
			var _right = input_check_pressed("right")
			var _leftHeld = input_check_long("left")
			var _rightHeld = input_check_long("right")
			if _leftHeld _left = 1
			if _rightHeld _right = 1
			
			if oMasterVol.selected == 1 
				and _right
				and oMasterVol.slider.value < 1
					oMasterVol.slider.value += 0.01
			else if oMasterVol.selected == 1 
				and _left
				and oMasterVol.slider.value > 0
					oMasterVol.slider.value -= 0.01
			
			else if oMusicVol.selected == 1 
				and _right
				and oMusicVol.slider.value < 1
					oMusicVol.slider.value += 0.01
			else if oMusicVol.selected == 1 
				and _left
				and oMusicVol.slider.value > 0
					oMusicVol.slider.value -= 0.01
			
			else if oSoundVol.selected == 1 
				and _right
				and oSoundVol.slider.value < 1
					oSoundVol.slider.value += 0.01
			else if oSoundVol.selected == 1 
				and _left
				and oSoundVol.slider.value > 0
					oSoundVol.slider.value -= 0.01

		}
	#endregion

	#region Video
		if room == rVideo { // If the controller is active in the main menu
			
			if oResolutionList.selected == 1 and input_check_pressed("down") { // Resolution List
				oResolutionList.selected = 0
				oToggleFullscreen.selected = 1
			}
			else if oToggleFullscreen.selected == 1 and input_check_pressed("up") { // Toggle Fullscreen
				oToggleFullscreen.selected = 0
				oResolutionList.selected = 1
			}
			else if oToggleFullscreen.selected == 1 and input_check_pressed("down") { // Toggle Fullscreen
				oToggleFullscreen.selected = 0
				oButtonBackSettings.selected = 1
			}
			else if oButtonBackSettings.selected == 1 and input_check_pressed("up") { // Button Back Settings
				oButtonBackSettings.selected = 0
				oToggleFullscreen.selected = 1
			}
			else if oApply.selected == 1 and input_check_pressed("left") { // Button Back Settings
				oApply.selected = 0
				oButtonBackSettings.selected = 1
			}
			else if oApply.selected == 1 and input_check_pressed("up") { // Button Back Settings
				oApply.selected = 0
				oToggleFullscreen.selected = 1
			}
			else if input_check_pressed("right") { // Apply
				oResolutionList.selected = 0
				oToggleFullscreen.selected = 0
				oButtonBackSettings.selected = 0
				with oResolutionItem instance_destroy()
				oApply.selected = 1
			}
			
			// Item selection
			if instance_exists(oResolutionItem) {
				
				if oResolutionList.selected == 1 and input_check_pressed("up") { // Resolution List
					oResolutionList.selected = 0
					oResolutionList.items[0].selected = 1
				}

				else if oResolutionList.items[0].selected == 1 and input_check_pressed("down") { // Item 0
					oResolutionList.items[0].selected = 0
					oResolutionList.selected = 1
				}

				else if oResolutionList.items[0].selected == 1 and input_check_pressed("up") { // Item 0
					oResolutionList.items[0].selected = 0
					oResolutionList.items[1].selected = 1
				}
			
				else if oResolutionList.items[1].selected == 1 and input_check_pressed("down") { // Item 1
					oResolutionList.items[1].selected = 0
					oResolutionList.items[0].selected = 1
				}

				else if oResolutionList.items[1].selected == 1 and input_check_pressed("up") { // Item 1
					oResolutionList.items[1].selected = 0
					oResolutionList.items[2].selected = 1
				}
			
				else if oResolutionList.items[2].selected == 1 and input_check_pressed("down") { // Item 2
					oResolutionList.items[2].selected = 0
					oResolutionList.items[1].selected = 1
				}

				else if oResolutionList.items[2].selected == 1 and input_check_pressed("up") { // Item 2
					oResolutionList.items[2].selected = 0
					oResolutionList.items[3].selected = 1
				}
				
				else if oResolutionList.items[3].selected == 1 and input_check_pressed("down") { // Item 3
					oResolutionList.items[3].selected = 0
					oResolutionList.items[2].selected = 1
				}

				else if oResolutionList.items[3].selected == 1 and input_check_pressed("up") { // Item 3
					oResolutionList.items[3].selected = 0
					oResolutionList.items[4].selected = 1
				}
				
				else if oResolutionList.items[4].selected == 1 and input_check_pressed("down") { // Item 4
					oResolutionList.items[4].selected = 0
					oResolutionList.items[3].selected = 1
				}

				else if oResolutionList.items[4].selected == 1 and input_check_pressed("up") { // Item 4
					oResolutionList.items[4].selected = 0
					oResolutionList.items[5].selected = 1
				}
			
				else if oResolutionList.items[5].selected == 1 and input_check_pressed("down") { // Item 5
					oResolutionList.items[5].selected = 0
					oResolutionList.items[4].selected = 1
				}
				
				else if input_check_pressed("right") { // Apply
					oResolutionList.selected = 0
					oToggleFullscreen.selected = 0
					oButtonBackSettings.selected = 0
					with oResolutionItem instance_destroy()
					oApply.selected = 1
				}
			}
		}
	#endregion

	#region Gameplay
		if room == rGameplay { // If the controller is active in the main menu
		
			if oDifficultyList.selected == 1 and input_check_pressed("down") { // Difficulty List
				oDifficultyList.selected = 0
				oButtonBackSettings.selected = 1
			}
			else if oButtonBackSettings.selected == 1 and input_check_pressed("up") { // Button Back Settings
				oButtonBackSettings.selected = 0
				oDifficultyList.selected = 1
			}
			
			// Item selection
			if instance_exists(oDifficultyItem) {
				
				if oDifficultyList.selected == 1 and input_check_pressed("right") { // Resolution List
					oDifficultyList.selected = 0
					oDifficultyList.items[0].selected = 1
				}
				else if oDifficultyList.items[0].selected == 1 and input_check_pressed("left") { // Item 0
					oDifficultyList.items[0].selected = 0
					oDifficultyList.selected = 1
				}
				else if oDifficultyList.items[0].selected == 1 and input_check_pressed("right") { // Item 0
					oDifficultyList.items[0].selected = 0
					oDifficultyList.items[1].selected = 1
				}
				else if oDifficultyList.items[1].selected == 1 and input_check_pressed("left") { // Item 1
					oDifficultyList.items[1].selected = 0
					oDifficultyList.items[0].selected = 1
				}
				else if oDifficultyList.items[1].selected == 1 and input_check_pressed("right") { // Item 1
					oDifficultyList.items[1].selected = 0
					oDifficultyList.items[2].selected = 1
				}
				else if oDifficultyList.items[2].selected == 1 and input_check_pressed("left") { // Item 2
					oDifficultyList.items[2].selected = 0
					oDifficultyList.items[1].selected = 1
				}
				else if input_check_pressed("down") { // Apply
					oDifficultyList.selected = 0
					oButtonBackSettings.selected = 0
					with oDifficultyItem instance_destroy()
					oButtonBackSettings.selected = 1
				}
				
				// Controller Accept
				if input_check_pressed("accept") {
					if oDifficultyList.items[0].selected == 1 global.difficulty = 0
					else if oDifficultyList.items[1].selected == 1 global.difficulty = 1
					else if oDifficultyList.items[2].selected == 1 global.difficulty = 2
				}
			}
		}
	#endregion

	#region Controls
		if room == rControls { // If the controller is active in the main menu
			
			if oUp.selected == 1 and input_check_pressed("down") { // Up
				oUp.selected = 0
				oLeft.selected = 1
			}
			else if oUp.selected == 1 and input_check_pressed("right") { // Up
				oUp.selected = 0
				oInteract.selected = 1
			}
			else if oLeft.selected == 1 and input_check_pressed("up") { // Left
				oLeft.selected = 0
				oUp.selected = 1
			}
			else if oLeft.selected == 1 and input_check_pressed("down") { // Left
				oLeft.selected = 0
				oDown.selected = 1
			}
			else if oLeft.selected == 1 and input_check_pressed("right") { // Left
				oLeft.selected = 0
				oJump.selected = 1
			}
			else if oDown.selected == 1 and input_check_pressed("up") { // Down
				oDown.selected = 0
				oLeft.selected = 1
			}
			else if oDown.selected == 1 and input_check_pressed("down") { // Down
				oDown.selected = 0
				oRight.selected = 1
			}
			else if oDown.selected == 1 and input_check_pressed("right") { // Down
				oDown.selected = 0
				oRun.selected = 1
			}
			else if oRight.selected == 1 and input_check_pressed("up") { // Right
				oRight.selected = 0
				oDown.selected = 1
			}
			else if oRight.selected == 1 and input_check_pressed("down") { // Right
				oRight.selected = 0
				oButtonBackSettings.selected = 1
			}
			else if oRight.selected == 1 and input_check_pressed("right") { // Right
				oRight.selected = 0
				oInventory.selected = 1
			}
			else if oInteract.selected == 1 and input_check_pressed("left") { // Interact
				oInteract.selected = 0
				oUp.selected = 1
			}
			else if oInteract.selected == 1 and input_check_pressed("down") { // Interact
				oInteract.selected = 0
				oJump.selected = 1
			}
			else if oJump.selected == 1 and input_check_pressed("up") { // Jump
				oJump.selected = 0
				oInteract.selected = 1
			}
			else if oJump.selected == 1 and input_check_pressed("left") { // Jump
				oJump.selected = 0
				oLeft.selected = 1
			}
			else if oJump.selected == 1 and input_check_pressed("down") { // Jump
				oJump.selected = 0
				oRun.selected = 1
			}
			else if oRun.selected == 1 and input_check_pressed("up") { // Run
				oRun.selected = 0
				oJump.selected = 1
			}
			else if oRun.selected == 1 and input_check_pressed("left") { // Run
				oRun.selected = 0
				oDown.selected = 1
			}
			else if oRun.selected == 1 and input_check_pressed("down") { // Run
				oRun.selected = 0
				oInventory.selected = 1
			}
			else if oInventory.selected == 1 and input_check_pressed("up") { // Inventory
				oInventory.selected = 0
				oRun.selected = 1
			}
			else if oInventory.selected == 1 and input_check_pressed("left") { // Inventory
				oInventory.selected = 0
				oRight.selected = 1
			}
			else if oInventory.selected == 1 and input_check_pressed("down") { // Inventory
				oInventory.selected = 0
				oButtonBackSettings.selected = 1
			}
			else if oButtonBackSettings.selected == 1 and input_check_pressed("up") { // Back
				oButtonBackSettings.selected = 0
				oRight.selected = 1
			}
			else if oButtonBackSettings.selected == 1 and input_check_pressed("right") { // Back
				oButtonBackSettings.selected = 0
				oInventory.selected = 1
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

