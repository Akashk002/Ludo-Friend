/// @description
//GMLiveSet

var _rw = room_width/2;
var _rh = room_height/2;

var _gapX = 250;
var _gapY = 350;

var _day = DailyReward.Day1;
var _coins = 0;

for (var i = 0; i < 2; i++) {
    //
	for (var j = 0; j < 3; j++) {
		
	    //
		var _dailyRewardvalue = ds_map_find_value(dsMapDailyReward,_day);
		
		//
		var _panel = instance_create_depth((_rw - 250) + _gapX * j, (_rh - 350) + _gapY * i, -10, obj_reward_panel);
			_panel.day			= (_day + 1);
			_panel.coins		= _dailyRewardvalue;
			
			//
			var _reward = ((_day) < dailyRewardDay);			
			//
			_panel.isRewarded	= _reward;
			_panel.image_index	= _reward + 1;
			
			_panel.isRewardDay = (_day == dailyRewardDay);
					
		//		
		_day++;
			
	}
}

_dailyRewardvalue = ds_map_find_value(dsMapDailyReward,_day);
var _panel2 = instance_create_depth(_rw, _rh + 350, -10, obj_reward_panel);
_panel2.day = (_day + 1);
_panel2.coins = _dailyRewardvalue;
_panel2.image_xscale = 3.2;
//
_reward = ((_day) < dailyRewardDay);
_panel2.isRewarded	= _reward;
_panel2.image_index	= _reward + 1;
			
_panel2.isRewardDay = (_day == dailyRewardDay);
					