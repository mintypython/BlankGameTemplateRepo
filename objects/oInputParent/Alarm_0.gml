// Inherit the parent event
event_inherited();


// Change input
input_binding_scan_start(
	function(newBinding) {
		input_binding_set_safe(action, newBinding)
		// Save game
		saveGame()
	}
)