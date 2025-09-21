if (keyboard_check_pressed(ord("E")))
{
	obj_Player.gold += gold_count;
	obj_Player.healing_potions += potion_count;
	instance_destroy();
}

