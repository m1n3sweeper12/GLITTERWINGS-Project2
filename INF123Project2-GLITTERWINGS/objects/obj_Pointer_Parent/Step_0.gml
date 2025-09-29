
// Follows the player

x = obj_Player.x;
y = obj_Player.y;

// Follows the mouse
direction = point_direction(x,y,mouse_x,mouse_y);
image_angle = direction;


if (mouse_check_button_pressed(mb_left))
{
	Attack()
}