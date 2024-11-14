/// @description Insert description here
// You can write your code in this editor

if(targetObj != noone)
{
	if(place_meeting(x,y,targetObj))
	{
		instance_destroy();	
	}
	move_towards_point(targetObj.x,targetObj.y,emojiMoveSpd);
}





