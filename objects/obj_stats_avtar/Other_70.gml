/// @description
GMLiveSet

var _s = json_encode(async_load);

//
if (async_load[? "type"] == "FirebaseRealTime_Set")
{
	if (async_load[? "status"] == 200)
	{
		show_debug_message("PUSHED");
	};
};
