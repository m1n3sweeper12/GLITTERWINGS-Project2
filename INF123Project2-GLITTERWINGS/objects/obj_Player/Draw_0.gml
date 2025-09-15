draw_self();

// draws bounding box of player
// for test purposes only
if(keyboard_check(vk_control)) {
	draw_set_color(c_blue);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}