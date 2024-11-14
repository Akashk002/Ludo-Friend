/// @description

// Set GMLive
GMLiveSet

// if game is paused 
if(gamePaused == true) { exit };
if(state == GameState.GameEnd) { exit };

// computer chance is comes or game end 
if(CompPlayerChance == true || autoGame = true) 
{
	if(state == GameState.WaitDiceRoll)
	{
		// get dice object 
		var _diceObj = ds_list_find_value(dsListDice,playerChance);
		
		// get dice value 
		var _diceVal = 	_diceObj.get_dice_value();
		
		// roll dice 
		_diceObj.rolling_dice(_diceVal);
		
		// chance state 
		change_state(GameState.DiceRolling);
	}
	else
	if(state == GameState.ChooseToken)
	{
		// get chance   
		var _playerChance = playerChance;
		
		// if 2 player 
		if(noOfPlayers == NoOfPlayer.Two)
		{
		   if(playerChance = 1)
		   {
				_playerChance = 2;
		   }
		}
		
		// get token list 
		var _tokenList = ds_map_find_value(dsMapPlayerToken,_playerChance);
		
		debug_log("_playerChance",_playerChance)
		
		// get right token 
		var _tokenObj = get_right_token(_tokenList);
		
		// move right token 
		_tokenObj.token_move_forward(diceValue);
		
		// chance state 
		change_state(GameState.TokenMoving);
	}
}







