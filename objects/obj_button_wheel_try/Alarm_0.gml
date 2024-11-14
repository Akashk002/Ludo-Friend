/// @description

// Set GMLive
GMLiveSet

if(freeSpin == false)
{
	var _loaded = AdMob_RewardedVideo_IsLoaded();

	if(_loaded == true)
	{
		image_alpha = 1;
		alarm[0] = -1;
	}
	else
	{
		image_alpha = 0.5;
	  alarm[0] = room_speed/2;
	}
}






