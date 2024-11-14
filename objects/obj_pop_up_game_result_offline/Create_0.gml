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
yScale = 4;

//

transitionType	= PopUpTransition.None;
transitionX =  - 512;

//
popup_refresh();


///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale , yScale, obj_pop_up_panel_game_result);

//title
var _title = create_popup_child_button(_panelID,xstart, anchor.top + 32,1,1,obj_title);
	_title.title = "Result";
	_title.image_xscale = 6.1;
	_title.image_yscale = 1.4;

//send all button
create_popup_child_button(_panelID, anchor.middle, anchor.bottom - 150,5,1,obj_popup_button_home);



//refresh surfaca
popup_surface_refresh();
