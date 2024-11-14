/// @description Event Draw

//GMLiveSet

//set font
draw_set_font(font_size_44);
//set color blue for text
draw_set_color(c_blue);

var _rw = room_width;
var _rh = room_height;

//Draw text Classic
draw_text(_rw/2 - 42,_rh/2 - 384,"Classic");

//Draw text "1 Prize"
draw_text(_rw/2,_rh/2 - 280,"1st Prize :");

//Draw text "Entry"
draw_text(_rw/2,_rh/2 + 72,"Entry :");

//setb color black for text
draw_set_color(c_black);
