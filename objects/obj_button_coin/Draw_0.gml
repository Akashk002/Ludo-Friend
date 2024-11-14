/// @description

// Set GMLive
GMLiveSet


// Inherit the parent event
event_inherited();


if (!draw)
exit;
	//
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	//
	draw_set_font(font_size_26);
	draw_set_color(c_black);
	
	draw_text(Xdraw + 110, Ydraw + 35, earn);
	draw_text(Xdraw + 110, Ydraw + 250, string(price) + "$");
	
	
	draw_sprite_ext(spr_store_coin,pannelIndex,Xdraw + 108, Ydraw + 130, image_xscale, image_yscale, 0, c_white, image_alpha);