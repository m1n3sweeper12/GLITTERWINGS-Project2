// commented this out to test collisions with just direction
// direction = image_angle; // Set direction to whichever way the sprite is facing


// Basic Movement
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Collision with wall
move_and_collide(_hor * walk_speed, _ver * walk_speed, obj_Wall, 5, 0, 0, walk_speed, walk_speed);

if (_hor != 0 or _ver != 0)
{
	// Sprite rotation based on movement direction
	if (_ver < 0) and (_hor < 0) { sprite_index = spriteNorthWest; } // Moving North West
	
	else if (_ver < 0) and (_hor > 0) { sprite_index = spriteNorthEast; } // Moving North East

	else if (_ver > 0) and (_hor < 0) { sprite_index = spriteSouthWest; } // Moving South West
	
	else if (_ver > 0) and (_hor > 0) { sprite_index = spriteSouthEast; } // Moving South East
	
	else if (_ver < 0) and (_hor = 0) { sprite_index = spriteNorth; } // Moving North
	
	else if (_ver > 0) and (_hor = 0) { sprite_index = spriteSouth; } // Moving South
	
	else if (_ver = 0) and (_hor > 0) { sprite_index = spriteEast; } // Moving East
	
	else if (_ver = 0) and (_hor < 0) { sprite_index = spriteWest; } // Moving West
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