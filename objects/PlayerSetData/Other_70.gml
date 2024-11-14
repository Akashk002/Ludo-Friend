/// @description Insert description here
// You can write your code in this editor


if (async_load[? "type"] == "FirebaseRealTime_Set")
{
    if (async_load[? "status"] == 200 )
	{
		if (async_load[? "path"] == callBackUser.Path )
		{
		    if (async_load[? "listener"] == callBackUser.ID)
			{	
				// destroy after get data 
				instance_destroy();
			};
		}
	};
};
