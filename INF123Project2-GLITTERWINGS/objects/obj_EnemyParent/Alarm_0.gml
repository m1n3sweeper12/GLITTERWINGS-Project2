if(instance_exists(obj_Player) and distance_to_object(obj_Player) < detection_range) {
	// increase walk speed
	walk_speed = 3;
	
	// set target x and y to player x and y
	target_x = obj_Player.x;
	target_y = obj_Player.y;
	
	// follows player until player is reached or out of range
	alarm[0] = 1;
} else {
	// randomly set target x and target y
	while(abs(target_x - x) < wander_range - wander_margin) {
		target_x = random_range(x - wander_range, x + wander_range);
	}
	
	while(abs(target_y - y) < wander_range - wander_margin) {
		target_y = random_range(y - wander_range, y + wander_range);
	}
	
	// don't change targets for idle_time
	alarm[0] = idle_time;
}