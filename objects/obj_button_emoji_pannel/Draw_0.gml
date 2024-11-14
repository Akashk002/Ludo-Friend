/// @description

// Set GMLive
GMLiveSet

// Inherit the parent event
event_inherited();

draw_self();

var _xScale = 0.18;
var _yScale = 0.18;

draw_sprite_ext(spr_emoji_pack,emojiIndex,x,y - 20,_xScale,_yScale,0,c_white,1);


draw_set_font(font_size_26);
Draw_Text_Outlined(x - 5,y + 48,price,c_white,c_black);

var _xScale = 0.75;
var _yScale = 0.75;
draw_sprite_ext(spr_leader_board_coin,0,x - 55,y + 40,_xScale,_yScale,0,c_white,1);



image_index = emojiIndex;