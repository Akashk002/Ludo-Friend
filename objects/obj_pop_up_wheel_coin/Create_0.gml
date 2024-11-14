/// @description
GMLiveSet

event_inherited();
/*
draw = function()
{
	draw_sprite_ext(sprite_index, image_index, x, y,xScale * image_xscale, yScale * image_yscale, 0, c_white, image_alpha);	
	//
	draw_sprite_ext(spr_panel_dark, image_index, x, y, image_xscale * 8.3, image_yscale * 10.8, 0, c_white, image_alpha);
}

xScale = 4;
yScale = 5.6;

//

transitionDir	= PopUpSlideDirection.Up;
transitionX =  - 512;

//
popup_refresh();


/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale , yScale, obj_pop_up_pannel_wheel_coin);

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

//title
var _title = create_popup_child_button(_panelID,xstart, anchor.top + 32,1,1,obj_title);
	_title.title = "Try your luck!";
	_title.image_xscale = 6.1;
	_title.image_yscale = 1.4;


#region 

var _x = anchor.left + 460;
var _y = anchor.top + 150;
var _xScale = 1.6;
var _yScale = 1.6;

var _y = anchor.top + 580;
var _wheelID = create_popup_child_button(_panelID,_x,_y,_xScale,_yScale,obj_spinning_wheel);


var _y = anchor.top + 1200;
var _button = create_popup_child_button(_panelID,_x,_y,1.5,1,obj_button_wheel_try);
    _button.wheelID = _wheelID;

#endregion


//refresh surfaca
popup_surface_refresh();

