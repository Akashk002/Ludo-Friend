
//Most of apps/games not requeries this event, feel free of delete/ignore it
debug_local(debug,json_encode(async_load));
if(ds_map_exists(async_load,"type"))
if(async_load[?"type"] == "AppTrackingTransparency")
{
	switch(AppTrackingTransparency_status())//in theory only 'Authorized' and 'Denied' cases can be called here
	{
		case AppTrackingTransparency_NotDetermined:
			// The user has not yet received an authorization request to authorize access to app-related data that can be used for tracking the user or the device.
			debug_log("AppTrackingTransparency ASYNC: Not Determined")
		break
	
		case AppTrackingTransparency_Authorized:
			// The user authorizes access to app-related data that can be used for tracking the user or the device.
			debug_log("AppTrackingTransparency ASYNC: Authorized")
		break
	
		case AppTrackingTransparency_Denied:
			// The user denies authorization to access app-related data that can be used for tracking the user or the device.
			debug_log("AppTrackingTransparency ASYNC: Denied")
		break
	
		case AppTrackingTransparency_Restricted:
			// The authorization to access app-related data that can be used for tracking the user or the device is restricted.
			debug_log("AppTrackingTransparency ASYNC: Restricted")
		break
	}

	// Change the room
	room_goto_next();

}

