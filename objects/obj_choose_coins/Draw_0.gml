/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

draw_set_color(c_black);

draw_set_halign(fa_left);

//draw playerCoins
draw_sprite(spr_coin, 0, x - 150, y);

//Draw text Entry Amount
draw_text(x - 95,y + 5, string(entryAmount));
