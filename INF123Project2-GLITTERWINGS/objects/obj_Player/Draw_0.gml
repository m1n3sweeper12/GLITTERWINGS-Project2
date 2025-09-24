draw_self();

draw_healthbar(x + -16, y + 40, x + 16, y + 32, cur_health_points, $FF7F7F7F & $FFFFFF, $FF0000FF & $FFFFFF, $FF00FF00 & $FFFFFF, 0, (($FF7F7F7F>>24) != 0), (($FF000000>>24) != 0));


// draws bounding box of player
// for test purposes only
if(keyboard_check(vk_control)) {
	draw_set_color(c_blue);
	draw_ellipse(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}