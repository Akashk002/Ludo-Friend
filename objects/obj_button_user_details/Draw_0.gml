/// @description
// Set GMLive
GMLiveSet
// Add Code Here

if (draw == false) { exit; }
draw_sprite_ext(sprite_index,image_index,Xdraw,Ydraw,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
var _Ydraw = Ydraw + sprite_height/2;
draw_sprite(spr_friends_avtar,0,Xdraw + sprite_width/4 - 10,_Ydraw);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_set_font(font_size_38);

if(userAvtarInd != noone && userName != noone)
{
	if(rank == 1)
	{
		draw_sprite(spr_crown2,0,Xdraw + 64,_Ydraw - 13)
	}
	draw_text(Xdraw + 50,_Ydraw,rank)
	draw_sprite_ext(spr_avtar,userAvtarInd,Xdraw + sprite_width/4 - 10,_Ydraw,0.5,0.5,0,c_white,1);
	
	draw_set_font(font_size_32);
	draw_text(Xdraw + sprite_width/4 + 60,_Ydraw,userName);
	
	draw_text(Xdraw + sprite_width/4 + 400,_Ydraw,matchWon);
}

//
Script_Scroll_draw_childs(list);