/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

draw_set_color(c_black);

//
draw_set_halign(fa_left);

draw_set_valign(fa_middle);

draw_set_font(font_size_38);

//draw button name
draw_text(bbox_left + 32,bbox_bottom - 35,buttonName);

//draw toggle bg
//draw_sprite(spr_settings_on_off_bg, 0, bbox_right - 100, bbox_top + 40);
/*
//
if (onOff == true)
	{
		draw_sprite(spr_button_settings_on,0,bbox_right - 100,bbox_top + 40);
	}
	else
	{
		draw_sprite(spr_button_settings_off,0,bbox_right - 100,bbox_top + 40);
	};
