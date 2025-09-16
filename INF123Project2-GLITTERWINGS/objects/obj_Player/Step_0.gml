// commented this out to test collisions with just direction
// direction = image_angle; // Set direction to whichever way the sprite is facing


// Basic Movement
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Collision with wall
var tilemap = layer_tilemap_get_id("Tiles_1")
move_and_collide(_hor * walk_speed, _ver * walk_speed, tilemap, 5, 0, 0, walk_speed, walk_speed);

if (_hor != 0 or _ver != 0)
{
	// Sprite rotation based on movement direction
	if (_ver < 0) and (_hor < 0) { sprite_index = spriteNorthWest; direction = 135;} // Moving North West
	
	else if (_ver < 0) and (_hor > 0) { sprite_index = spriteNorthEast; direction = 45;} // Moving North East

	else if (_ver > 0) and (_hor < 0) { sprite_index = spriteSouthWest; direction = 225;} // Moving South West
	
	else if (_ver > 0) and (_hor > 0) { sprite_index = spriteSouthEast; direction = 315;} // Moving South East
	
	else if (_ver < 0) and (_hor = 0) { sprite_index = spriteNorth; direction = 90;} // Moving North
	
	else if (_ver > 0) and (_hor = 0) { sprite_index = spriteSouth; direction = 270} // Moving South
	
	else if (_ver = 0) and (_hor > 0) { sprite_index = spriteEast; direction = 0;} // Moving East
	
	else if (_ver = 0) and (_hor < 0) { sprite_index = spriteWest; direction = 180;} // Moving West
}

//--------------------------------------------------------

// Switches between melee and ranged, using right click to change between the two. Feel free to change the control if need be.
if (mouse_check_button_pressed(mb_right))
{
	if(using_melee = true) 
	
		{ using_melee = false; }
		
	else if (using_melee = false)
	
		{ using_melee = true; }
}

// If you left click, it uses the attack. The attack functions are stored in the Create event. Feel free to change the control if need be.
if (mouse_check_button_pressed(mb_left))
{
	if (using_melee = true)
	{
		MeleeAttack();
	}
	else if (using_melee = false)
	{
		RangedAttack();
	}
	
}