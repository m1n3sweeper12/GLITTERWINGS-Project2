
draw_set_colour(c_white);
draw_text(4, 2, $"Gold: {gold}");
draw_text(4, 18, $"Pots: {healing_potions}");

// draws box around mini-map
draw_set_color(c_black);
// top line
draw_line_width(1030, 10, 1270, 10, 5);
// bottom line
draw_line_width(1030, 190, 1270, 190, 5);
// left line
draw_line_width(1030, 10, 1030, 190, 5);
// right line
draw_line_width(1270, 10, 1270, 190, 5);
