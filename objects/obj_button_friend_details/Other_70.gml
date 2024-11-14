/// @description Insert description here

// Inherit the parent event
event_inherited();

if (async_load[? "type"] == "FirebaseRealTime_Delete")
{
    if (async_load[? "status"] == 200 )
	{
		if (async_load[? "path"] == callBackRemoveFriend.Path )
		{
		    if (async_load[? "listener"] == callBackRemoveFriend.ID)
			{	
				// delete player  
				delete_player_from_scroll()
			}
		}
	}
}