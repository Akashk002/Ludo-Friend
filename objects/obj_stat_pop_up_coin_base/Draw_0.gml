/// @description Event Draw

GMLiveSet

// Inherit the parent event
event_inherited();

//draw coin sprite
draw_sprite(spr_coin, image_index, bbox_left - 56, y);

//set text alingment
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

//draw coin text
draw_text(bbox_left + 25,y, playerCoins);
