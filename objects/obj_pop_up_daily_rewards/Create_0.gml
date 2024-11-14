/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

xScale = 4.5;
yScale = 6.2;

//
transitionType = PopUpTransition.Shrink;
transitionX =  - 512;

//
popup_refresh();

/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center - 55, xScale, yScale, obj_pop_up_panel_daily_rewards);

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top - 20,1,1,obj_popup_button_close);

//title
var _title = create_popup_child_button(_panelID, anchor.middle, anchor.top,1,1,obj_title);
	_title.title = dsMapPopUpDailyRewards[? "title"];
	_title.image_xscale = 6.1;
	_title.image_yscale = 1.4;

//createdouble up
create_popup_child_button(_panelID, x,anchor.bottom - 200,1,1,obj_reward_button_double_up);


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
		var _panel = create_popup_child_button(_panelID, (x - 250) + _gapX * j, (y - 450) + _gapY * i, 1,1, obj_reward_panel);
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
var _panel2 = create_popup_child_button(_panelID, x, y + 240, 1,1, obj_reward_panel);
_panel2.day = (_day + 1);
_panel2.coins = _dailyRewardvalue;
_panel2.image_xscale = 3.2;
//
_reward = ((_day) < dailyRewardDay);
_panel2.isRewarded	= _reward;
_panel2.image_index	= _reward + 1;
			
_panel2.isRewardDay = (_day == dailyRewardDay);

