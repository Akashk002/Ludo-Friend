/// @description Insert description here

draw_self();

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

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white)
draw_set_font(font_size_32)
var _x = x - 40;
var _y = y - 180;
var _gapY = 70;


switch (gameRoomPos) 
{
    case GameRoomPos.TopLeft:
	
		_x = x - 40;
		_y = y + 170;
		_gapY = -60;
        break;
    case GameRoomPos.TopRight:
	
		_x = x - 280;
		_y = y + 170;
		_gapY = -60;
        break;
    case GameRoomPos.BottomRight:
	
		_x = x - 280;
		_y = y - 180;
		_gapY = 70;
        break;
    default:
        // code here
        break;
}

if(name != -1)
{ 
	draw_text(_x + 50,_y, name);   
}


