direction = point_direction(x,y,mouse_x,mouse_y);
image_angle = direction;

obj_Player.can_swing = false;

hold_player_walk_speed = obj_Player.walk_speed;
obj_Player.walk_speed = obj_Player.walk_speed/2;

if(instance_exists(obj_EnemyParent))
	{
		hold_enemy_walk_speed = obj_EnemyParent.walk_speed;
	}

if (instance_place(x, y, obj_EnemyParent) > 0)
	{
		obj_EnemyParent.walk_speed = obj_EnemyParent.walk_speed/2;
		obj_EnemyParent.cur_health_points = obj_EnemyParent.cur_health_points - obj_Player.melee_damage;
	}

alarm_set(0, 10) // Sets the destroy alarm. Second number is how long the animation is (Will change)