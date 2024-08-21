// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

function __input_config_verbs()
{
    return {
        keyboard_and_mouse:
        {	
			// Menu
			leftclick: input_binding_mouse_button(mb_left),
            pause: input_binding_key(vk_escape),

			// Player specific
            moveUp:    input_binding_key("W"),
            moveDown:  input_binding_key("S"),
            moveLeft:  input_binding_key("A"),
            moveRight: input_binding_key("D"),
			jump:  input_binding_key(vk_space),
			run: input_binding_key(vk_shift),
            interact:  input_binding_key("E"),
			inventory: input_binding_key(vk_tab),	
        },
        
        gamepad:
        {
			// Menu
            up:    [input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
            down:  [input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
            left:  [input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
            right: [input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
			accept:  input_binding_gamepad_button(gp_face1), // A
			back:  input_binding_gamepad_button(gp_face2), // B
			pause: input_binding_gamepad_button(gp_start), // Menu/Options

			// Player specific
			moveUp:    input_binding_gamepad_axis(gp_axislv, true), // Left Stick
            moveDown:  input_binding_gamepad_axis(gp_axislv, false), // Left Stick
            moveLeft:  input_binding_gamepad_axis(gp_axislh, true), // Left Stick
            moveRight: input_binding_gamepad_axis(gp_axislh, false), // Left Stick
			jump:  input_binding_gamepad_button(gp_face1), // A
			run:  input_binding_gamepad_button(gp_face2), // B
            interact:  input_binding_gamepad_button(gp_face3), // X
            inventory: input_binding_gamepad_button(gp_face4), // Y
            
        },
    }
}