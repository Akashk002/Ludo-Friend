/// @description Event Draw
GMLiveSet

draw_self();

for (var _tokenNo = 0; _tokenNo < 4; ++_tokenNo) 
{
	var _x = (x  - 34) + 24 * _tokenNo;
	draw_sprite_ext(spr_token_1,_tokenNo,_x,y + 35,1.25,1.25,0,c_white,1);
}
