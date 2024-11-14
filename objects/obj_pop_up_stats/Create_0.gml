/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

xScale = 4;
yScale = 5;

//
transitionDir	= PopUpSlideDirection.Down;


//refresh pop up
popup_refresh();

/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale, yScale, obj_pop_up_panel_stats);

//title
var _title = create_popup_child_button(_panelID, anchor.middle, anchor.top + 32,6.1,1.3,obj_title);
	_title.title = "Stats"

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

///coins base
create_popup_child_button(_panelID, anchor.middle + 140, anchor.center - 300, 10, 2, obj_stat_pop_up_coin_base);

///diamond base
create_popup_child_button(_panelID, anchor.middle + 140, anchor.center - 200, 10, 2, obj_stat_pop_up_diamond_base);

//avtar 
create_popup_child_button(_panelID, anchor.left + 200, anchor.top + 230,2,2,obj_stats_avtar);

#region VS COMPUTER Buttons

	//Computer wins
	create_popup_child_button(_panelID, anchor.left + 300, anchor.center + 80, 2, 2, obj_stat_pop_up_computer_win);

	//Computer lose
	create_popup_child_button(_panelID, anchor.right - 300, anchor.center + 80, 2, 2, obj_stat_pop_up_computer_lose);

#endregion

#region Online Mode Buttons

	//online wins
	create_popup_child_button(_panelID, anchor.left + 140, anchor.bottom - 230, 2, 2, obj_stat_pop_up_online_win);
	
	//online lose
	create_popup_child_button(_panelID, anchor.middle - 150, anchor.bottom - 230, 2, 2, obj_stat_pop_up_online_lose);
	
	//win streak
	create_popup_child_button(_panelID, anchor.middle, anchor.bottom - 230, 2, 2, obj_stat_pop_up_online_win_streak);
	
	//player token captured
	create_popup_child_button(_panelID, anchor.middle + 150, anchor.bottom - 230, 2, 2, obj_stat_pop_up_online_player_token_captured);
	
	//opponent token captured
	create_popup_child_button(_panelID, anchor.right - 140, anchor.bottom - 230, 2, 2, obj_stat_pop_up_online_opponent_token_captured);

#endregion

//change avtar
create_popup_child_button(_panelID, anchor.right - 220, anchor.bottom - 90, 5, 0.8, obj_button_stat_popup_edit_profile);

var _imageXScale = 9.5;
var _imageYScale = 1.5;

//name box
create_popup_child_button(_panelID, anchor.middle + 150, anchor.top + 200,_imageXScale,_imageYScale,obj_stats_name);

