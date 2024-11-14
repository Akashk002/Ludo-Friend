/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

if(obj_spinning_wheel.wheelSpinning == true) { exit };

// if free spin is enable 
if(freeSpin == true) 
{ 
	// spin wheel 
	obj_spinning_wheel.spin_wheel();
}
else
{
    Watch_Reward_Video();
}