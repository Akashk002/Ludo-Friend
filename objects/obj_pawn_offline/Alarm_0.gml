/// @description

// Set GMLive
GMLiveSet


// if target tile index is less current tile index  
if(tileIndex < tarTileIndex)
{
	// increase tile index 
	tileIndex++;
		
	// get target tile object 
	targetTileObj = ds_list_find_value(dsListTile,tileIndex);
		
}
else
{
	// current tile 
	tileID = ds_list_find_value(dsListTile,tileIndex);
	
	// add token 
	tileID.add_token(id);
		
	// check oppo token 
	var _oppoID = check_oppo_token(tileIndex);
	
	// if last tile index 
	if(tileIndex == lastHomeTileNo)
	{
		var _playerIndex = gameRoomPos;
		// if 2 player 
		if(noOfPlayers == NoOfPlayer.Two)
		{
		   if(gameRoomPos = 2)
		   {
				_playerIndex = 1;
		   }
		}
		// get dice object 
		var _diceRollObj = ds_list_find_value(GameManagerObj.dsListDice,_playerIndex);
		
		// if token path is completed 
		_diceRollObj.token_Complete_path();
	}
	// if all condition is true so rechance
	var _myChance = (_oppoID != noone || tileIndex == lastHomeTileNo);
	
	// check player chance
	GameManagerObj.check_player_chance(_myChance);
}







