/// @description

// Set GMLive
GMLiveSet


// Inherit the parent event
event_inherited();

if(userAvtarInd != noone && userName != noone)
{
	draw_set_font(font_size_32);
	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);

	
	draw_sprite_ext(spr_avtar,userAvtarInd,x + 80,y + 66,0.6,0.6,0,c_white,1);
	
	
	draw_text(x + 150,y + 70,userName)
}