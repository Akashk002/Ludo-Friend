/// @description ????
GMLiveSet
event_inherited();

draw_self();

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(font_size_26);

//draw your profile name
draw_sprite_stretched(spr_avtar,playerAvtarSprite,bbox_left + sprite_width * 0.08 ,bbox_top + sprite_height * 0.05 ,sprite_width * 0.85,sprite_height * 0.85);

//draw your profile name
draw_text(x - 60,y + 90, playerName);

//draw your profile name
draw_text(x + 80 ,y - 40, playerUniqueID);