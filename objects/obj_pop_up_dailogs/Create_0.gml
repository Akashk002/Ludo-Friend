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
yScale = 5;

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
	_title.title = "Message";
	_title.image_xscale = 6.1;
	_title.image_yscale = 1.4;


#region dialog text box 

var _noOfDialogs = ds_map_size(dsMapDialogPretext);

var _x1 = anchor.left + 255;
var _x2 = _x1 + 400;
var _xScale = 7.5;
var _yScale = 1.5;

for (var _dialogIndex = 0; _dialogIndex < _noOfDialogs; _dialogIndex += 2) 
{
	 var _y = (anchor.top + 165) + 50 * _dialogIndex;
   
	var _pretext = ds_map_find_value(dsMapDialogPretext,string(_dialogIndex));
	var _textBox =  create_popup_child_button(_panelID,_x1,_y,_xScale,_yScale,obj_popup_button_dialog_text);
		_textBox.pretext = _pretext;
	
	var _pretext = ds_map_find_value(dsMapDialogPretext,string(_dialogIndex + 1));
	
	if(is_undefined(_pretext) == true)
	{
	   break;
	}
	
	var _textBox =  create_popup_child_button(_panelID,_x2,_y,_xScale,_yScale,obj_popup_button_dialog_text);
		_textBox.pretext = _pretext;
}

#endregion

//refresh surfaca
popup_surface_refresh();
