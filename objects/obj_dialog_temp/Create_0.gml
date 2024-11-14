/// @description Insert description here
// You can write your code in this editor
GMLiveSet

// initial position 
posX = x;
posY = y - 180;

// game room pos 
switch (avtarPos) 
{
    case GameRoomPos.TopLeft:
		posY = y + 180;
        break;
		
    case GameRoomPos.TopRight:
		posY = y + 180;
        break;
		
    case GameRoomPos.BottomRight:
		posY = y - 180;		
        break;
		
    default:
        // code here
        break;
}

// get box scale 
image_xscale = string_length(dialog);
image_yscale = string_height(dialog);

timer =  room_speed * dialogWaitTime;
