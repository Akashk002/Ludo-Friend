/// @description Event Left Pressed

// Inherit the parent event
event_inherited();

if(sendReq == true) exit;

image_alpha = 0.4;

callBackFriendRequestSend.Path_Update("User/" + string(oppoUID) + "/FriendList/" + string(playerUniqueID));

callBackFriendRequestSend.Set(playerUniqueID);

