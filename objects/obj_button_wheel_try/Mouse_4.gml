/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

if(wheelID.wheelSpinning == true) { exit };

// if free spin is enable 
if(freeSpin == true) 
{ 
	// spin wheel 
	wheelID.spin_wheel();
}
else
{
    Watch_Reward_Video();
}