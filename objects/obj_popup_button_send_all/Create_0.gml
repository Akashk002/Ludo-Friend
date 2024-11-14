/// @description Insert description here

// Inherit the parent event
event_inherited();

callBackInviteFriend = new CallBack();

// help to invite all friend
function invite_all_friend()
{
	// get first player id from map 
	var _playerUID = ds_map_find_first(friendMap);
	
	for (var i = 0; i < ds_map_size(friendMap); ++i) 
	{
		show_debug_message("_playerUID");
		show_debug_message(_playerUID);
		callBackInviteFriend.Path_Update("User/" + string(_playerUID) + "/Invites/" + string(playerUniqueID));
		callBackInviteFriend.Set(string(playerUniqueID));
		
		_playerUID = ds_map_find_next(friendMap,_playerUID);
	}
}
