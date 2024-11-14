/// @description Event Draw

GMLiveSet

// Inherit the parent event
event_inherited();

//draw diamond sprite
draw_sprite(spr_diamond, image_index, sprite_width + 140, y);


//set text alingment
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

//draw diamond text
draw_text(sprite_width + 200,y, diamond);
