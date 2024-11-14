/// @description ????


if (async_load[? "type"] == "FirebaseRealTime_Read")
{
    if (async_load[? "status"] == 200 )
	{
		if (async_load[? "path"] == callBackUser.Path )
		{
		    if (async_load[? "listener"] == callBackUser.ID)
			{	
				if (is_undefined(async_load[? "value"]) == false)
				{
					// get string map 
					var _sMap =  (async_load[? "value"]);

					// get decode map 
					dsMapPlayerData = json_decode(_sMap);
						
					// get data 
					requestMap = Player_Get_Data(SaveDataType.Request);
					inviteMap  = Player_Get_Data(SaveDataType.Invite);
					friendMap  = Player_Get_Data(SaveDataType.FriendList);
					freeSpin   = Player_Get_Data(SaveDataType.FreeSpin);
					freeSpinTime= Player_Get_Data(SaveDataType.FreeSpinTime);
					diceIndex	= Player_Get_Data(SaveDataType.DiceIndex);
					tokenIndex	= Player_Get_Data(SaveDataType.TokenIndex);
					
					
					// check value is not undefined 
					if(is_undefined(requestMap) == false)
					{
						// check request count 
						requestCount = ds_map_size(requestMap);
					}
					else
					{
						requestCount = 0;
					}

					if(is_undefined(inviteMap) == false)
					{
						// check invite  count
						inviteCount = ds_map_size(inviteMap);
					}
					else
					{
						inviteCount = 0;
					}

					if(is_undefined(friendMap) == false)
					{
						// check friend count
						friendCount = ds_map_size(friendMap);
					}
					else
					{
						friendCount = 0;
					}
					
					// set data 
					callBackUser.Exists();
				}
			};
		}
	};
};

if (async_load[? "type"] == "FirebaseRealTime_Exists")
{
    if (async_load[? "status"] == 200 )
	{
		if (async_load[? "listener"] == callBackUser.ID)
		{
			// check if lobby exist 
			if (async_load[? "path"] == callBackUser.Path)
			{
				if (async_load[? "value"] == 1)
				{
					instance_destroy();
				}

			};
		};
	};
};

