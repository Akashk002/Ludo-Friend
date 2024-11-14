/// @description ????
//GMLiveSet

// Inherit the parent event
event_inherited();

noOfPlayers = NoOfPlayer.Two;

PopUpClickEvent
var _fun = function()
{
	PopUp_Create("rm_popup_online_select_pawn",PopUpSlideDirection.Left,PopUpSlideDirection.Right);
}
// Destroy the PopUp
get_popup_id().close(id,_fun);