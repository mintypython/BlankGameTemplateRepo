// Inherit the parent event
event_inherited()

// Set the menu text to that of this menu item
owner.buttonText = buttonText
owner.position = position

// Destroy this item and all others after selection is made
with (oLanguageItem) instance_destroy()

// Clear array list of items after selection is made
with (oLanguageList) {
	items = []
	selected = true
}

// Set locale position and load the translations
global.locale = position
loadLang(position)

// Reload room with new language
room_goto(rMainMenu)
oButtonPlay.selected = false
