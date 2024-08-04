// Feather disable all

/// This script contains mappings from binding labels - a combination of keyboard key names, mouse button
/// names, and abstract gamepad names - to more friendly terms that you can show a player. Typically you'd
/// set up this function to return sprites such that you can draw gamepad icons as visual icons.
/// 
/// Default values in this script reflect the particular, and sometimes unexpected, buttons that each gamepad
/// binding maps to on the actual physical hardware. There are a handful of special cases at the top of the
/// script that are used to handle errors or misconfigurations.



//Special case: When a non-binding value is being evaluated
//              This should only happen if Input is given an invalid input argument
input_icon_not_a_binding("Not a binding");

//Special case: When an empty binding is being evaluated
input_icon_empty("Empty");

//Special case: When a touch binding (virtual button) is being evaluated
input_icon_touch("Virtual button");

//Optional remapping for keyboard and mouse
//This is useful for turning keyboard keys into sprite icons to match other assets, or for returning formatted strings (e.g. for use with Scribble)
//Any keyboard key label not in this struct will simply fall through and return the key name

// Remove alt from the ignore list
input_ignore_key_remove(vk_alt)
input_ignore_key_remove(vk_lalt)
input_ignore_key_remove(vk_ralt)

#region Keyboard Icons
input_icons_keyboard_and_mouse()

// Numbers Working
.add("0", _0_Key_Dark)
.add("1", _1_Key_Dark)
.add("2", _2_Key_Dark)
.add("3", _3_Key_Dark)
.add("4", _4_Key_Dark)
.add("5", _5_Key_Dark)
.add("6", _6_Key_Dark)
.add("7", _7_Key_Dark)
.add("8", _8_Key_Dark)
.add("9", _9_Key_Dark)
.add("numpad 0", _0_Key_Dark)
.add("numpad 1", _1_Key_Dark)
.add("numpad 2", _2_Key_Dark)
.add("numpad 3", _3_Key_Dark)
.add("numpad 4", _4_Key_Dark)
.add("numpad 5", _5_Key_Dark)
.add("numpad 6", _6_Key_Dark)
.add("numpad 7", _7_Key_Dark)
.add("numpad 8", _8_Key_Dark)
.add("numpad 9", _9_Key_Dark)
.add("f1", F1_Key_Dark)
.add("f2", F2_Key_Dark)
.add("f3", F3_Key_Dark)
.add("f4", F4_Key_Dark)
.add("f5", F5_Key_Dark)
.add("f6", F6_Key_Dark)
.add("f7", F7_Key_Dark)
.add("f8", F8_Key_Dark)
.add("f9", F9_Key_Dark)
.add("f10", F10_Key_Dark)
.add("f11", F11_Key_Dark)
.add("f12", F12_Key_Dark)

// Arrow Keys Working
.add("arrow down", Arrow_Down_Key_Dark)
.add("arrow left", Arrow_Left_Key_Dark)
.add("arrow right", Arrow_Right_Key_Dark)
.add("arrow up", Arrow_Up_Key_Dark)

// Alphabet Working
.add("A", A_Key_Dark)
.add("B", B_Key_Dark)
.add("C", C_Key_Dark)
.add("D", D_Key_Dark)
.add("E", E_Key_Dark)
.add("F", F_Key_Dark)
.add("G", G_Key_Dark)
.add("H", H_Key_Dark)
.add("I", I_Key_Dark)
.add("J", J_Key_Dark)
.add("K", K_Key_Dark)
.add("L", L_Key_Dark)
.add("M", M_Key_Dark)
.add("N", N_Key_Dark)
.add("O", O_Key_Dark)
.add("P", P_Key_Dark)
.add("Q", Q_Key_Dark)
.add("R", R_Key_Dark)
.add("S", S_Key_Dark)
.add("T", T_Key_Dark)
.add("U", U_Key_Dark)
.add("V", V_Key_Dark)
.add("W", W_Key_Dark)
.add("X", X_Key_Dark)
.add("Y", Y_Key_Dark)
.add("Z", Z_Key_Dark)

