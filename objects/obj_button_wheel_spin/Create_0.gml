/// @description

// Set GMLive
GMLiveSet

// Inherit the parent event
event_inherited();

freeSpin = 1;


nextSpinText = "";

// get time difference 
freeSpinTimeDiff = ds_map_find_value(dsMapSpinWheelData,"FreeSpinTimeDiff");

// time left 
var _timeLeft = freeSpinTimeDiff;

// if free spin is disable 
if(freeSpin == false)
{
	// get current time 
	var _currTime = Date_To_TimeStamp(date_current_datetime());
	
	// get time left value 
	var _timeLeft = freeSpinTimeDiff -  abs(freeSpinTime - _currTime);//sec	
}

freeSpinTimeLeft = _timeLeft;//sec

// timer value 
time = room_speed;
timer = time;

alarm[0] = room_speed/2;
