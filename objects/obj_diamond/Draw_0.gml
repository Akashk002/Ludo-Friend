/// @description ????

draw_self();

draw_set_font(font_size_34);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

//draw playerDiamonds
draw_sprite(spr_diamond,0,x,y);

//
draw_text(x + 55,y, playerDiamonds);
