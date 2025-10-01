
if (keyboard_check_pressed(ord("E")) and not opened)
{
	sprite_index = spr_ChestOpen;
	image_index = 0;
	
	alarm[0] = 60; // wait 1 second to destroy
	
	audio_play_sound(sfx_OpenChest, 1, false);
	
	opened = true;
} else if(opened) {
	sprite_index = spr_ChestOpen;
} else {
	sprite_index = spr_ChestHover;
}