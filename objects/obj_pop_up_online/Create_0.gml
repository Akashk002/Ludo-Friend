/// @description Event Create
GMLiveSet

// Inherit the parent event
event_inherited();

xScale = 4;
yScale = 4;

transitionType	= PopUpTransition.Fade;


//
popup_refresh();

/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale, yScale, obj_pop_up_panel_online);

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

//title
var _title = create_popup_child_button(_panelID, x , anchor.top + 32,1,1,obj_title);
	_title.title = dsMapPopUpOnline[? "title"];
	_title.image_xscale = 6;
	_title.image_yscale = 1.3;

//button 2 player
create_popup_child_button(_panelID, x - 180, y - 40,1,1,obj_button_2_no_of_players);

//button 3 player
create_popup_child_button(_panelID, x + 180, y - 40,1,1,obj_button_3_no_of_players);

//button 4 player
create_popup_child_button(_panelID, x, y + 250,1,1,obj_button_4_no_of_players);
