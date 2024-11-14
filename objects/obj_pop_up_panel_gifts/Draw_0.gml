/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

draw_self();
/*
//set text alingment
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_size_38);

//draw panel
draw_sprite_ext(spr_panel_dark, image_index, x, bbox_top + 230, image_xscale * 2, image_yscale * 0.6, 0, c_white, image_alpha);
Draw_Text_Outlined(x,bbox_top + 140, "FREE COINS",c_white,c_black,4);

//draw panel
draw_sprite_ext(spr_panel_dark, image_index, x,bbox_top + 750, image_xscale * 2, image_yscale * 1.55, 0, c_white, image_alpha);

//draw text
Draw_Text_Outlined(x,bbox_top + 458,"Deal",c_white,c_black,4);
