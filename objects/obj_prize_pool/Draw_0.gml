/// @description Insert description here
// You can write your code in this editor
GMLiveSet
// Inherit the parent event
event_inherited();

draw_set_color(c_black);

draw_set_halign(fa_left);

draw_set_font(font_size_96);

draw_sprite(spr_choose_entry_coin_stack,0,x - 190,y);

var _textScale = (winningAmount > 51200)? 0.8 : 1;

//Draw text Winning Amount
Draw_Text_Outlined_ext(x - 60,y,string(winningAmount),c_white,c_black,6,1,_textScale);
