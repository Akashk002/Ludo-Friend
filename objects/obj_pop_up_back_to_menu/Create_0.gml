/// @description
GMLiveSet

event_inherited();

draw = function()
{
	draw_sprite_ext(sprite_index, image_index, x, y,xScale * image_xscale, yScale * image_yscale, 0, c_white, image_alpha);	
	//
	draw_sprite_ext(spr_panel_dark, image_index, x, y, image_xscale * 8.3, image_yscale * 10.8, 0, c_white, image_alpha);
}

xScale = 3.5;
yScale = 1.8;

//

transitionType = PopUpTransition.None;
transitionX =  - 512;

//
popup_refresh();
/*
  comment here
*/
/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale , yScale, obj_pop_up_pannel_back_to_menu);


//button
#region 

var _xScale = 0.8;
var _yScale = 0.8;
var _y = anchor.top + 280;

var _x = anchor.left + 230;
var _button = create_popup_child_button(_panelID,_x,_y,_xScale,_yScale,obj_button_back_to_menu_yes);

var _x = anchor.left + 560;
var _button = create_popup_child_button(_panelID,_x,_y,_xScale,_yScale,obj_button_back_to_menu_no);
 
	
#endregion


//refresh surfaca
popup_surface_refresh();

