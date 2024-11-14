/// @description ????

if (instance_exists(par_popup))
{
	exit;
};
// Inherit the parent event
event_inherited();

//room_goto(rm_pop_up_friends);

PopUp_Create("rm_popup_invites",PopUpSlideDirection.Left,PopUpSlideDirection.Right);