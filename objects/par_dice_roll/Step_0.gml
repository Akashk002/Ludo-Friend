/// @description Insert description here
// You can write your code in this editor

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
		
			
		var _dsMapPlayerToken = GameManager.dsMapPlayerToken;
		var _curChancePlayerID = GameManager.curChancePlayerID;
		
		// if dice no is less than 6
		if(diceNum < 6 )
		{
			// set alarm 
			alarm[0] = 1;
			GameManager.curPlayerRechance = false;
		}
		else
		{
		  GameManager.curPlayerRechance = true;
		}
		
		
		// current player token map 
		var _tokenMap = ds_map_find_value(_dsMapPlayerToken,_curChancePlayerID);
		
		var _tokenCanMove = false;
			
		for (var _tokenIndex = 0; _tokenIndex < 4; ++_tokenIndex) 
		{
			// get current player token id 
			var _tokenID = ds_list_find_value(_tokenMap,_tokenIndex);
				
			// check token can move or not 
			_tokenCanMove = _tokenID.check_token_can_move(diceNum);

			if(_tokenCanMove == true) { break };
		}
					
		if(_tokenCanMove == false) 
		{
			GameManager_Change_State(GameManagerState.ReadChance);
		}
		else
		{
		   // change state to update token 
			GameManager_Change_State(GameManagerState.UpadteToken);
		}

		exit;
   }
   
   // 
   if(imageIndex == sprite_get_number(diceAnimation)) 
   {
	   imageIndex = 0;
   }
   
   animTimer --;
   imageIndex++;
}

