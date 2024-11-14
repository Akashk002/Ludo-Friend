/// @description Insert description here
// You can write your code in this editor

// get distance 
var _dis = point_distance(x,y,posX,posY);

if(_dis < 4)
{
	x = posX;
	y = posY;
	
	timer--;

	// destroy dialog box  
	if(timer <= 0)
	{
		image_alpha -= 0.05;
		
		if(image_alpha <= 0)
		{
			instance_destroy();
		}
	}
}
else
{
	x = lerp(x,posX,dialogMoveSpd)
	y = lerp(y,posY,dialogMoveSpd)
}







