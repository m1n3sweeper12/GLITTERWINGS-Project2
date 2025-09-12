character = 0; //Set your character here


// Switches between characters
switch(character)
{
	// Fighter Badger
	case 0:
	with(obj_Player) {
		sprite_index = spr_Fighter;
		image_index = 0;
		}
	break;

	// Ranger Fox
	case 1:
	with(obj_Player) {
		sprite_index = spr_Ranger;
		image_index = 0;
		}
	break;

	// Rogue Raccoon
	case 2:
	with(obj_Player) {
		sprite_index = spr_Rogue;
		image_index = 0;
		}
	break;

	// Wizard Cat
	case 3:
	with(obj_Player) {
		sprite_index = spr_Wizard;
		image_index = 0;
		}
	break;

	default:
	with(obj_Player) {
		sprite_index = spr_Experiment;
		image_index = 0;
		}
	break;
}