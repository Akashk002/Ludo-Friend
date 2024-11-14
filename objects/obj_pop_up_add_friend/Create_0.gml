/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

xScale = 4.5;
yScale = 2.5;

//
transitionDir	= PopUpSlideDirection.Left;
transitionX =  room_width + 512;
//transitionY =  room_width+512;

popup_refresh();

/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center - 55, xScale, yScale, obj_pop_up_panel_add_friend);

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top - 24,1,1,obj_popup_button_close);

//copy 
create_popup_child_button(_panelID, anchor.right - 90, anchor.center - 150,0.5,0.5,obj_button_copy);

var _imageXScale = 6;
var _imageYScale = 1.3;
//title
var _title = create_popup_child_button(_panelID, anchor.middle, anchor.top - 20,_imageXScale,_imageYScale,obj_title);
	_title.title = "Add Friend";

var _xScale = 8;
var _yScale = 1.2;

//add friend code
var _friendCode = create_popup_child_button(_panelID, anchor.middle + 150, anchor.center - 150,_xScale,_yScale,obj_button_my_code);

//search friend
var _friendCode = create_popup_child_button(_panelID, anchor.middle + 150, anchor.center + 30,_xScale,_yScale,obj_button_add_friend_search_friend);

//search button
create_popup_child_button(_panelID, anchor.right - 90, anchor.center + 30,1,1,obj_button_search);


