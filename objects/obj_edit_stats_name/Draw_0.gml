/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

//set text color
draw_set_color(c_black);

//set font
draw_set_font(font_size_34);

//set text alingment
draw_set_halign(fa_left);
draw_set_valign(fa_middle);


//draw text
draw_text(bbox_left + 25, y, title);
