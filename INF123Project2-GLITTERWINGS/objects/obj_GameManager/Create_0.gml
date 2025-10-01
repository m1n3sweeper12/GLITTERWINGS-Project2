character = obj_Menu.character; //Set your character here

// starts background music
if(room == Room1) {
	audio_play_sound(sfx_BackgroundMusic, 2, true);
}

// Switches between characters

show_debug_message("got here");

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
		
		spriteIdleNorth = spr_Rogue_Idle_North;
		spriteIdleEast = spr_Rogue_Idle_East;
		spriteIdleSouth = spr_Rogue_Idle_South;
		spriteIdleWest = spr_Rogue_Idle_West;
		spriteIdleNorthEast = spr_Rogue_Idle_NorthEast;
		spriteIdleNorthWest = spr_Rogue_Idle_NorthWest;
		spriteIdleSouthEast = spr_Rogue_Idle_SouthEast;
		spriteIdleSouthWest = spr_Rogue_Idle_SouthWest;
		
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
		
		spriteIdleNorth = spr_Wizard_Idle_North;
		spriteIdleEast = spr_Wizard_Idle_East;
		spriteIdleSouth = spr_Wizard_Idle_South;
		spriteIdleWest = spr_Wizard_Idle_West;
		spriteIdleNorthEast = spr_Wizard_Idle_NorthEast;
		spriteIdleNorthWest = spr_Wizard_Idle_NorthWest;
		spriteIdleSouthEast = spr_Wizard_Idle_SouthEast;
		spriteIdleSouthWest = spr_Wizard_Idle_SouthWest;
		
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