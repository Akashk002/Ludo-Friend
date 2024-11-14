/// @description Event Draw
if (instance_exists(par_popup))
{
	exit;
};
// Inherit the parent event
event_inherited();


PopUp_Create("rm_popup_local_vs_comp",PopUpSlideDirection.Left,PopUpSlideDirection.Right);



