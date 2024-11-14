/// @description Insert description here
// You can write your code in this editor
GMLiveSet

draw_self();
//draw your profile name
draw_sprite_stretched(spr_avtar,avtarIndex,bbox_left + sprite_width * 0.08 ,bbox_top + sprite_height * 0.05 ,sprite_width * 0.85,sprite_height * 0.85);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_font(font_size_32)
var _x = x - 40;
var _y = y - 180;
draw_sprite(spr_flag,flagIndex,_x,_y);  
draw_text(_x + 50,_y, playerName);     
