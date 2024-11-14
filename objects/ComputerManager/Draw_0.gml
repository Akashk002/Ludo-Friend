/// @description Event Draw

//
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_size_32);

// Draw Pawn 
draw_sprite(spr_pawn_red,0,room_width/2 + 140	,room_height/2 - 412);
draw_sprite(spr_pawn_green,0,room_width/2 + 140	,room_height/2 - 305);
draw_sprite(spr_pawn_blue,0,room_width/2 + 140	,room_height/2 - 195);
draw_sprite(spr_pawn_yellow,0,room_width/2 + 140,room_height/2 - 85);

if (isSelected2 == true)
{
	draw_sprite_ext(spr_local_player_text_base,0,358,546,1,1,0,c_white,1);
	draw_sprite_ext(spr_local_player_text_base,0,358,656,1,1,0,c_white,1);
	draw_sprite_ext(spr_local_player_text_base,0,358,766,1,1,0,c_grey,1);
	draw_sprite_ext(spr_local_player_text_base,0,358,876,1,1,0,c_grey,1);
}
else if (isSelected3 == true)
{
	draw_sprite_ext(spr_local_player_text_base,0,358,546,1,1,0,c_white,1);
	draw_sprite_ext(spr_local_player_text_base,0,358,656,1,1,0,c_white,1);
	draw_sprite_ext(spr_local_player_text_base,0,358,766,1,1,0,c_white,1);
	draw_sprite_ext(spr_local_player_text_base,0,358,876,1,1,0,c_grey,1);
}
else if (isSelected4 == true)
{
	draw_sprite_ext(spr_local_player_text_base,0,358,546,1,1,0,c_white,1);
	draw_sprite_ext(spr_local_player_text_base,0,358,656,1,1,0,c_white,1);
	draw_sprite_ext(spr_local_player_text_base,0,358,766,1,1,0,c_white,1);
	draw_sprite_ext(spr_local_player_text_base,0,358,876,1,1,0,c_white,1);
}

//
draw_set_color(c_black);

//
draw_set_font(font_size_32);

// Draw Player Text
draw_text(room_width/2 - 32 ,room_height/2 - 370,	"Player 1");
draw_text(room_width/2 - 32 ,room_height/2 - 260,	"Player 2");
draw_text(room_width/2 - 32 ,room_height/2 - 150,	"Player 3");
draw_text(room_width/2 - 32 ,room_height/2 - 40,	"Player 4");

//
draw_set_font(font_size_44);