/// @description ????
event_inherited();


if(!draw)
	exit
	
draw_self();

draw_sprite(spr_friends_avtar,0,x - 250,y);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

draw_set_font(font_size_32);

draw_set_color(c_black);

draw_text(x - 190,y,friendName);