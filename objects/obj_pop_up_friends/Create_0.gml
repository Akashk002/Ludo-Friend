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

transitionDir	= PopUpSlideDirection.Right;
transitionX =  - 512;

//
popup_refresh();
/*
  comment here
*/
/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale , yScale, obj_pop_up_panel_friends);

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

//send all button
create_popup_child_button(_panelID, anchor.middle, anchor.bottom - 150,1,1,obj_popup_button_send_all);


//create search button
create_popup_child_button(_panelID,anchor.right - 100, anchor.top + 150,1,1,obj_search);

//search bar
create_popup_child_button(_panelID,x - 20, anchor.top + 150,12,1.3,obj_search_bar);

//title
var _title = create_popup_child_button(_panelID,xstart, anchor.top + 32,1,1,obj_title);
	_title.title = "Friends";
	_title.image_xscale = 6.1;
	_title.image_yscale = 1.4;


#region Scroll 
if(friendCount > 0)
{
	var color = c_white;
	var _list = ds_list_create();
	var _h = sprite_get_height(spr_button_leader_board_details)/2 + 8;
	var _scroll = create_popup_child_scroll(_panelID, anchor.left + 100, anchor.top + 225,750,960,_list,ScrollAxis.Vertical,_h,_h);
	
	var _playerUID = ds_map_find_first(friendMap);

	// Add Items in the List
	for(var a = 0 ; a < friendCount ; a++)
	{		
		var _ins = create_popup_child_button(_panelID,0,0,8,1,obj_button_friend_details);
		  _ins.image_blend = color;
		  _ins.playerUID = _playerUID;
		  _ins.load_player_data();
	
		_playerUID = ds_map_find_next(friendMap,_playerUID);
	
		//
		popup_child_scroll_add_child(_scroll,_ins);
	};
}

#endregion

//refresh surfaca
popup_surface_refresh();
