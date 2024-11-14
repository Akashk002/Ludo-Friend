/// @description Insert description here


// Inherit the parent event
event_inherited();

list = ds_list_create();

// create button and add it in to list   
var _buttonID = instance_create_depth(530,67,depth - 100,obj_button_accept_invite);
_buttonID.pannelID = id;
ds_list_add(list,_buttonID);

var _buttonID = instance_create_depth(630,67,depth - 100,obj_button_reject_invite);
_buttonID.pannelID = id;
ds_list_add(list,_buttonID);


callBackDeleteInvite = new CallBack();

// delete invite  
function delete_invite()
{
	callBackDeleteInvite.Path_Update("User/" + string(playerUniqueID) + "/Invites/" + string(playerUID));
	callBackDeleteInvite.Delete();
}
