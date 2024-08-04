// Inherit the parent event
event_inherited()

// Set the menu text to that of this menu item
owner.buttonText = other.buttonText
owner.position = other.position

// Destroy this item and all others after selection is made
with (oLanguageItem) instance_destroy()

// Clear array list of items after selection is made
with (oLanguageList) {
	items = []
	selected = 1
}

// Set locale position and load the translations
global.locale = position
loadLang(position)
reloadMain() // Reload room with new language
