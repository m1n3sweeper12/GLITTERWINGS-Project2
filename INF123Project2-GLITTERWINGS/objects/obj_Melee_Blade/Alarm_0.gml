if(instance_exists(obj_EnemyParent))
	{
		other.walk_speed = hold_enemy_walk_speed;
	}
	
obj_Player.walk_speed = hold_player_walk_speed;
obj_Player.can_swing = true;
is_hurting = false;
instance_destroy();


