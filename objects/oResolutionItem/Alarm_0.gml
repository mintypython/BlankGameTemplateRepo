// Inherit the parent event
event_inherited()

// Set the menu text to that of this menu item
owner.buttonText = other.buttonText
owner.position = other.position

// Destroy this item and all others after selection is made
with (oResolutionItem) instance_destroy()

// Clear array list of items after selection is made
with (oResolutionList) {
	items = []
	selected = 1
}

// Set global resolution position
global.resolution = position