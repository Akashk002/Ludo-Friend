/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

draw_set_font(font_size_34);
draw_set_color(c_black);

Draw_Text_Outlined(x,y,"Double Up", c_white, c_black);

draw_sprite(spr_reward_video_sign,0,x + 190,y - 60);
