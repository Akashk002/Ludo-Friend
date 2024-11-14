/// @description
//GMLiveSet

if (dailyRewardDay <= DailyReward.Day7)
{
	var _dailyReward = ds_map_find_value(dsMapDailyReward, dailyRewardDay);
	playerCoins += _dailyReward * 2;

	dailyRewardDay++;
};

room_goto(rm_menu);