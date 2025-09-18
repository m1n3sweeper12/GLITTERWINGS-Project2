// Creating basic stats: (All are placeholder values)

health_points = 50;
loot_mod = 1;
walk_speed = 5;

melee_speed = 1;
melee_reach = 1;
melee_damage = 1;

ranged_speed = 1;
ranged_reach = 8; // How far you can shoot.
ranged_damage = 10;

// Simple Setup

using_melee = true; //sets the attack type. true = using melee, false = using ranged.


function MeleeAttack()
{
	//Code here
}

function RangedAttack()
{
	instance_create_layer(x + 0, y + 0, "Instances", obj_Projectile_Parent);
}

