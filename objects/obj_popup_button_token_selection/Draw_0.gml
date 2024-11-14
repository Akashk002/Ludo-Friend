/// @description

// Set GMLive
GMLiveSet

event_inherited();

draw_self();

draw_set_valign(fa_middle);
// Add Code Here
draw_set_font(font_size_44)


draw_text(x - 75,y,tokenName);

for (var _tokenNo = 0; _tokenNo < 4; ++_tokenNo) 
{
	var _x = x + 28 * _tokenNo;
	draw_sprite_ext(tokenSprite,_tokenNo,_x - 230,y + 35,1.5,1.5,0,c_white,1);
}


if(isSelected == true)
{ 
	draw_sprite(spr_selected,0,x + 175,y - 35)
}




