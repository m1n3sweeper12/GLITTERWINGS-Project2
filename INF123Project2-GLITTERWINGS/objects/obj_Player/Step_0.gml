direction = image_angle; // Set direction to whichever way the sprite is facing


// Basic Movement
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Collision with wall
move_and_collide(_hor * walk_speed, _ver * walk_speed, obj_Wall);

if (_hor != 0 or _ver != 0)
{
	// Sprite rotation based on movement direction
	if (_ver < 0) and (_hor = 0) { image_angle = 90; } // Moving up
	
	else if (_ver > 0) and (_hor = 0) { image_angle = 270; } // Moving down
	
	else if (_ver = 0) and (_hor > 0) { image_angle = 0; } // Moving right
	
	else if (_ver = 0) and (_hor < 0) { image_angle = 180; } // Moving left
	
	// Diagonals broke hitboxes but here's the code if you want it:
	
	/* 
	else if (_ver < 0) and (_hor < 0) { image_angle = 135; } // Moving up and left
	
	else if (_ver < 0) and (_hor > 0) { image_angle = 45; } // Moving up and right

	else if (_ver > 0) and (_hor < 0) { image_angle = 225; } // Moving down and left
	
	else if (_ver > 0) and (_hor > 0) { image_angle = 315; } // Moving down and right
	*/
}