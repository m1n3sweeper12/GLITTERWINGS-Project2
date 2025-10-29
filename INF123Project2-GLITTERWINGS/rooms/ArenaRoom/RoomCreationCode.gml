// create an instance of the game manager object
instance_create_layer(0, 0, "Instances", obj_GameManager);

/*
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
	var room_coords = initRoom(random_range(1, 3), random_range(1, 3), level_width, level_height, tile_array); // calls function to initialize a 2x2 room
	
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
	
	// determine player spawn point
	if(not player_spawned) {
		player_spawn = [floor(random_range(1, level_width - 1)), floor(random_range(1, level_height - 1))];
		while(tile_array[player_spawn[0]][player_spawn[1]] != 4) {
			player_spawn = [floor(random_range(1, level_width - 1)), floor(random_range(1, level_height - 1))];
		}
		tile_array[player_spawn[0]][player_spawn[1]] = 48;
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

// create next room portal
var far_point = 0;
var next_spawn_x = 0, next_spawn_y = 0;

for(var i = 0; i < level_width; i++) {
	for(var j = 0; j < level_height; j++) {
		if(tile_array[i][j] != -1 && point_distance(i, j, player_spawn[0], player_spawn[1]) > far_point) {
			next_spawn_x = i;
			next_spawn_y = j;
			far_point = point_distance(i, j, player_spawn[0], player_spawn[1]);
		}
	}
}

// add next room portal spawn to tile array
tile_array[next_spawn_x][next_spawn_y] = 49;

// spawn enemies

var enemy_count = random_range(2, 5);

while(enemy_count > 0) {
	for(var i = 0; i < main_room_width; i++) {
		for(var j = 0; j < main_room_height; j++) {
			var check = floor(random_range(1, 100));
			if(check == 50) { // 1 in 100 chance of spawning armor at any given point in main room
				instance_create_layer(main_room_x*128 + i*128, main_room_y*128 + j*128, "Instances", obj_EnemyParent);
				enemy_count--;
			} else if(check == 52) { // 1 in 100 chance of spawning golem at any given point in main room
				instance_create_layer(main_room_x*128 + i*128, main_room_y*128 + j*128, "Instances", obj_EnemyGolem)
				enemy_count--;
			}
		}
	}
}

// spawn player, chests, exit room
for(var i = 0; i < level_width; i++) {
	for(var j = 0; j < level_height; j++) {
		if(tile_array[i][j] == 48) {
			obj_Player.x = j*128;
			obj_Player.y = i*128;
			tile_array[i][j] = 4;
		} else if(tile_array[i][j] == 49) {
			instance_create_layer(j*128, i*128, "Instances", obj_NextRoom);
			tile_array[i][j] = 4;
		} else if(tile_array[i][j] == 50) {
			instance_create_layer(j*128, i*128, "Instances", obj_Chest);
			tile_array[i][j] = 4;
		}
	}
}

// fix tile blocking
for(var i = 0; i < level_width; i++) {
	for(var j = 0; j < level_height; j++) {
		if(tile_array[i][j] == 4) { // tile found
			// remove any inaccessible tiles
			if(tile_array[i][j - 1] == -1 && tile_array[i][j + 1] == -1 && tile_array[i - 1][j] == -1 && tile_array[i + 1][j] == -1) {
				tile_array[i][j] = -1;
			}
			
			else if(
			tile_array[i - 1][j - 1] == -1 && tile_array[i][j - 1] == -1 && tile_array[i + 1][j - 1] == -1 &&
			tile_array[i - 1][j] == -1 && tile_array[i + 1][j] == -1 &&
			tile_array[i - 1][j + 1] == -1 && tile_array[i][j + 1] == -1 && tile_array[i + 1][j + 1] == -1) {
				tile_array[i][j] = 46;
			}
			
			else if(tile_array[i - 1][j] == -1 && tile_array[i + 1][j] == -1 && tile_array[i][j - 1] != -1 && tile_array[i][j + 1] == -1) {
				tile_array[i][j] = 45;
			}
			
			else if(tile_array[i - 1][j] != -1 && tile_array[i + 1][j] == -1 && tile_array[i][j - 1] == -1 && tile_array[i][j + 1] == -1) {
				tile_array[i][j] = 44;
			}
			
			else if(tile_array[i - 1][j] != -1 && tile_array[i + 1][j] != -1 && tile_array[i][j - 1] == -1 && tile_array[i][j + 1] == -1) {
				tile_array[i][j] = 32;
			}
			
			else if(tile_array[i - 1][j] == -1 && tile_array[i + 1][j] == -1 && tile_array[i][j - 1] != -1 && tile_array[i][j + 1] != -1) {
				tile_array[i][j] = 33;
			}
			
			else if(tile_array[i][j - 1] != -1 && tile_array[i - 1][j] != -1 && tile_array[i + 1][j] != -1 && tile_array[i][j + 1] == -1) {
				tile_array[i][j] = 24;
			}
			
			else if(tile_array[i][j - 1] != -1 && tile_array[i - 1][j] != -1 && tile_array[i + 1][j] == -1 && tile_array[i][j + 1] != -1) {
				tile_array[i][j] = 28;
			}
			
			else if(tile_array[i][j - 1] != -1 && tile_array[i - 1][j] == -1 && tile_array[i + 1][j] != -1 && tile_array[i][j + 1] != -1) {
				tile_array[i][j] = 20;
			}
			
			else if(tile_array[i][j - 1] == -1 && tile_array[i - 1][j] != -1 && tile_array[i + 1][j] != -1 && tile_array[i][j + 1] != -1) {
				tile_array[i][j] = 16;
			}
			
			else if(tile_array[i - 1][j] == -1 && tile_array[i][j + 1] == -1 && tile_array[i][j - 1] != -1 && tile_array[i + 1][j] != -1) {
				tile_array[i][j] = 36;
			}
			
			else if(tile_array[i - 1][j] != -1 && tile_array[i][j + 1] != -1 && tile_array[i][j - 1] == -1 && tile_array[i + 1][j] == -1) {
				tile_array[i][j] = 40;
			}
			
			else if(tile_array[i - 1][j] == -1 && tile_array[i][j + 1] == -1 && tile_array[i][j - 1] != -1 && tile_array[i + 1][j] != -1) {
				tile_array[i][j] = 38;
			}
			
			else {
				tile_array[i][j] = 47;
			}
			
			
		}
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
		if(_tile_index != -1) {
			tilemap_set(_tilemap_id, _tile_index, _xx, _yy);
			/*
			if(_tile_index < 48) {
				tilemap_set(_tilemap_id, _tile_index, _xx, _yy);
			} else if(_tile_index == 48) { // player spawn
				obj_Player.x = _xx*128;
				obj_Player.y = _yy*128;
				tilemap_set(_tilemap_id, 47, _xx, _yy);
			} else if(_tile_index == 49) { // exit point spawn
				instance_create_layer(_xx*128, _yy*128, "Instances", obj_NextRoom);
				tilemap_set(_tilemap_id, 47, _xx, _yy);
			} else if(_tile_index == 50) { // chest spawn
				instance_create_layer(_xx*128, _yy*128, "Instances", obj_Chest);
				tilemap_set(_tilemap_id, 47, _xx, _yy);
			}
			
		}else { // empty space
			instance_create_layer(_xx*128, _yy*128, "Walls", obj_Wall);
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
	
	var chest_count = rm_width*rm_height/4; // 1 chest per 4 spaces in a room
	
	// fill room tiles
	for(var i = rm_x; i < rm_x + rm_width; i++) {
		for(var j = rm_y; j < rm_y + rm_height; j++) {
			if(chest_count > 0) {
				var check = floor(random_range(1, 4));
				if(check == 2) {
					tile_array[i][j] = 50; // spawns chest
				}
			} else {
				tile_array[i][j] = 4; // regular tile
			}
		}
	}
	
	// return x and y coordinates for room
	var coords = [rm_x, rm_y];
	
	return coords;
}
*/

