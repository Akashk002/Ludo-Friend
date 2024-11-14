/// @description
//GMLiveSet

var _noOfString = dsMapPopUpAddFriend[? "maxNoOfString"];
var i_d = ds_map_find_value(async_load, "id");

if (i_d == nameMsg)
{
	if ds_map_find_value(async_load, "status")
	{
		if (ds_map_find_value(async_load, "result") != "")
		{
			var _tempFriendName = ds_map_find_value(async_load, "result");
			
			playerUID = string_copy(_tempFriendName,1,_noOfString);
		}
	}
}