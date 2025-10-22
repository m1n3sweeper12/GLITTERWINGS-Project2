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
var main_room_width = random_range(8, 12);
var main_room_height = random_range(8, 12);

// use main room's size to determine main room left corner spawn point
var main_room_x = random_range(1, level_width - main_room_width - 1);
var main_room_y = random_range(1, level_height - main_room_height - 1);

// set all values of main room in array to tiles
for(var i = main_room_x; i < main_room_x + main_room_width; i++) {
	for(var j = main_room_y; j < main_room_y + main_room_height; j++) {
		tile_array[i][j] = 4;
	}
}

// determine number of side rooms
var side_rooms = random_range(0, 3);

// initialize each side room in tile array
for(var i = 0; i < side_rooms; i++) {
	initRoom(2, 2, level_width, level_height, tile_array); // calls function to initialize a 2x2 room
}

function initRoom(rm_width, rm_height, level_width, level_height, tile_array) {
	var works = true;
	var rm_x, rm_y;
	while(works) {
		// generate potential x and y
		rm_x = random_range(1, level_width - rm_width - 1);
		rm_y = random_range(1, level_height - rm_height - 1);
	
		// check that room space is unoccupied
		for(var i = rm_x; i < rm_x + rm_width; i++) {
			for(var j = rm_y; j < rm_y + rm_height; j++) {
				if(tile_array[i][j] == 4) {
					works = false;
					break;
				}
			}
		}
	}
	
	for(var i = rm_x; i < rm_x + rm_width; i++) {
		for(var j = rm_y; j < rm_y + rm_height; j++) {
			tile_array[i][j] = 4;
		}
	}
}

show_debug_message(tile_array);

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
            tilemap_set(_tilemap_id, 1, _xx, _yy);
        }
    }
}