// Creating basic stats: (All are placeholder values)

// This object is the parent for every other enemy in the game.

health_points = 50;
loot_mod = 1;
walk_speed = 2; // walk speed when idle

melee_speed = 1;
melee_reach = 1;
melee_speed = 1;

ranged_speed = 1;
ranged_reach = 1;
ranged_damage = 1;

//-----------------------------------------

// This is the basic pathfinding initialization

idle_time = 180; // How long the enemy stays idle for.
detection_range = 256; // How far away the player has to be before being detected
wander_range = 128; // How far away the enemy will wander when the player is not found
wander_margin = 30;

target_x = x;
target_y = y;

alarm[0] = 1;

// function returns the horizontal direction (-1, 1, or 0) for x that gets the enemy closer to a point
function CheckHorMotion(point_x, point_y, margin) {
	// check if x is within margin (prevents jittering)
	if(round(point_distance(x, y, point_x, point_y)) > margin) {
		// check if target x is more or less than x, set values accordingly
		if(x > point_x) {
			return -1;
		} else if(x < point_x) {
			return 1;
		} else {
			return 0;
		}
	} else {
		return 0;
	}
}

// // function returns the horizontal direction (-1, 1, or 0) for y that gets the enemy closer to a point
function CheckVerMotion(point_x, point_y, margin) {
	if(round(point_distance(x, y, point_x, point_y)) > margin) {
		if(y > point_y) {
			return -1;
		} else if(y < point_y) {
			return 1;
		} else {
			return 0;
		}
	} else {
		return 0;
	}
}