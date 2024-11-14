/// @description Insert description here
// You can write your code in this editor

isHost = false;
pawnColour = PawnColour.Green;
draw_set_font(font_size_44)


instance_create_depth(0,0,0,PlayerGetData);

callBackUsers = new CallBack("User");

callBackUsers.Read();