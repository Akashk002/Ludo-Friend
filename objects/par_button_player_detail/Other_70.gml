/// @description Insert description here
// You can write your code in this editor

if (async_load[? "type"] == "FirebaseRealTime_Read")
{
    if (async_load[? "status"] == 200 )
	{
		if (async_load[? "path"] == callBackPlayerData.Path )
		{
		    if (async_load[? "listener"] == callBackPlayerData.ID)
			{	
				if (is_undefined(async_load[? "value"]) == false)
				{
					// get string map 
					var _sMap =  (async_load[? "value"]);
					
					var _userMap = json_decode(_sMap);
					
					// get user name and avtar index  
					userName = ds_map_find_value(_userMap,"PlayerName");
					userAvtarInd = ds_map_find_value(_userMap,"AvtarSprite");
					matchWon = ds_map_find_value(_userMap,"OnlineWins");

					
				}
			}
		}
	}
}




