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
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale, yScale, obj_pop_up_panel_request);

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);


//title
var _title = create_popup_child_button(_panelID,xstart, anchor.top + 32,1,1,obj_title);
	_title.title = "Requests";
	_title.image_xscale = 6.1;
	_title.image_yscale = 1.4;


#region Scroll 

if(requestCount > 0)
{
	var color = c_white;
	var _list = ds_list_create();
	var _h = sprite_get_height(spr_button_leader_board_details)/2 + 2;
	var _scroll = create_popup_child_scroll(_panelID, anchor.left + 100, anchor.top + 225,700,960,_list,ScrollAxis.Vertical,_h,_h);

	var _playerUID = ds_map_find_first(requestMap);

	// Add Items in the List
	for(var a = 0 ; a < requestCount ; a++)
	{		
		var _ins = create_popup_child_button(_panelID,0,0,8,1,obj_button_request_details);
		  _ins.image_blend	= color;
		  _ins.playerUID	= _playerUID;
		  _ins.load_player_data();
	
		_playerUID = ds_map_find_next(requestMap,_playerUID);
	
		//
		popup_child_scroll_add_child(_scroll,_ins);
	};
}

#endregion

//refresh surfaca
popup_surface_refresh();
