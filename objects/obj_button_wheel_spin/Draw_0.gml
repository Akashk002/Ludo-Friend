/// @description
GMLiveSet

// Inherit the parent event
event_inherited();


draw_set_font(font_size_44);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _x = x;
var _y = y;

// get text 
var _text = (freeSpin == true) ? "Free Spin" : "Spin Again";

// if free spin is disable 
if(freeSpin == false)
{
	// draw ad logo 
	draw_sprite(spr_watch_video,0,x + 170,y);
	
	var _x = x - 50;
	
	//// draw timer 
	//if(nextSpinText != "")
	//{
	//	var _yy = y - 120;
	//	draw_sprite_ext(spr_choose_entry_coins_bg,0,x,_yy,1.75,1,0,c_white,1);
	//	draw_text(x,_yy,nextSpinText);
	//}
}	

// draw text 

Draw_Text_Outlined_ext(_x, _y, _text, c_white, c_black ,3,image_alpha) 

