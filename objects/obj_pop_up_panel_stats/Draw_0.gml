/// @description Event Draw

GMLiveSet

// Inherit the parent event
event_inherited();

//set text alingment
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//set font color
draw_set_color(c_white);

//set font
draw_set_font(font_size_26);

//draw black bg (FOR VS COMPUTER)
draw_sprite_ext(spr_bg_black, image_index, x - 408, y - 70, image_xscale * 206, image_yscale * 10, 0, c_white, image_alpha);

//draw vs computer text
draw_text(x, y - 45, "VS COMPUTER");

//draw black bg (FOR ONLINE MULTI PLAYER)
draw_sprite_ext(spr_bg_black, image_index, x - 408, y + 200, image_xscale * 206, image_yscale * 10, 0, c_white, image_alpha);

//draw Online multiplayer
draw_text(x, y + 225, "ONLINE MULTIPLAYER");
