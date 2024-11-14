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
transitionType = PopUpTransition.Fade;
transitionX =  - 512;

//
popup_refresh();

//Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale , yScale, obj_pop_up_panel_dialog);

// Create Popup Child
//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

//title
var _title = create_popup_child_button(_panelID,xstart, anchor.top + 32,1,1,obj_title);
	_title.title = "Emojis";
	_title.image_xscale = 6.1;
	_title.image_yscale = 1.4;


#region dialog text box 


var _iniX = anchor.left + 150 ;
var _iniY = anchor.top  + 200;
var _gapX = 152;
var _gapY = 210;

var _xScale = 1.5;
var _yScale = 2;

var _emojiIndex = 0;
// total no of emojis
var _noOfEmojis = sprite_get_number(spr_emoji_pack);
	

for (var _i = 0; _i < 6; _i ++ ) 
{
	for (var _j = 0; _j < 5; ++_j) 
	{
		// get x and y 
		var _x = _iniX + _gapX * _j;
		var _y = _iniY + _gapY * _i;
	
		// create emojis
		var _emoji =  create_popup_child_button(_panelID,_x,_y,_xScale,_yScale,obj_button_emoji_pannel);
		_emoji.emojiIndex	= _emojiIndex;
		_emoji.oppoPlayerUID = oppoPlayerUID;
		_emoji.price		= 10;
		_emojiIndex++;
		
		if(_emojiIndex == _noOfEmojis)
		{
			break;
		}
	}
}

#endregion

//refresh surfaca
popup_surface_refresh();
