direction = point_direction(x,y,mouse_x,mouse_y);
image_angle = direction;

audio_play_sound(sfx_SwordSwing, 1, false);

is_hurting = true;

obj_Player.can_swing = false;

hold_player_walk_speed = obj_Player.walk_speed;
obj_Player.walk_speed = obj_Player.walk_speed/1.2;

if(instance_exists(obj_EnemyParent))
	{
		hold_enemy_walk_speed = obj_EnemyParent.walk_speed;
	}

alarm_set(0, obj_Player.melee_speed) // Sets the destroy alarm. Second number is how long the animation is (Will change)