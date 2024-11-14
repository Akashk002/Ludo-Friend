/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


PopUpClickEvent
var _fun = function()
{
	PopUp_Create("rm_popup_player_edit",PopUpSlideDirection.Left,PopUpSlideDirection.Right);
}
// Destroy the PopUp
get_popup_id().close(id,_fun);
