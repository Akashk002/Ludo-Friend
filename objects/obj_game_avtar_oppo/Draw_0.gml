/// @description Insert description here
// You can write your code in this editor
GMLiveSet


draw_self();


if(avtarIndex != -1) 
{
	//draw your profile name
	
	var _x = bbox_left + sprite_width * 0.08;
	var _y = bbox_top + sprite_height * 0.05;
	draw_sprite_stretched(spr_avtar,avtarIndex,_x ,_y ,sprite_width * 0.85,sprite_height * 0.85);
	
	
}
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white)
draw_set_font(font_size_32)
var _x = x - 40;
var _y = y - 180;
var _gapY = 70;


switch (avtarPos) 
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

if(oppoName != -1)
{
	draw_sprite(spr_flag,flagIndex,_x,_y);  
	draw_text(_x + 50,_y, oppoName);   
}
