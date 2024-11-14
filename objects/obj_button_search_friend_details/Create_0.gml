/// @description Insert description here


// Inherit the parent event
event_inherited();

list = ds_list_create();
playerMap = noone;
oppoUID = -1;

callBackFriendRequestSend = new CallBack();

// create button and add it in to list   
var _buttonID = instance_create_depth(x + 640, y + 70,depth - 100,obj_button_searchbox_add_friend);
_buttonID.pannelID = id;
ds_list_add(list,_buttonID);


function load_player_data()
{
	 userName = ds_map_find_value(playerMap,"PlayerName");
	userAvtarInd = ds_map_find_value(playerMap,"AvtarSprite");
	oppoUID = ds_map_find_value(playerMap,"PlayerUID");
	
}

function add_friend()
{
	callBackFriendRequestSend.Path_Update("User/" + string(oppoUID) + "/FriendList/" + string(playerUniqueID));

	callBackFriendRequestSend.Set(playerUniqueID);
}