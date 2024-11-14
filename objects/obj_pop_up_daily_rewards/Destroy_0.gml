/// @description
//GMLiveSet

// Inherit the parent event
event_inherited();

//
if (dailyRewardDay <= DailyReward.Day7)
{
	var _dailyReward = ds_map_find_value(dsMapDailyReward, dailyRewardDay);
	playerCoins += _dailyReward;

	dailyRewardDay++;
	show_debug_message(dailyRewardDay)
};
