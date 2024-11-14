/// @description Insert description here

// Inherit the parent event
event_inherited();

if(pretext == noone) { exit; }

GameManager.send_dialog_data(pretext);

get_popup_id().close();;