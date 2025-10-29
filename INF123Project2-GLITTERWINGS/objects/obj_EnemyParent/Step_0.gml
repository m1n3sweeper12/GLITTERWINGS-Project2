// Basic enemy movement

// check if player is in range
if(instance_exists(obj_Player) and distance_to_object(obj_Player) < detection_range) alarm[0] = 1;

// uses methods to determine movement
var _hor = CheckHorMotion(target_x, y, 2);
var _ver = CheckVerMotion(x, target_y, 2);

if (_hor != 0 or _ver != 0)
{
	// Sprite rotation based on movement direction
	if (_ver < 0) and (_hor = 0) { sprite_index = spr_Armor_North;} // Moving North
	
	else if (_ver > 0) and (_hor = 0) { sprite_index = spr_Armor_South;} // Moving South
	
	else if (_ver = 0) and (_hor > 0) { sprite_index = spr_Armor_East;} // Moving East
	
	else if (_ver = 0) and (_hor < 0) { sprite_index = spr_Armor_West;} // Moving West
	
	/*
	else if (_ver < 0) and (_hor < 0) { sprite_index = spr_Armor_NorthWest;} // Moving North West
	
	else if (_ver < 0) and (_hor > 0) { sprite_index = spr_Armor_NorthEast;} // Moving North East

	else if (_ver > 0) and (_hor < 0) { sprite_index = spr_Armor_SouthWest;} // Moving South West
	
	else if (_ver > 0) and (_hor > 0) { sprite_index = spr_Armor_SouthEast;} // Moving South East
	*/

}

move_and_collide(_hor*walk_speed, _ver*walk_speed, [obj_Wall,obj_EnemyParent/*,obj_Player*/], 4, 0, 0, walk_speed, walk_speed);

if (cur_health_points <= 0)
{
	instance_destroy();
}