/// @description

// Set GMLive
GMLiveSet

event_inherited();

draw_self();

draw_set_valign(fa_middle);
draw_set_halign(fa_left);
// Add Code Here
draw_set_font(font_size_44)

var _x = bbox_left + 120;
var _y = y;

draw_sprite(spr_store_coin_1,0,_x,_y);

var _x = bbox_left + 230; 
Draw_Text_Outlined_ext(_x,_y + 15,coin,c_white,c_black,4,1);






