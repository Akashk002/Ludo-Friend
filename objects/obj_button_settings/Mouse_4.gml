/// @description ????

if (instance_exists(par_popup))
{
	exit;
};
// Inherit the parent event
event_inherited();

PopUp_Create("rm_popup_setting",PopUpSlideDirection.Left,PopUpSlideDirection.Right);