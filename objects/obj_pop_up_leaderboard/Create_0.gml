/// @description
GMLiveSet

event_inherited();

draw = function()
{
	draw_sprite_ext(sprite_index, image_index, x, y,xScale * image_xscale, yScale * image_yscale, 0, c_white, image_alpha);	
	//
	draw_sprite_ext(spr_panel_dark, image_index, x, y, image_xscale * 8.3, image_yscale * 10.8, 0, c_white, image_alpha);
}

xScale = 4;
yScale = 6;

//

transitionDir	= PopUpSlideDirection.Up;
transitionX =  - 512;

//
popup_refresh();
/*
  comment here
*/
/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale , yScale, obj_pop_up_panel_leaderboard);

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

//title
var _title = create_popup_child_button(_panelID,xstart, anchor.top + 32,1,1,obj_title);
	_title.title = "Leaderboard";
	_title.image_xscale = 6.1;
	_title.image_yscale = 1.4;

dsGridPlayer = ds_grid_create(2,userCount);
   

function ranking_player()
{
 
   var _playerUID = ds_map_find_first(userMap);
   
   for (var i = 0; i < userCount; ++i) 
   {
	   var _playerMap = ds_map_find_value(userMap,_playerUID);
	   var _matchWin = ds_map_find_value(_playerMap,"OnlineWins")
	   
	   ds_grid_add(dsGridPlayer,0,i,_playerUID);
	   ds_grid_add(dsGridPlayer,1,i,_matchWin);
	   
	   
       _playerUID = ds_map_find_next(userMap,_playerUID);
   }
   
   ds_grid_sort(dsGridPlayer,1,true);
}

ranking_player();

#region Scroll 
if(userCount > 0)
{
	var color = c_white;
	var _list = ds_list_create();
	var _h = sprite_get_height(spr_button_leader_board_details)/2 + 8;
	var _scroll = create_popup_child_scroll(_panelID, anchor.left + 100, anchor.top + 425,750,890,_list,ScrollAxis.Vertical,_h,_h);
	
	//var _playerUID = ds_map_find_first(userMap);

	// Add Items in the List
	for(var a = 0 ; a < min(userCount,10) ; a++)
	{		
		var _playerUID = ds_grid_get(dsGridPlayer,0,a);
		
		var _ins = create_popup_child_button(_panelID,0,0,8,1,obj_button_user_details);
			_ins.image_blend = color;
			_ins.playerUID = _playerUID;
			_ins.rank = a + 1;
			_ins.load_player_data();
	
		//_playerUID = ds_map_find_next(userMap,_playerUID);
	
		//
		popup_child_scroll_add_child(_scroll,_ins);
	};
}

#endregion


//refresh surfaca
popup_surface_refresh();
