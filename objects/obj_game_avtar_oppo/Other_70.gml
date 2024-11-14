/// @description Insert description here
// You can write your code in this editor

var _responseRead = callBackOppoDataRead.CheckResponseRead();
if (_responseRead != noone) 
{
    // CallBack response Exists
	if (_responseRead != undefined)
	{
		// get string map 
		var _sMap = _responseRead;
						
		// decode map  
		oppoMap = json_decode(_sMap);
					
		oppoName   = ds_map_find_value(oppoMap,Player_Get_Data_Type_String(SaveDataType.PlayerName));
		avtarIndex = ds_map_find_value(oppoMap,Player_Get_Data_Type_String(SaveDataType.AvtarSprite));
		
	}
}




