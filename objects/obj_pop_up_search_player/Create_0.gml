/// @description
GMLiveSet

event_inherited();

draw = function()
{
draw_sprite_ext(sprite_index, image_index, x, y,xScale * image_xscale, yScale * image_yscale, 0, c_white, image_alpha);	
//
draw_sprite_ext(spr_panel_dark, image_index, x, y, image_xscale * 8.3, image_yscale * 10.8, 0, c_white, image_alpha);
}

xScale = 4.5;
yScale = 2.5;

//

transitionType = PopUpTransition.Slide;
transitionDir = PopUpSlideDirection.Left;
transitionX =  - 512;

//
popup_refresh();
/*
  comment here
*/
/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale , yScale, obj_pop_up_panel_search_player);

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);


//title
var _title = create_popup_child_button(_panelID,xstart, anchor.top + 32,1,1,obj_title);
	_title.title = "Add friend";
	_title.image_xscale = 6.1;
	_title.image_yscale = 1.3;


debug_log("Player Data ",json_encode(playerMap));

var _ins = create_popup_child_button(_panelID,anchor.left + 100 , anchor.top  + 120 ,9,1,obj_button_search_friend_details);
	_ins.playerMap = playerMap;
	_ins.load_player_data();

//refresh surfaca
popup_surface_refresh();
