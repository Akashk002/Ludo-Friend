/// @description

// Set GMLive
GMLiveSet
// Add Code Here
if (ds_map_exists(async_load,"type") == true)
{
	var _type = ds_map_find_value(async_load,"type");
	
    // code here
	if (_type == "AdMob_RewardedVideo_OnReward") 
	{
	    // code here
			// spin wheel 
		obj_spinning_wheel.spin_wheel();
	}
}


