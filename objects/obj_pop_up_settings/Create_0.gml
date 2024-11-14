/// @description

GMLiveSet
// Inherit the parent event

event_inherited();


xScale = 4;
yScale = 6;

//
transitionDir	= PopUpSlideDirection.Right;

//
popup_refresh();

/// Cretae Popup Child

///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale, yScale, obj_pop_up_panel_settings);

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

//title
var _title = create_popup_child_button(_panelID, x, anchor.top + 32,1,1,obj_title);
	_title.title = dsMapPopUpSettings[? "title"];
	_title.image_xscale = 6.1;
	_title.image_yscale = 1.4;

//button credits
create_popup_child_button(_panelID, anchor.left + 250, anchor.bottom - 550,1,1,obj_button_credits);

//button more games
create_popup_child_button(_panelID, anchor.right - 250, anchor.bottom - 550,1,1,obj_button_more_games);

//button facebook
create_popup_child_button(_panelID, anchor.left + 250, anchor.bottom - 370,1,1,obj_button_facebook);

//feedbakc
create_popup_child_button(_panelID, anchor.right - 250, anchor.bottom - 370,1,1,obj_button_feedback);

//support 
create_popup_child_button(_panelID, anchor.left + 250, anchor.bottom - 190,1,1,obj_button_support);

//policy
create_popup_child_button(_panelID, anchor.right - 250, anchor.bottom - 190,1,1,obj_button_policy);

var _buttonXScale = 10.2;
var _buttonYScale = 1.5;

//Vibration button
var _vibration = create_popup_child_button(_panelID, anchor.left + 80, anchor.center - 550,_buttonXScale,_buttonYScale,obj_button_setting);
	_vibration.buttonName		= "Vibrations";
	_vibration.onOff			= Vibration;
	_vibration.buttonCallBack	= toggle_button_vibration;
	
//Sound button
var _sound = create_popup_child_button(_panelID, anchor.left + 80, anchor.center - 440,_buttonXScale,_buttonYScale,obj_button_setting);
	_sound.buttonName		= "Sound";
	_sound.onOff			= Sound;
	_sound.buttonCallBack	= toggle_button_sound;

//Music button
var _music = create_popup_child_button(_panelID, anchor.left + 80, anchor.center - 330,_buttonXScale,_buttonYScale,obj_button_setting);
	_music.buttonName		= "Music";
	_music.onOff			= Music;
	_music.buttonCallBack	= toggle_button_music;

//Chat button
var _chat = create_popup_child_button(_panelID, anchor.left + 80, anchor.center - 220,_buttonXScale,_buttonYScale,obj_button_setting);
	_chat.buttonName		= "Chat";
	_chat.onOff				= Chat;
	_chat.buttonCallBack	= toggle_button_chat;

//Notification button
var _notification = create_popup_child_button(_panelID, anchor.left + 80, anchor.center - 110,_buttonXScale,_buttonYScale,obj_button_setting);
	_notification.buttonName			= "Notification";
	_notification.onOff					= Notification;
	_notification.buttonCallBack		= toggle_button_notification;
