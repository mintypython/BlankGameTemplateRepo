// Click on some blank space
if (!position_meeting(mouse_x, mouse_y, oDifficultyList)
	and (!position_meeting(mouse_x, mouse_y, oDifficultyItem)))
{
    with (oDifficultyItem)
    {
        instance_destroy();
    }
}