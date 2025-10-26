// determine level width and height
var level_width = random_range(16, 24);
var level_height = random_range(16, 24);

var tile_array;

// initialize every tile to empty space
for(var i = 0; i < level_width; i++) {
	for(var j = 0; j < level_height; j++) {
		tile_array[i][j] = -1;
	}
}


// determine main room's width and height
var main_room_width = floor(random_range(8, 12));
var main_room_height = floor(random_range(8, 12));

// use main room's size to determine main room left corner spawn point
var main_room_x = floor(random_range(1, level_width - main_room_width - 1));
var main_room_y = floor(random_range(1, level_height - main_room_height - 1));

// set all values of main room in array to tiles
for(var i = main_room_x; i < main_room_x + main_room_width; i++) {
	for(var j = main_room_y; j < main_room_y + main_room_height; j++) {
		tile_array[i][j] = 4;
	}
}

// determine number of side rooms
var side_rooms = ceil(random_range(0, 3));

// create variable to track whether player spawn has been added
var player_spawned = false;
var player_spawn = [0, 0];

// create side rooms
for(var i = 0; i < side_rooms; i++) {
	// initialize each side room in tile array
	var room_coords = initRoom(2, 2, level_width, level_height, tile_array); // calls function to initialize a 2x2 room
	
	// determine the x and y direction to get to the main room
	var dir_x = 0, dir_y = 0;
	
	if(room_coords[0] < main_room_x) {
		dir_x = 1;
	} else if(room_coords[0] > main_room_x + main_room_width) {
		dir_x = -1;
	} else {
		dir_x = 0;
	}
	
	if(room_coords[1] < main_room_y) {
		dir_y = 1;
	} else if(room_coords[1] > main_room_y + main_room_height) {
		dir_y = -1;
	} else {
		dir_y = 0;
	}
	
	// create variables to track hallway x and y
	var hall_x = room_coords[0];
	var hall_y = room_coords[1];
	
	if(not player_spawned) {
		player_spawn = [floor(random_range(1, level_width - 1)), floor(random_range(1, level_height - 1))];
		while(tile_array[player_spawn[0]][player_spawn[1]] != 4) {
			player_spawn = [floor(random_range(1, level_width - 1)), floor(random_range(1, level_height - 1))];
		}
		tile_array[player_spawn[0]][player_spawn[1]] = 2;
		show_debug_message(string_concat("player_x: ", obj_Player.x, " | player_y: ", obj_Player.y));
		player_spawned = true;
	}
	
	// create variables for target x and y
	var target_x = 0, target_y = 0;
	
	if(dir_x == 1) { // approaching left of room
		target_x = main_room_x;
	} else if(dir_x == -1) { // approaching right of room
		target_x = main_room_x + main_room_width;
	} else { // if room and main room are horizontally parallel, no need to change x
		target_x = hall_x;
	}
	
	if(dir_y == 1) { // approaching top of room
		target_y = main_room_y;
	} else if(dir_y == -1) { // approaching bottom of room
		target_y = main_room_y + main_room_height;
	} else { // if room and main room are vertically parallel, no need to change y
		target_y = hall_y;
	}
	
	// change tile values until targets reached
	while(target_x != hall_x || target_y != hall_y) {
		
		var x_changed = false;
		var y_changed = false;
		
		if(target_x != hall_x && not y_changed) {
			hall_x += dir_x;
			x_changed = true;
		}
		
		if(target_y != hall_y && not x_changed) {
			y_changed = true;
			hall_y += dir_y;
		}
		
		tile_array[hall_x][hall_y] = 4;
	}
}





// TEMP
// replace tiles in Tiles_1 layer with blank tiles
// TODO: change tiles from blank to appropriate tile layouts
// likely will need GIANT switch statement
var _layer_id = layer_get_id("Tiles_1");
var _tilemap_id = layer_tilemap_get_id(_layer_id);

var _tile_width = 128;
var _tile_height = 128;

for (var _yy = 0; _yy < array_length(tile_array); _yy++)
{
    for (var _xx = 0; _xx < array_length(tile_array[0]); _xx++)
    {
        var _tile_index = tile_array[_yy][_xx];
        if (_tile_index != -1)
        {
			if(_tile_index == 1) {
				tilemap_set(_tilemap_id, 1, _xx, _yy);
			} else if(_tile_index == 2) {
				obj_Player.x = _xx*128;
				obj_Player.y = _yy*128;
				tilemap_set(_tilemap_id, 47, _xx, _yy);
			} else {
				tilemap_set(_tilemap_id, 47, _xx, _yy);
			}
        }
    }
}

// function to initialize room
function initRoom(rm_width, rm_height, level_width, level_height, tile_array) {
	var works = false;
	var rm_x, rm_y;
	while(not works) {
		works = true;
		// generate potential x and y
		rm_x = floor(random_range(1, level_width - rm_width - 1));
		rm_y = floor(random_range(1, level_height - rm_height - 1));
	
		// check that room space is unoccupied
		for(var i = rm_x; i < rm_x + rm_width; i++) {
			for(var j = rm_y; j < rm_y + rm_height; j++) {
				if(tile_array[i][j] == 4) {
					// if any space already has a tile, doesn't work, break loop
					works = false;
					break;
				}
			}
		}
	}
	
	// fill room tiles
	for(var i = rm_x; i < rm_x + rm_width; i++) {
		for(var j = rm_y; j < rm_y + rm_height; j++) {
			tile_array[i][j] = 4;
		}
	}
	
	// return x and y coordinates for room
	var coords = [rm_x, rm_y];
	
	return coords;
}
