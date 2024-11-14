/// @description Insert description here

// Inherit the parent event
event_inherited();

list = ds_list_create();

// create button and  add it in to list 
var _buttonID = instance_create_depth(530,67,depth - 100,obj_button_accept_request);
_buttonID.pannelID = id;
ds_list_add(list,_buttonID);

var _buttonID = instance_create_depth(630,67,depth - 100,obj_button_reject_request);
_buttonID.pannelID = id;
ds_list_add(list,_buttonID);


callBackDeleteRequest = new CallBack();
callBackAddFriendList = new CallBack();

// delete request from list 
function delete_request()
{
	callBackDeleteRequest.Path_Update("User/" + string(playerUniqueID) + "/Requests/" + string(playerUID));
	callBackDeleteRequest.Delete();
}

// add player in list 
function add_friend_list()
{
	callBackAddFriendList.Path_Update("User/" + string(playerUniqueID) + "/FriendList/" + string(playerUID));
	callBackAddFriendList.Set(string(playerUID));
}
