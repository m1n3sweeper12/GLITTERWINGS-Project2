draw_self();

// draws bounding box of player
// for test purposes only
if(keyboard_check(vk_control)) {
	draw_set_color(c_aqua);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
	
		// Draw Path
	draw_set_color(c_maroon);
	draw_line(x, y, mouse_x, mouse_y);
}