/// @description Init
event_inherited();

//
image_speed = 0;
image_index	= 0;
visible		= false;


// 
active = false;
popUpID = noone;

// Return a bool 
is_active = function()
{
return (visible == true)
		&& (active == true)
			&& (popUpID != noone);
}