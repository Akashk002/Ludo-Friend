/// @description
//GMLiveSet
var _noOfString = dsMapPopUpLocal[? "maxNoOfString"];

var i_d = ds_map_find_value(async_load, "id");

if (i_d == playerMsg)
{
	if ds_map_find_value(async_load, "status")
	{
		if (ds_map_find_value(async_load, "result") != "")
		{
			// get name 
			var _tempPlayerName = ds_map_find_value(async_load, "result");
			name = string_copy(_tempPlayerName,1,_noOfString);
			
			
			//reset name
			ds_list_replace(dsListLocalPlayerName,playerIndex,name)
		}
	}
}