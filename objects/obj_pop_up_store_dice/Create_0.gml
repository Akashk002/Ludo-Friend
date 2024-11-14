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
yScale = 5.6;

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
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale , yScale, obj_pop_up_pannel_wheel_coin);

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);		

//title
var _title = create_popup_child_button(_panelID,xstart, anchor.top + 32,1,1,obj_title);
	_title.title = "Dice";
	_title.image_xscale = 6.1;
	_title.image_yscale = 1.4;


#region 

var _noOfDiceType = ds_map_size(dsMapDiceData);

var _x = anchor.left + 460;
var _iniY = anchor.top + 50;
var _gapY = 240;

for (var _diceIndex = 1; _diceIndex <= _noOfDiceType; ++_diceIndex) 
{
	var _y = _iniY + _gapY * _diceIndex;
	
	debug_log("_diceIndex",_diceIndex)
	
	var _select = (_diceIndex == diceIndex); 

	var _struct = {
						diceIndx : _diceIndex,
						isSelected : _select,
					};
	create_popup_child_button(_panelID,_x,_y,3,1.2,obj_popup_button_dice_selection,_struct);

}


#endregion


//refresh surfaca
popup_surface_refresh();


os_is_network_connected()