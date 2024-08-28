// Click on some blank space
if (!position_meeting(mouse_x, mouse_y, oResolutionList)
	and (!position_meeting(mouse_x, mouse_y, oResolutionItem)))
{
    with (oResolutionItem)
    {
        instance_destroy();
    }
}