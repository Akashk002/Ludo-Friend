/// @description Event Left Pressed
if (instance_exists(par_popup))
{
	exit;
};
// Inherit the parent event
event_inherited();

gameType = GameType.Private;

PopUp_Create("rm_popup_online_friend_select_pawn",PopUpSlideDirection.Left,PopUpSlideDirection.Right);

