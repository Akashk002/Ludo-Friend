/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (async_load[? "type"] == "FirebaseRealTime_Delete")
{
    if (async_load[? "status"] == 200 )
	{
		if (async_load[? "path"] == callBackDeleteInvite.Path )
		{
		    if (async_load[? "listener"] == callBackDeleteInvite.ID)
			{	
				// delete pannel from scroll
				delete_player_from_scroll();
			}
		}
	}
}