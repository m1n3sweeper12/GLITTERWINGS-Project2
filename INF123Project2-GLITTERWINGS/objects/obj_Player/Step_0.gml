// commented this out to test collisions with just direction
// direction = image_angle; // Set direction to whichever way the sprite is facing


// Basic Movement
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Collision with wall
move_and_collide(_hor * walk_speed, _ver * walk_speed, obj_Wall, 4, 0, 0, walk_speed, walk_speed);

if (_hor != 0 or _ver != 0)
{
	// Sprite based on movement direction
	if (_ver < 0) and (_hor = 0) { sprite_index = spriteNorth; direction = 90;} // Moving North
	
	else if (_ver > 0) and (_hor = 0) { sprite_index = spriteSouth; direction = 270} // Moving South
	
	else if (_ver = 0) and (_hor > 0) { sprite_index = spriteEast; direction = 0;} // Moving East
	
	else if (_ver = 0) and (_hor < 0) { sprite_index = spriteWest; direction = 180;} // Moving West
	
	else if (_ver < 0) and (_hor < 0) { sprite_index = spriteNorthWest; direction = 135;} // Moving North West
	
	else if (_ver < 0) and (_hor > 0) { sprite_index = spriteNorthEast; direction = 45;} // Moving North East

	else if (_ver > 0) and (_hor < 0) { sprite_index = spriteSouthWest; direction = 225;} // Moving South West
	
	else if (_ver > 0) and (_hor > 0) { sprite_index = spriteSouthEast; direction = 315;} // Moving South East

}

//--------------------------------------------------------

// Switches between melee and ranged, using right click to change between the two. Feel free to change the control if need be.
if (mouse_check_button_pressed(mb_right))
{
	if(using_melee = true) // Change from melee to ranged.
		{
		using_melee = false;
		//with(obj_Pointer_Melee) instance_destroy();
		//instance_create_layer(x + 0, y + 0, "Instances", obj_Pointer_Ranged);
		//with(obj_Pointer_Melee) instance_destroy();
		}
		
	else if (using_melee = false) // Change from ranged to melee.
		{
		using_melee = true;
		//instance_create_layer(x + 0, y + 0, "Instances", obj_Pointer_Melee);
		//instance_create_layer(x + 0, y + 0, "Instances", obj_Pointer_Melee);
		//with(obj_Pointer_Ranged) instance_destroy();
		}
}

// Actually using the attacks
if (mouse_check_button_pressed(mb_left))
{
	if(using_melee = true and can_swing = true) // Melee Attacks
	{
		MeleeAttack()
	}
	
	else if (using_melee = false and can_shoot = true) // Ranged Attacks
	{
		RangedAttack()
	}
}

if (keyboard_check_pressed(ord("Q")))
{
	if (healing_potions > 0 and cur_health_points != max_health_points)
	{
		healing_potions--;
		cur_health_points += 40;
		if (cur_health_points >= max_health_points)
		{
			cur_health_points = max_health_points;
		}
	}
}