/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

xScale = 4;
yScale = 4;

//
transitionType	= PopUpTransition.None;

//
popup_refresh();

destroyType = false;
/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale, yScale, obj_pop_up_panel_online_choose_entry);

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

//title
var _title = create_popup_child_button(_panelID, anchor.middle , anchor.top + 32,6,1.3,obj_title);
	_title.title = "Choose Entry";
	
create_popup_child_button(_panelID,anchor.left + 60, anchor.top + 56,1,1,obj_button_back_to_choose_pawn);	
	
//prize pool obj
 create_popup_child_button(_panelID, anchor.middle , anchor.center - 140,7,3,obj_prize_pool);
	
//choose coins
create_popup_child_button(_panelID, anchor.middle , anchor.center + 165,1,1,obj_choose_coins);

//decreases bid button
create_popup_child_button(_panelID, anchor.left + 118, anchor.center + 110,1,1,obj_button_decrease_bid);


//increase bid button
create_popup_child_button(_panelID, anchor.right - 210, anchor.center + 110,1,1,obj_button_inceares_bid);

//start button
create_popup_child_button(_panelID, anchor.middle, anchor.bottom - 160,1,1,obj_start);

