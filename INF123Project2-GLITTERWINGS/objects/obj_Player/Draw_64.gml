draw_healthbar(x + -32, y + 80, x + 32, y + 64, cur_health_points, $FF7F7F7F & $FFFFFF, $FF0000FF & $FFFFFF, $FF00FF00 & $FFFFFF, 0, (($FF7F7F7F>>24) != 0), (($FF000000>>24) != 0));

draw_set_colour(c_white);
draw_text(4, 2, $"Gold: {gold}");
draw_text(4, 18, $"Pots: {healing_potions}");