//////////////////////////////////////////
// NEW ATTEMPT STARTS HERE////////////////
//////////////////////////////////////////

var rm_width = floor(room_width/128); // get integer for number of blocks in room width
var rm_height = floor(room_height/128); // get integer for number of blocks in room width

// initialize tile array
var tile_array;

for(var i = 0; i < rm_width; i++) {
	for(var j = 0; j < rm_height; j++) {
		tile_array[i][j] = 0; // set all tiles initially to empty
	}
}

// generate x and y values for origin block
var origin_x = floor(random_range(0, rm_width));
var origin_y = floor(random_range(0, rm_height));

var curr_x = origin_x;
var curr_y = origin_y;

tile_array[curr_x][curr_y] = 2;

var end_x = curr_x;
var end_y = curr_y;

var room_num = floor(random_range(250, 500));

var chest_count = floor(random_range(3, 7));
var enemy_count = floor(random_range(5, 12));

// generate dungeon
while(room_num > 0) {
	var dir_x = 0;
	var dir_y = 0;
	
	var prev_x = curr_x;
	var prev_y = curr_y;
	
	// check that tile in that direction isn't already taken
	while((dir_x == 0 && dir_y == 0) && tile_array[curr_x + dir_x][curr_y + dir_y] == 1) {
		dir_x = getDirection()[0];
		dir_y = getDirection()[1];
		
		curr_x += dir_x;
		curr_y += dir_y;
		
		if(curr_x < 1 || curr_x >= rm_width - 1 || curr_y < 1 || curr_y >= rm_height - 1
		|| (tile_array[curr_x-1][curr_y] == 0 && tile_array[curr_x+1][curr_y] == 0 && tile_array[curr_x][curr_y-1] == 0 && tile_array[curr_x][curr_y+1] == 0)) {
			show_debug_message("got here");
			curr_x = prev_x;
			curr_y = prev_y;
			dir_x = 0;
			dir_y = 0;
			break;
		}
		
		//show_debug_message(string_concat("dir_x: ", dir_x, " | dir_y: ", dir_y));
	}
	
	// set tile in new location to 1
	tile_array[curr_x][curr_y] = 1;
	
	if(enemy_count > 0) {
		
		var check = floor(random_range(1, 10));
		
		if(check == 3 && abs(curr_x - origin_x) > 2 && abs(curr_y - origin_y) > 2
		&& (not(instance_exists(obj_EnemyParent)) || point_distance(instance_nearest(curr_x*128, curr_y*128, obj_EnemyParent).x,
		instance_nearest(curr_x*128, curr_y*128, obj_EnemyParent).y, curr_x*128, curr_y*128) > 10)) {
			instance_create_layer(curr_x*128 + 64, curr_y*128 + 64, "Instances", obj_EnemyParent);
			enemy_count--;
		}
	}
	
	if(chest_count > 0) {
		var check = floor(random_range(1, 10));
		
		if(check == 4 && abs(curr_x - origin_x) > 1 && abs(curr_y - origin_y) > 1
		&& (not(instance_exists(obj_Chest)) || point_distance(instance_nearest(curr_x*128, curr_y*128, obj_Chest).x,
		instance_nearest(curr_x*128, curr_y*128, obj_Chest).y, curr_x*128, curr_y*128) > 10)) {
			instance_create_layer(curr_x*128, curr_y*128, "Instances", obj_Chest);
			chest_count--;
		}
	}
	
	show_debug_message(string_concat(curr_x, ", ", curr_y));
	
	// check if there are any 4-square rooms
	for(var i = 1; i < rm_width - 1; i++) {
		for(var j = 1; j < rm_height - 1; j++) {
			
			// check if block is further from player spawn
			if(point_distance(origin_x, origin_y, end_x, end_y) <= point_distance(origin_x, origin_y, i, j)) {
				end_x = i;
				end_y = j;
			}
			
		}
	}
	
	room_num--;
	if(room_num == 0) {
		end_x = curr_x;
		end_y = curr_y;
	}
}

