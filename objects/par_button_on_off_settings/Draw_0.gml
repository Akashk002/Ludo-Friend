/// @description ????
GMLiveSet
draw_self();

draw_set_halign(fa_center);

draw_set_valign(fa_middle);

draw_set_font(font_size_38);

draw_sprite(buttonName,0,x - 450,y);

if (onOff == true)
{
	draw_sprite(spr_button_settings_on,0,x,y);
}
else
{
	draw_sprite(spr_button_settings_off,0,x,y);
}