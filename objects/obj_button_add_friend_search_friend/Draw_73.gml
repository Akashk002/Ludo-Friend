/// @description
//GMLiveSet

// Inherit the parent event
event_inherited();

draw_set_color(c_black);
//
draw_set_halign(fa_left);
//
draw_set_valign(fa_middle);

draw_set_font(font_size_32);

draw_text(bbox_left + 16,y + sprite_height / 8, playerUID);