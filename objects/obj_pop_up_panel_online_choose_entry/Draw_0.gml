/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
//set font
draw_set_font(font_size_44);
//set color blue for text
draw_set_color(c_black);

//Draw text "1 Prize"
draw_text(x,y - 322,"1st Prize :");

//Draw text "Entry"
draw_text(x,y + 75,"Entry :");
