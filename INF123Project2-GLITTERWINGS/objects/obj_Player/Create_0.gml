// Creating basic stats: (All are placeholder values)

max_health_points = 100;
cur_health_points = max_health_points;
loot_mod = 1;
walk_speed = 5;

melee_speed = 1;
melee_reach = 1;
melee_damage = 10;

ranged_speed = 1;
ranged_reach = 8; // How far you can shoot.
ranged_damage = 10;

// Simple Setup

using_melee = true; //sets the attack type. true = using melee, false = using ranged.
can_shoot = true; // Checks if you can shoot ranged
can_swing = true; // Checks if you can swing melee

gold = 0;
healing_potions = 0;

function MeleeAttack()
{
	instance_create_layer(x + 0, y + 0, "Instances", obj_Melee_Blade);
}

function RangedAttack()
{
	instance_create_layer(x + 0, y + 0, "Instances", obj_Projectile_Firebolt);
}