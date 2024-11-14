/// @description Insert description here

draw_self();

if(diceSprite == -1) {  exit; }

// if my turn 
if(turn = true)
{
	if(indicator == true)
	{
		image_speed = 0.25;
	}
	else
	{
		image_index = 0;
		image_speed = 0;
	}
	// get sprite index 
	diceSprite = (diceRolling == false) ? diceIdealSprite : diceAnimation;
	
	// draw sprite 
  draw_sprite_ext(diceSprite,imageIndex ,x,y,0.5,0.5,0,c_white,1);
}
else
{
	image_index = 0;
	image_speed = 0;
}


