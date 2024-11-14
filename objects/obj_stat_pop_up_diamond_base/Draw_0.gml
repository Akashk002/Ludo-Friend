/// @description Event Draw

GMLiveSet

// Inherit the parent event
event_inherited();

//draw diamond sprite
draw_sprite(spr_diamond, image_index, bbox_left - 56, y);


//set text alingment
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

//draw diamond text
draw_text(bbox_left + 25,y, playerDiamonds);
