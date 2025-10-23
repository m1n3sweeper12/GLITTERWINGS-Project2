if (is_hurting = true)
	{
		other.walk_speed = other.walk_speed/2;
		other.cur_health_points = other.cur_health_points - obj_Player.melee_damage;
		is_hurting = false;
	}
