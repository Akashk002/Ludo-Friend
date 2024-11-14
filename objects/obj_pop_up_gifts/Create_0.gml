/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

xScale = 4;
yScale = 5;

//
transitionDir	= PopUpSlideDirection.Up;

//refresh pop up
popup_refresh();

/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale, yScale, obj_pop_up_panel_gifts);

//title
var _title = create_popup_child_button(_panelID, anchor.middle, anchor.top + 32,6.1,1.3,obj_title_gift);
	_title.title = "FREE COINS"


//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

var _buttonXScale = 3;
var _buttonYScale = 1.1;


//close button
var _popup = create_popup_child_button(_panelID, anchor.left + 450, anchor.top + 270,_buttonXScale,_buttonYScale,obj_popup_button_gift_free_coin);
_popup.coin = 100;
//close button
var _popup = create_popup_child_button(_panelID, anchor.left + 450, anchor.top + 600,_buttonXScale,_buttonYScale,obj_popup_button_gift_watch_video_for_coin);
_popup.coin = 200;
//close button
var _popup = create_popup_child_button(_panelID, anchor.left + 450, anchor.top + 800,_buttonXScale,_buttonYScale,obj_popup_button_gift_cash_for_coin)
_popup.coin = 500;
_popup.price = 5;

//close button
var _popup = create_popup_child_button(_panelID, anchor.left + 450, anchor.top + 1000,_buttonXScale,_buttonYScale,obj_popup_button_gift_cash_for_coin)
_popup.coin = 1000;
_popup.price = 10;
