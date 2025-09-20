if(instance_exists(obj_EnemyParent))
	{
		obj_EnemyParent.walk_speed = hold_enemy_walk_speed;
	}
	
obj_Player.walk_speed = hold_player_walk_speed;
obj_Player.can_swing = true;
instance_destroy();


