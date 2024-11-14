/// @description

// Set GMLive
GMLiveSet

// Inherit the parent event
event_inherited();

draw_set_font(font_size_44);
draw_set_halign(fa_left);
draw_set_valign(fa_center);

// get result list 
var _resultList = obj_pop_up_game_result_offline.resultList;

// get list size 
var _listSize = ds_list_size(_resultList);

var _x = bbox_left + 120;

for (var _imageIndex = 0; _imageIndex < _listSize; ++_imageIndex) 
{
	var _y = (bbox_top + 200) + 125 * _imageIndex;
	
	var _playerPos = string(_imageIndex + 1);
	
	// get player struct 
	var _playerStruct =  ds_list_find_value(_resultList,_imageIndex);
	
	// player pos is last 
	if(_imageIndex == noOfPlayers - 1)
	{
		_imageIndex = 3;
	}
	
	// draw crown 
	draw_sprite(spr_crown,_imageIndex,_x ,_y);	
	
	draw_set_color(c_black);
	
	// draw player pos  
	draw_text(_x - 16,_y,_playerPos);
	
	// draw pannel 
	draw_sprite_ext(spr_pannel,0,_x + 70,_y,6,1,0,c_white,1);
	
	// draw player pawn 
	draw_sprite_ext(spr_pawn,_playerStruct.gameRoomPos,_x + 100,_y - 36,1,1,0,c_white,1);
	 
	// draw player name 
	draw_text(_x + 180,_y,_playerStruct.name);
}
