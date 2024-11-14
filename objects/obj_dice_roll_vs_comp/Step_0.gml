/// @description Insert description here
// You can write your code in this editor

GMLiveSet

// if dice is rolling 
if(diceRolling == true)
{
   if(animTimer < 0)
   {
		// stop rolling 
		diceRolling = false;
		// reset timer 
		animTimer = room_speed;
		// get dice num 
		imageIndex = diceNum - 1;
		
		// check token can move 
		GameManagerObj.check_token_can_move(diceNum,gameRoomPos);
		
		exit;
   }
   
   // 
   imageIndex = imageIndex mod sprite_get_number(diceAnimation);
	
   animTimer --;
   imageIndex++;
}
