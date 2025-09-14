
// Checks to see if player is in range. If they are, go towards them, otherwise wander.
if (instance_exists(obj_Player) and distance_to_object(obj_Player) < detection_range)
{
	target_x = obj_Player.x;
	target_y = obj_Player.y;
}
else
{
	target_x = random_range(xstart - wander_range, xstart + wander_range);
	target_y = random_range(ystart - wander_range, ystart + wander_range);
}

alarm[0] = idle_time;