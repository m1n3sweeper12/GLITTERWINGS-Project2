character = 0; //Set your character here


// Switches between characters
switch(character)
{
	// Fighter Badger
	case 0:
	with(obj_Player) {
		
		//sets up character sprites
		
		spriteNorth = spr_Fighter_North;
		spriteEast = spr_Fighter_East;
		spriteSouth = spr_Fighter_South;
		spriteWest = spr_Fighter_West;
		spriteNorthEast = spr_Fighter_NorthEast;
		spriteNorthWest = spr_Fighter_NorthWest;
		spriteSouthEast = spr_Fighter_SouthEast;
		spriteSouthWest = spr_Fighter_SouthWest;
		
		sprite_index = spr_Fighter_East;
		image_index = 0;
		}
	break;

	// Ranger Fox
	case 1:
	with(obj_Player) {
		
		spriteNorth = spr_Ranger_North;
		spriteEast = spr_Ranger_East;
		spriteSouth = spr_Ranger_South;
		spriteWest = spr_Ranger_West;
		spriteNorthEast = spr_Ranger_NorthEast;
		spriteNorthWest = spr_Ranger_NorthWest;
		spriteSouthEast = spr_Ranger_SouthEast;
		spriteSouthWest = spr_Ranger_SouthWest;
		
		sprite_index = spr_Ranger_East;
		image_index = 0;
		}
	break;

	// Rogue Raccoon
	case 2:
	with(obj_Player) {
		
		spriteNorth = spr_Rogue_North;
		spriteEast = spr_Rogue_East;
		spriteSouth = spr_Rogue_South;
		spriteWest = spr_Rogue_West;
		spriteNorthEast = spr_Rogue_NorthEast;
		spriteNorthWest = spr_Rogue_NorthWest;
		spriteSouthEast = spr_Rogue_SouthEast;
		spriteSouthWest = spr_Rogue_SouthWest;
		
		sprite_index = spr_Rogue_East;
		image_index = 0;
		}
	break;

	// Wizard Cat
	case 3:
	with(obj_Player) {
		
		spriteNorth = spr_Wizard_North;
		spriteEast = spr_Wizard_East;
		spriteSouth = spr_Wizard_South;
		spriteWest = spr_Wizard_West;
		spriteNorthEast = spr_Wizard_NorthEast;
		spriteNorthWest = spr_Wizard_NorthWest;
		spriteSouthEast = spr_Wizard_SouthEast;
		spriteSouthWest = spr_Wizard_SouthWest;
		
		sprite_index = spr_Wizard_East;
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