/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

//set font
draw_set_font(font_size_34);

//set text alignment
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//draw text
Draw_Text_Outlined(x,y,"APPLY", c_white, c_black);
