// Creating basic stats: (All are placeholder values)

max_health_points = 100;
cur_health_points = max_health_points;
loot_mod = 1;
walk_speed = 3;

melee_speed = 10; // How long the weapon attack is
melee_recharge = 10; // How long it takes to use swing again
melee_reach = 1; // CONDEMNED
melee_damage = 10; // How much damage the melee does.

ranged_speed = 8; // How fast the projectiles are
ranged_recharge = 10; // How long it takes to shoot again
ranged_reach = 4; // How far you can shoot.
ranged_damage = 10; // How much damage the projectiles do

// Simple Setup

using_melee = true; //sets the attack type. true = using melee, false = using ranged.
can_shoot = true; // Checks if you can shoot ranged
can_swing = true; // Checks if you can swing melee

gold = 0;
healing_potions = 0;

//Attack Functions

function MeleeAttack()
{
	instance_create_layer(x + 0, y + 0, "Instances", objectMelee);
	alarm_set(0, melee_speed + melee_recharge)
}

function RangedAttack()
{
	instance_create_layer(x + 0, y + 0, "Instances", objectProjectile);
	alarm_set(0, ranged_speed + ranged_recharge)
}