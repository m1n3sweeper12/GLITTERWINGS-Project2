// Calls the attack function
function Attack()
{
	if(obj_Player.using_melee = true) // Melee Attacks
	{
		// Code Here
	}
	
else if (obj_Player.using_melee = false) // Ranged Attacks
	{
		instance_create_layer(x + 0, y + 0, "Instances", obj_ProjectileParent);
	}
}
	

