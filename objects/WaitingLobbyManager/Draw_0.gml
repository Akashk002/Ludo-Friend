/// @description Event Draw
GMLiveSet

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_size_44);

//
draw_text(room_width/2, room_height/2, "VS");

if (lobbyWaitTime >= 10)
{
	//seconds
	draw_text(room_width/2, room_height/2 + 100, "00 : " + string(lobbyWaitTime));
}
else
{
	//seconds
	draw_text(room_width/2, room_height/2 + 100, "00 : " + "0"+string(lobbyWaitTime));
};
