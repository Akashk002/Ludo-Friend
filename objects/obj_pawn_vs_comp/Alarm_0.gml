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
	
	// if 
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
		
		var _avtarObj = ds_list_find_value(GameManagerObj.dsListDice,_playerIndex);
		   
		_avtarObj.token_Complete_path();
	}
		
	var _myChance = (_oppoID != noone || tileIndex == lastHomeTileNo);
	
	GameManagerObj.check_player_chance(_myChance);
}







