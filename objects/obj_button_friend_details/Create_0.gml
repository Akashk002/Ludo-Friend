/// @description Insert description here
GMLiveSet

// Inherit the parent event
event_inherited();

// create list 
list = ds_list_create();

// create button and add buttonID in list 
var _buttonID = instance_create_depth(x+ 550, y + 67,depth - 100,obj_button_invite_friend);
_buttonID.pannelID = id;
ds_list_add(list,_buttonID);

var _buttonID = instance_create_depth(x+ 700,y ,depth - 100,obj_button_remove_friend);
_buttonID.pannelID = id;
ds_list_add(list,_buttonID);


callBackInviteFriend = new CallBack();
callBackRemoveFriend = new CallBack();


// help to invite friend
function invite_friend()
{
	callBackInviteFriend.Path_Update("User/" + string(playerUID) + "/Invites/" + string(playerUniqueID));
	callBackInviteFriend.Set(string(playerUniqueID));
}



// remove friend from list 
function remove_friend()
{
	callBackRemoveFriend.Path_Update("User/" + string(playerUniqueID) + "/FriendList/" + string(playerUID));
	callBackRemoveFriend.Delete();
}

