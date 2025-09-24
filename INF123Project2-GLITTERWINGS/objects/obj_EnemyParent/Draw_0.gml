draw_self();

// draws bounding box of enemy and it's pathfinding
// for test purposes only
if(keyboard_check(vk_control)) {
	
	// Draw Hitbox
	draw_set_color(c_red);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	
	// Draw Path
	draw_set_color(c_orange);
	draw_line(x, y, target_x, target_y);
	
	// Draw detection circle
	draw_set_color(c_lime);
	draw_ellipse(x - detection_range, y - detection_range, x + detection_range, y + detection_range, true);
	
	// Draw wander range
	draw_set_color(c_navy);
	draw_ellipse(x - wander_range, y - wander_range, x + wander_range, y + wander_range, true);
	
	// Draw wander range minimum
	draw_ellipse(x - wander_range + wander_margin, y - wander_range + wander_margin,
				x + wander_range - wander_margin, y + wander_range - wander_margin, true);
}

draw_healthbar(x + -32, y + 80, x + 32, y + 64, cur_health_points, $FF7F7F7F & $FFFFFF, $FF0000FF & $FFFFFF, $FF00FF00 & $FFFFFF, 0, (($FF7F7F7F>>24) != 0), (($FF000000>>24) != 0));