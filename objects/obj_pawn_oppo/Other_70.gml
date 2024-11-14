/// @description

// Set GMLive
GMLiveSet

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
					
		var _tokenIndex = ds_map_find_value(oppoMap,Player_Get_Data_Type_String(SaveDataType.TokenIndex));
		
		// ideal spr
		sprite_index = Token_Get_Data(_tokenIndex,DiceData.Sprite);
	}
}






