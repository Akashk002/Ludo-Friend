/// @description Insert description here
// You can write your code in this editor
GMLiveSet

// Inherit the parent event
event_inherited();

draw_self();

var _avtarIndex = (avtarIndex == noone) ? randamAvtar : avtarIndex;

//draw your profile name
draw_sprite_stretched(spr_avtar,_avtarIndex,bbox_left + sprite_width * 0.07 ,bbox_top + sprite_height * 0.05 ,sprite_width * 0.85,sprite_height * 0.85);