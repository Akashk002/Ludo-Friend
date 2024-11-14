/// @description
//GMLiveSet
var i_d = ds_map_find_value(async_load, "id");
if (i_d == friendMsg)
    {
    if ds_map_find_value(async_load, "status")
        {
        if (ds_map_find_value(async_load, "result") != "")
            {
            var _tempFriendName = ds_map_find_value(async_load, "result");
			friendName = string_copy(_tempFriendName,1,14);
            }
        }
    }