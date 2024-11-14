/// @description

// Set GMLive
GMLiveSet

// Inherit the parent event
event_inherited();

// disable spin 
canSpin = false;
wheelSpinning = false;

// get reward data
dsMapSpinWheelReward = ds_map_find_value(dsMapSpinWheelData,"DsMapSpinWheelReward");

// get wheel speed 
spinWheelSpd		= ds_map_find_value(dsMapSpinWheelData,"SpinWheelSpd");

// get no of reward 
var _noOfRoundRot   = ds_map_find_value(dsMapSpinWheelData,"NoOfRoundRotate");

rewardIndex = 0;
rewardAngle = rewardIndex * 36 ;
tragetAngle = 360 * _noOfRoundRot;

// free spin call back 
callBackSetFreeSpin = new CallBack("User/" + string(playerUniqueID) + "/FreeSpin");
callBackSetFreeSpinTime = new CallBack("User/" + string(playerUniqueID) + "/FreeSpinTime");

// help to spin wheel 
spin_wheel = function ()
{
	// if wheel is not spinning 
	if(wheelSpinning == false)
	{
		// wheel is spinning 
		wheelSpinning = true;
		// random reward index
		rewardIndex = irandom(9);
	
		// reward angle  
		rewardAngle = rewardIndex * 36 + 36 * 2; 
	
		// image angle 
		image_angle = tragetAngle;
	
		// enable spin 
		canSpin = true;
	}
}

// get spin reward 
get_spin_reward = function()
{
	// get spin reward value 
   var _spinReward = ds_map_find_value(dsMapSpinWheelReward,string(rewardIndex));
   return _spinReward;
}

// set free spin data 
function free_spin_set(FreeSpin)
{
	freeSpin = FreeSpin;
	
	// get current time 
	var _currentTime =  Date_To_TimeStamp(date_current_datetime());
	
	var _timeSet = (FreeSpin == false) ? _currentTime : -1;
	var _freeSpin = (FreeSpin == false) ? 0 : 1;
	
	// set data 
	callBackSetFreeSpin.Set(_freeSpin);
	callBackSetFreeSpinTime.Set(_timeSet);
}
