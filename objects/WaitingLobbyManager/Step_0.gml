/// @description ????
GMLiveSet

if(timerON == true) && (global.inviteLobbyID == noone)
{
	timer--;
	if(timer <= 0)
	{
		//if(lobbyWaitTime <= 0)
		//{
			
		//	if (instance_exists(GhostPlayerManager) == false)
		//	{
		//		  show_debug_message("Create ghost player")	
		//		instance_create_depth(room_width/2,room_height/2,0,GhostPlayerManager);
		//	};
			
		//	timerON = false;
		//};
	
		lobbyWaitTime--;
	
		if(count > 4)
		{
			count = 0;
		}
		else
		{
			count++;
		}
		timer = time;
	}
}








