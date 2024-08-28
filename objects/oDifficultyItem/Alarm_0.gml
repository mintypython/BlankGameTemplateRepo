// Inherit the parent event
event_inherited()

// Set the position to that of this menu item
owner.position = other.position

// Mouse selection only
global.difficulty = position

// Destroy this item and all others after selection is made
with (oDifficultyItem) instance_destroy()

// Clear array list of items after selection is made
with (oDifficultyList) {
	items = []
	selected = true
}

// Save game
saveGame()