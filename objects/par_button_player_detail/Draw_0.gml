/// @description 
GMLiveSet

if (draw == false) { exit; }
draw_sprite_ext(sprite_index,image_index,Xdraw,Ydraw,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
var _Ydraw = Ydraw + sprite_height/2;
draw_sprite(spr_friends_avtar,0,Xdraw + sprite_width/4 - 90,_Ydraw);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(font_size_32);
draw_set_color(c_black);
draw_set_font(font_size_32);

if(userAvtarInd != noone && userName != noone)
{
	draw_sprite_ext(spr_avtar,userAvtarInd,Xdraw + sprite_width/4 - 90,_Ydraw,0.5,0.5,0,c_white,1);
	draw_text(Xdraw + sprite_width/4 - 30,_Ydraw,userName)
}

//
Script_Scroll_draw_childs(list);