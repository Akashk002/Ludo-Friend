/// @description Event Draw 

draw_self();

// Inherit the parent event
event_inherited();

//vertical alingment
draw_set_valign(fa_middle);

//horizontal alingment
draw_set_halign(fa_center);


draw_set_font(font_size_34)
//
Draw_Text_Outlined(x,y, title, c_white, c_black);