/// @description

// Set GMLive
GMLiveSet
event_inherited();

draw_self();

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
// Add Code Here
draw_set_font(font_size_44)

var _x = x;
var _y = y;
draw_text(_x ,_y,diceName);

draw_sprite_ext(diceSprite,0,_x - 200,_y,0.4,0.4,0,c_white,1);


if(isSelected)
{ 
	draw_sprite(spr_selected,0,_x + 175,_y - 35)
}




