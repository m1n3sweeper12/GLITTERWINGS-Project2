// Creating basic stats: (All are placeholder values)

// This object is the parrent for every other enemy in the game.

health_points = 50;
loot_mod = 1;
walk_speed = 5;

melee_speed = 1;
melee_reach = 1;
melee_speed = 1;

ranged_speed = 1;
ranged_reach = 1;
ranged_damage = 1;



//-----------------------------------------

// This is the basic pathfinding initialization

idle_time = 60; // How long the enemy stays idle for.
detection_range = 256; // How far away the player has to be before being detected
wander_range = 128; // How far away the enemy will wander when the player is not found

target_x = x;
target_y = y;

alarm[0] = idle_time;