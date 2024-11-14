/// @description

// Set GMLive
GMLiveSet

// if free spin is disable  
if(freeSpin == false)
{
	timer--;
	if(timer <= 0)
	{
		// time decrease
		freeSpinTimeLeft--;
		
		// get time value 
		var _hrsVal = freeSpinTimeLeft div (60 * 60);
		var _val = freeSpinTimeLeft mod (60 * 60);
		var _minVal = _val div 60;
		var _secVal = _val mod 60;
		
		var _hrs = _hrsVal;
		var _min = _minVal;
		var _sec = string_format(_secVal,1,0);
		
		if(_hrs < 10)
		{
		   _hrs = "0" + string(_hrsVal);
		}
		if(_min < 10)
		{
		   _min = "0" + string(_minVal);
		}
		
		if(_sec < 10)
		{
		   _sec = "0" + string_format(_secVal,1,0);
		}
		
		// get next spin time text 
		nextSpinText = "Next Spin " + string(_hrs) + " : "+ string(_min) + " : "+ string(_sec);
		
		// if time is over 
		if(freeSpinTimeLeft <= 0)
		{
			// free spin is enable 
			obj_spinning_wheel.free_spin_set(true);
			
			// reset free time left 
			freeSpinTimeLeft = freeSpinTimeDiff;
		}
		// reset timer
		timer = time;
	}
}




