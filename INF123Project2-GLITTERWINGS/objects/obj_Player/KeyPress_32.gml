if(obj_Player.cur_health_points < obj_Player.max_health_points) {
	obj_Player.cur_health_points += 10;
	obj_Player.healing_potions--;
	audio_play_sound(sfx_Drink, 1, false);
}