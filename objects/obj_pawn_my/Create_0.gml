/// @description

// Set GMLive
GMLiveSet

// Inherit the parent event
event_inherited();

// token move forward 
function move_forward()
{
	if(GameManager.state == GameManagerState.UpadteToken) && (GameManager.curChancePlayerID == playerUniqueID) 
	{ 
		// get dice no from dice rolling object 
		var _diceNum = obj_button_dice_roll.diceNum;
		// 
		var _stepCount = 0;
		
		// if current tile is home tile 
		if (tileIndex == -1)
		{
			// if 6 num comes 
			if(_diceNum == 6)
			{
				// set step to 1 
			   _stepCount = 0;
			}
		}
		else
		{
			// get step count 
			_stepCount = _diceNum;
		}
		
		// upload token data 
		upload_token_data(_stepCount);
		
		// reset rolling dice object
		obj_button_dice_roll.reset();
	}
}

//check_token_can_move()