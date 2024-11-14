/// @description
// Set GMLive
GMLiveSet
// Add Code Here
if (async_load[? "type"] == "FirebaseRealTime_Read")
{
    if (async_load[? "status"] == 200 )
	{
		if (async_load[? "path"] == callBackUsers.Path )
		{
		    if (async_load[? "listener"] == callBackUsers.ID)
			{	
				if (is_undefined(async_load[? "value"]) == false)
				{
					// get string map 
					var _sMap =  (async_load[? "value"]);

					// get decode map 
					userMap = json_decode(_sMap);
					
					userCount = ds_map_size(userMap);
					
				}
			}
		}
	}
}