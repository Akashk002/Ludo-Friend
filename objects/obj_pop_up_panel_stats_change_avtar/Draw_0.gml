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

//
draw_sprite_ext(spr_panel_dark, image_index, x, y + 70, image_xscale * 2, image_yscale * 1.58, 0, c_white, image_alpha);
