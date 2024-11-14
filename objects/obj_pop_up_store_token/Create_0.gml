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
	_title.title = "Pawns";
	_title.image_xscale = 6.1;
	_title.image_yscale = 1.4;


#region 

var _noOfTokenType = ds_map_size(dsMaptokenData);

var _x = anchor.left + 460;
var _iniY = anchor.top + 50;
var _gapY = 240;

for (var _tokenIndex = 1; _tokenIndex <= _noOfTokenType; ++_tokenIndex) 
{
	var _y = _iniY + _gapY * _tokenIndex;
	
	debug_log("_diceIndex",_tokenIndex)
	
	var _select = (_tokenIndex == tokenIndex); 

	var _struct = {
						tokenIndx : _tokenIndex,
						isSelected : _select,
					};
					
	create_popup_child_button(_panelID,_x,_y,3,1.2,obj_popup_button_token_selection,_struct);

}
#endregion


//refresh surfaca
popup_surface_refresh();

