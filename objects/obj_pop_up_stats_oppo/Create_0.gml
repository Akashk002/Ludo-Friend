/// @description
GMLiveSet

// Inherit the parent event
event_inherited();


xScale = 4;
yScale = 5;

//
transitionType	= PopUpTransition.None;


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
coinObj = create_popup_child_button(_panelID, anchor.middle + 140, anchor.center - 300, 10, 2, obj_stat_pop_up_coin_base_oppo);

///diamond base
dimondObj = create_popup_child_button(_panelID, anchor.middle + 140, anchor.center - 200, 10, 2, obj_stat_pop_up_diamond_base_oppo);

//avtar 
avtarObj = create_popup_child_button(_panelID, anchor.left + 200, anchor.top + 230,2,2,obj_stats_avtar_oppo);

#region VS COMPUTER Buttons

//Computer wins
computerWinObj = create_popup_child_button(_panelID, anchor.left + 300, anchor.center + 80, 2, 2, obj_stat_pop_up_computer_win_oppo);

//Computer lose
computerLossObj = create_popup_child_button(_panelID, anchor.right - 300, anchor.center + 80, 2, 2, obj_stat_pop_up_computer_lose_oppo);

#endregion

#region Online Mode Buttons

//online wins
onlineWinObj = create_popup_child_button(_panelID, anchor.left + 140, anchor.bottom - 230, 2, 2, obj_stat_pop_up_online_win_oppo);
	
//online lose
onlineLossObj = create_popup_child_button(_panelID, anchor.middle - 150, anchor.bottom - 230, 2, 2, obj_stat_pop_up_online_lose_oppo);
	
//win streak
winStreakObj = create_popup_child_button(_panelID, anchor.middle, anchor.bottom - 230, 2, 2, obj_stat_pop_up_online_win_streak_oppo);
	
//player token captured
playerTokenCapObj = create_popup_child_button(_panelID, anchor.middle + 150, anchor.bottom - 230, 2, 2, obj_stat_pop_up_online_player_token_captured_oppo);
	
//opponent token captured
oppoTokenCapobj = create_popup_child_button(_panelID, anchor.right - 140, anchor.bottom - 230, 2, 2, obj_stat_pop_up_online_opponent_token_captured_oppo);

#endregion

//change avtar
addFriendObj = create_popup_child_button(_panelID, anchor.right - 220, anchor.bottom - 90, 5, 0.8, obj_button_popup_add_friend);


var _imageXScale = 9.5;
var _imageYScale = 1.5;

//name box
nameObjID = create_popup_child_button(_panelID, anchor.middle + 150, anchor.top + 200,_imageXScale,_imageYScale,obj_stats_name_oppo);


function refresh_opp_data(OppoMap)
{
	nameObjID.name				= ds_map_find_value(OppoMap,Player_Get_Data_Type_String(SaveDataType.PlayerName));
	avtarObj.avtarIndex			= ds_map_find_value(OppoMap,Player_Get_Data_Type_String(SaveDataType.AvtarSprite));
	coinObj.coin				= ds_map_find_value(OppoMap,Player_Get_Data_Type_String(SaveDataType.Coin));
	dimondObj.diamond			= ds_map_find_value(OppoMap,Player_Get_Data_Type_String(SaveDataType.Diamond));
	computerLossObj.computerLose= ds_map_find_value(OppoMap,Player_Get_Data_Type_String(SaveDataType.ComputerLose));
	computerWinObj.compWin		= ds_map_find_value(OppoMap,Player_Get_Data_Type_String(SaveDataType.ComputerWins));
	onlineLossObj.onlineLose	= ds_map_find_value(OppoMap,Player_Get_Data_Type_String(SaveDataType.OnlineLose));
	onlineWinObj.onlineWin		= ds_map_find_value(OppoMap,Player_Get_Data_Type_String(SaveDataType.OnlineWins));
	oppoTokenCapobj.oppoTokenCap= ds_map_find_value(OppoMap,Player_Get_Data_Type_String(SaveDataType.OpponentToken));
	playerTokenCapObj.tokenCap	= ds_map_find_value(OppoMap,Player_Get_Data_Type_String(SaveDataType.PlayerToken));
	winStreakObj.winStreak		= ds_map_find_value(OppoMap,Player_Get_Data_Type_String(SaveDataType.WinStreak));
	addFriendObj.oppoUID		= ds_map_find_value(OppoMap,Player_Get_Data_Type_String(SaveDataType.PlayerUID))
}