show_debug_message(string_concat("room tiles:"));

// create end point
//show_debug_message(string_concat(end_x*128, ", ", end_y*128));
instance_create_layer(end_x*128, end_y*128, "Instances", obj_NextRoom);

// set player x and y
obj_Player.x = origin_x*128 + 64;
obj_Player.y = origin_y*128 + 64;

var _layer_id = layer_get_id("Tiles_1");
var _tilemap_id = layer_tilemap_get_id(_layer_id);

var _tile_width = 128;
var _tile_height = 128;

for (var _yy = 0; _yy < rm_width; _yy++) {
    for (var _xx = 0; _xx < rm_height; _xx++) {
        var _tile_index = tile_array[_yy][_xx];
		if(_tile_index > 0) {
			if(_tile_index == 1) {
				tilemap_set(_tilemap_id, 47, _yy, _xx);
			} else if(_tile_index == 2) {
				tilemap_set(_tilemap_id, 46, _yy, _xx);
			}
		} else { // empty space
			instance_create_layer(_yy*128, _xx*128, "Walls", obj_Wall);
		}
    }
}

function getDirection() {
	var dir = floor(random_range(0, 4));
	var point = [2];
	var dir_x = 0;
	var dir_y = 0;
	switch(dir) {
		case 0:
			dir_x = 1; // move right
			dir_y = 0;
			break;
		case 1:
			dir_x = -1; // move left
			dir_y = 0;
			break;
		case 2:
			dir_x = 0;
			dir_y = 1; // move down
			break;
		case 3:
			dir_x = 0;
			dir_y = -1; // move up
			break;
		default: // default to right
			dir_x = 1;
			dir_y = 0;
			break;
	}
	
	point[0] = dir_x;
	point[1] = dir_y;
	
	return point;
}