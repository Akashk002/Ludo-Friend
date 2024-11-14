/// @description
// Set GMLive
GMLiveSet
// Add Code Here

// Inherit the parent event
event_inherited();

var _x = 550;
var _y = 450;

draw_sprite(spr_leader_board_rank1_base,0,_x,_y);

var _x = 300;
var _y = 500;
draw_sprite(spr_leader_board_rank2_base,0,_x,_y);

var _x = 800;
var _y = 510;
draw_sprite(spr_leader_board_rank3_base,0,_x,_y);

var _x = 180;
var _y = 560;
draw_sprite_ext(spr_leader_board_inner_base,0,_x,_y,1,1.07,0,c_white,1);