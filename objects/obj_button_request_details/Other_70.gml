/// @description Insert description here

// Inherit the parent event
event_inherited();

if (async_load[? "type"] == "FirebaseRealTime_Set")
{
    if (async_load[? "status"] == 200 )
	{
		if (async_load[? "path"] == callBackAddFriendList.Path )
		{
		    if (async_load[? "listener"] == callBackAddFriendList.ID)
			{	
				// delete request from list 
				
				
				delete_request();
			}
		}
	}
}

if (async_load[? "type"] == "FirebaseRealTime_Delete")
{
    if (async_load[? "status"] == 200 )
	{
		if (async_load[? "path"] == callBackDeleteRequest.Path )
		{
		    if (async_load[? "listener"] == callBackDeleteRequest.ID)
			{	
				show_debug_message("||delete request||")
				
				// delete player from scroll list  
				delete_player_from_scroll();

			}
		}
	}
}