/// @description 

// Inherit the parent event
event_inherited();


if(!draw)
	exit

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var _Ydraw =  Ydraw + sprite_height/2;
//draw text rank
draw_text(Xdraw + 16,_Ydraw,string(leaderRank));

//draw playerCoins
draw_sprite(spr_coin,0,Xdraw + 100,_Ydraw);
draw_set_halign(fa_middle);
//draw text friend name
draw_text(Xdraw - sprite_width/4,_Ydraw,leaderName);

//draw avtar
draw_sprite(spr_leader_board_avtar_panel,0,Xdraw - 185,_Ydraw);

//draw text reward
draw_text(Xdraw + sprite_width/3,_Ydraw,leaderReward);