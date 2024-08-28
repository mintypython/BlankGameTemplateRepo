// Click on some blank space
if (!position_meeting(mouse_x, mouse_y, oLanguageList)
	and (!position_meeting(mouse_x, mouse_y, oLanguageItem)))
{
    with (oLanguageItem)
    {
        instance_destroy();
    }
}