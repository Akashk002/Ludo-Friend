/// @description Draw Text

//
if (text == "") exit;

//
draw_set_font(font);
draw_set_color(color);
draw_set_halign(vAlign);
draw_set_valign(hAlign);

draw_text_transformed(x,y,text,textScale,textScale,0);