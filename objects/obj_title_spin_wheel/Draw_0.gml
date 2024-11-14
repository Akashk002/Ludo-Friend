/// @description 
GMLiveSet
event_inherited();

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);

draw_set_font(font_size_52);
draw_set_color(c_white);

//
draw_set_halign(fa_center);

//
draw_set_valign(fa_center);

Draw_Text_Outlined(x,y,title, c_white, c_black);

