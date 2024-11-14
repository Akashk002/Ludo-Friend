/// @description ????
if (instance_exists(par_popup))
{
	exit;
};

// Inherit the parent event
event_inherited();

PopUp_Create("rm_popup_local_vs_player",PopUpSlideDirection.Left,PopUpSlideDirection.Right);