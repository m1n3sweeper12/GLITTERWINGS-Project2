// Basic enemy movement

var _hor = clamp(target_x - x, -1, 1);
var _ver = clamp(target_y - y, -1, 1);

move_and_collide(_hor * walk_speed, _ver * walk_speed, [obj_Wall,obj_EnemyParent], 5, 0, 0, walk_speed, walk_speed);