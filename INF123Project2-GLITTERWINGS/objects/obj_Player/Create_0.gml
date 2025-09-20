/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 52C6A2F2
/// @DnDArgument : "code" "// Creating basic stats: (All are placeholder values)$(13_10)$(13_10)health_points = 50;$(13_10)loot_mod = 1;$(13_10)walk_speed = 5;$(13_10)$(13_10)melee_speed = 1;$(13_10)melee_reach = 1;$(13_10)melee_damage = 10;$(13_10)$(13_10)ranged_speed = 1;$(13_10)ranged_reach = 8; // How far you can shoot.$(13_10)ranged_damage = 10;$(13_10)$(13_10)// Simple Setup$(13_10)$(13_10)using_melee = true; //sets the attack type. true = using melee, false = using ranged.$(13_10)can_shoot = true; // Checks if you can shoot ranged$(13_10)can_swing = true; // Checks if you can swing melee$(13_10)$(13_10)function MeleeAttack()$(13_10){$(13_10)	instance_create_layer(x + 0, y + 0, "Instances", obj_Melee_Parent);$(13_10)}$(13_10)$(13_10)function RangedAttack()$(13_10){$(13_10)	instance_create_layer(x + 0, y + 0, "Instances", obj_Projectile_Parent);$(13_10)}$(13_10)$(13_10)$(13_10)"
// Creating basic stats: (All are placeholder values)

health_points = 50;
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

function MeleeAttack()
{
	instance_create_layer(x + 0, y + 0, "Instances", obj_Melee_Parent);
}

function RangedAttack()
{
	instance_create_layer(x + 0, y + 0, "Instances", obj_Projectile_Parent);
}