// Special Keys Working
.add("backspace", Backspace_Key_Dark)
.add("shift", Shift_Key_Dark)
.add("left shift", Shift_Key_Dark)
.add("right shift", Shift_Key_Dark)
.add("space", Space_Key_Dark)
.add("tab", Tab_Key_Dark)
.add("insert", Insert_Key_Dark)
.add("home", Home_Key_Dark)
.add("end", End_Key_Dark)
.add("enter", Enter_Key_Dark)
.add("delete", Del_Key_Dark)
.add("ctrl", Ctrl_Key_Dark)
.add("left ctrl", Ctrl_Key_Dark)
.add("right ctrl", Ctrl_Key_Dark)
.add("escape", Esc_Key_Dark)
.add("page down", Page_Down_Key_Dark)
.add("page up", Page_Up_Key_Dark)
.add("alt", Alt_Key_Dark)
.add("left alt", Alt_Key_Dark)
.add("right alt", Alt_Key_Dark)

// Symbols Working
.add("[", Bracket_Left_Key_Dark)
.add("]", Bracket_Right_Key_Dark)
.add(",", Mark_Left_Key_Dark)
.add(".", Mark_Right_Key_Dark)
.add("/", Question_Key_Dark)
.add("'", Quote_Key_Dark)
.add(";", Semicolon_Key_Dark)
.add("\\", Backslash_Key_Dark)
.add("`", Tilda_Key_Dark)
.add("numpad /", Slash_Key_Dark)
.add("numpad +", Plus_Key_Dark)
.add("numpad -", Minus_Key_Dark)
.add("numpad *", Asterisk_Key_Dark)

// Mouse Working
.add("mouse button left", Mouse_Left_Key_Dark)
.add("mouse button middle", Mouse_Middle_Key_Dark)
.add("mouse button right", Mouse_Right_Key_Dark)
.add("mouse wheel up", Mouse_Middle_Scroll_Up_Dark)
.add("mouse wheel down", Mouse_Middle_Scroll_Down_Dark)
.add("mouse button back", Mouse_4_Key_Dark)
.add("mouse button forward", Mouse_5_Key_Dark)
.add("mouse button unknown", Mouse_Simple_Key_Dark)

#endregion

#region Gamepads
//Xbox One and Series S|X controllers
input_icons_gamepad(INPUT_GAMEPAD_TYPE_XBOX_ONE)
.add("gamepad face south",         XboxSeriesX_A)
.add("gamepad face east",          XboxSeriesX_B)
.add("gamepad face west",          XboxSeriesX_X)
.add("gamepad face north",         XboxSeriesX_Y)
.add("gamepad shoulder l",         XboxSeriesX_LB)
.add("gamepad shoulder r",         XboxSeriesX_RB)
.add("gamepad trigger l",          XboxSeriesX_LT)
.add("gamepad trigger r",          XboxSeriesX_RT)
.add("gamepad select",             XboxSeriesX_View)
.add("gamepad start",              XboxSeriesX_Menu)
.add("gamepad dpad left",          XboxSeriesX_Dpad_Left)
.add("gamepad dpad right",         XboxSeriesX_Dpad_Right)
.add("gamepad dpad up",            XboxSeriesX_Dpad_Up)
.add("gamepad dpad down",          XboxSeriesX_Dpad_Down)

.add("gamepad thumbstick l left",  XboxSeriesX_Left_Stick_Left)
.add("gamepad thumbstick l right", XboxSeriesX_Left_Stick_Right)
.add("gamepad thumbstick l up",    XboxSeriesX_Left_Stick_Up)
.add("gamepad thumbstick l down",  XboxSeriesX_Left_Stick_Down)
.add("gamepad thumbstick l click", XboxSeriesX_Left_Stick_Click)

.add("gamepad thumbstick r left",  XboxSeriesX_Right_Stick_Left)
.add("gamepad thumbstick r right", XboxSeriesX_Right_Stick_Right)
.add("gamepad thumbstick r up",    XboxSeriesX_Right_Stick_Up)
.add("gamepad thumbstick r down",  XboxSeriesX_Right_Stick_Down)
.add("gamepad thumbstick r click", XboxSeriesX_Right_Stick_Click)

//Series S|X only
.add("gamepad misc 1",             XboxSeriesX_Share)

#endregion
