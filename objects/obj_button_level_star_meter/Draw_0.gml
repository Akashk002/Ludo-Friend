/// @description ????

draw_self();

//draw star
draw_sprite(spr_level_star,0,x + 16,y);

draw_set_font(font_size_34);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//
draw_text(x + 16,y,expLevel);