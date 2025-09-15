// Basic enemy movement

// check if player is in range
if(instance_exists(obj_Player) and distance_to_object(obj_Player) < detection_range) alarm[0] = 1;

// uses methods to determine movement
var _hor = CheckHorMotion(target_x, y, 2);
var _ver = CheckVerMotion(x, target_y, 2);

move_and_collide(_hor*walk_speed, _ver*walk_speed, [obj_Wall,obj_EnemyParent], 4, 0, 0, walk_speed, walk_speed);
