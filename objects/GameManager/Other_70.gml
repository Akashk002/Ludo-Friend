/// @description Insert description here
// You can write your code in this editor


if(state == GameManagerState.GameStart)
{
	#region Host 
	
	// host listen game room temp list   
	var _responseRead = callBackGameRoomTempList.CheckResponseListener();
	if (_responseRead != noone) 
	{
	    // CallBack response Exists
		if (_responseRead != undefined)
		{
			if(_responseRead != -1)
			{
				// get string map 
				var _sMap = _responseRead;
				
				// get player temp list 
				var _playerIDsTemp = json_decode(_sMap);
				
				// update game room 
				upadate_gameroom(_playerIDsTemp);
			}
		}
	}

	var _setResponse = callBackGameRoomUpdate.CheckResponseSet();
	if (_setResponse != noone)
	{
		if (_setResponse == true)
		{
			// create oppo player 
			create_oppo_player(noOfPlayers);	
			
			// state change to listen chance 
			GameManager_Change_State(GameManagerState.ReadChance);
			
			// set listener to gamestart 
			callBackGameRoomTempList.Delete();
			// delete lobby 
			callBacklobbyDelete.Delete();
		}
	}

	#endregion

	#region Client
	// check game room player id exist 
	var _responseExists = callBackGameRoomPlayerIDs.CheckResponseExists();
	if (_responseExists != noone) 
	{
	    // CallBack response Exists
		if (_responseExists != undefined)
		{
			if (_responseExists == true) 
			{	
				// off alarm 
				alarm[0] = -1;
				// read lobby 
				callBackGameRoomPlayerIDs.Read();
			};
			else
			{
				// set alarm 
				alarm[0] = 15;
			}
		}
	
	};
	
	// read game room playerID 
	var _responseRead = callBackGameRoomPlayerIDs.CheckResponseRead();
	if (_responseRead != noone) 
	{
	    // CallBack response Exists
		if (_responseRead != undefined)
		{
			// get string map 
			var _sMap =  _responseRead;
						
			// decode map  
			var _playerIDMap = json_decode(_sMap);
			
			// get map size  
			var _mapSize = ds_map_size(_playerIDMap);
		
			for (var _playerIndex = 0; _playerIndex < _mapSize; ++_playerIndex)
			{
				// get player id 
			    var _playerID = ds_map_find_value(_playerIDMap,"Player"+string(_playerIndex)+"ID");
				
				// set playerid in array from map 
				ds_list_add(dsListPlayerUniqueID,_playerID);
				
				// if my player id 
				if(_playerID == playerUniqueID)
				{
					// my game position 
				   gamePos = _playerIndex;
				}
			}
			
			// create oppo player 
			create_oppo_player(noOfPlayers);
			
			// change chance to listen chance 
			GameManager_Change_State(GameManagerState.ReadChance);
		}
	}
	#endregion
}
else
{
	if(state != GameManagerState.GameResult)
	{
		// listen emoji data  
		var _responseRead = callBackEmojiDataListen.CheckResponseListener();
		if (_responseRead != noone) 
		{
		    // CallBack response Exists
			if (_responseRead != undefined)
			{
					// get string map 
					var _sMap = _responseRead;
				
					// get emojij struct 
					var _emojiStruct = json_parse(_sMap);		
				
					// create emoji
					create_emoji(_emojiStruct);
			}
		}
	
		// listen dialog data 
		var _responseRead = callBackDialogDataListen.CheckResponseListener();
		if (_responseRead != noone) 
		{
		    // CallBack response Exists
			if (_responseRead != undefined)
			{
					// get string map 
					var _sMap = _responseRead;
				
					// get dialog struct 
					var _diaologStruct = json_parse(_sMap);		
				
					// create dialog
					create_dialog(_diaologStruct);
			}
		}
	
		var _responseRead = callBackGamePlayerIDsListen.CheckResponseListener();
		if (_responseRead != noone) 
		{
			// CallBack response Exists
			if (_responseRead != undefined)
			{
				var _playerMap = json_decode(_responseRead);
			
				// get map size 
				var _mapSize = ds_map_size(_playerMap);
			
				var _noOfPlayerLeft = 0;
			
				ds_list_clear(dsListPlayerUniqueID);
			
				for (var _playerIndex = 0; _playerIndex < _mapSize; ++_playerIndex) 
				{
					// player map keys 
					var _key = "Player"+string(_playerIndex)+"ID";
						
					// get player id 
					var _playerID = ds_map_find_value(_playerMap,_key);
					
					ds_list_add(dsListPlayerUniqueID,_playerID);
				
					if(_playerID != -1)
					{
						_noOfPlayerLeft++;
					}
				}

				debug_log("_noOfPlayer",_noOfPlayerLeft);
			
				if(_noOfPlayerLeft == 1)
				{
				   game_complete();  
				}
				else
				if(_noOfPlayerLeft < 1)
				{
				    GameManager_Change_State(GameManagerState.GameResult);
				}
			}
		}
	
			// read game chance 
	   var _responseRead = callBackGameWinnerIDs.CheckResponseRead();
		if (_responseRead != noone) 
		{
		    // CallBack response Exists
			if (_responseRead != undefined)
			{
				// set current player 
				var _winnerMap = json_decode(_responseRead);
			
				// get map size 
				var _mapSize = ds_map_size(_winnerMap);
			
				for (var _winnerIndex = 0; _winnerIndex < _mapSize; ++_winnerIndex) 
				{
					// player map keys 
					var _key = "Winner"+ string(_winnerIndex);
						
					// get player id 
					var _winnerID = ds_map_find_value(_winnerMap,_key);
					
					// if empty space is found 
					if(_winnerID == -1)
					{
						callBackGameWinnerIDs.Path_Update(gameRoomPath +"/WinnerIDs/" + _key);
						
						// set player unique data in player id 
						callBackGameWinnerIDs.Set(playerUniqueID);
						
						break;
					}
				}
			}
		}
	
		var _setResponse = callBackGameWinnerIDs.CheckResponseSet();
		if (_setResponse != noone)
		{
			if (_setResponse == true)
			{
				left_playerID_map();
			}
		}	

		if(state == GameManagerState.ReadChance)
		{
			// read game chance 
		   var _responseRead = callBackGameChanceRead.CheckResponseRead();
			if (_responseRead != noone) 
			{
			    // CallBack response Exists
				if (_responseRead != undefined)
				{
					
					debug_log("_responseRead",_responseRead)
					debug_log("curChancePlayerID",curChancePlayerID)
					debug_log("curPlayerRechance",curPlayerRechance)
					
					if(_responseRead != curChancePlayerID) || (curPlayerRechance == true)
					{
						debug_log("read chance ")
						
						// set current player 
						curChancePlayerID = _responseRead;
						
						if(curChancePlayerID == playerUniqueID)
						{
						   reset_dice_value();
						}
						
						with(par_dice_roll)
						{
							// if my chance 
							if(playerID == _responseRead)
							{
								// trun on dice pannel 
								turnOn();
							}
						}
						// change state to dice listen  
						GameManager_Change_State(GameManagerState.ListenDiceValue);
					}
					else
					{
					   GameManager_Change_State(GameManagerState.ListenChance)
					}
				}
			}
		}
		
		if(state == GameManagerState.ListenChance)
		{
						// listen game chance if dice value is less than 6  
			var _responseRead = callBackGameChanceListen.CheckResponseListener();
			if (_responseRead != noone)
			{
				if (_responseRead != undefined)
				{
					if(_responseRead != -1)
					{
						debug_log("listen chance")
						
						// set current player 
						curChancePlayerID = _responseRead;
						
						if(curChancePlayerID == playerUniqueID)
						{
						   reset_dice_value();
						}
						
						with(par_dice_roll)
						{
							// if my chance 
							if(playerID == _responseRead)
							{
								// trun on dice pannel 
								turnOn();
								
								debug_log("Turn On Dice");
							}
						}
						// change state to dice listen  
						GameManager_Change_State(GameManagerState.ListenDiceValue);
					}
				}
			}
		}
		
		
		if(state == GameManagerState.ListenDiceValue )
		{
			// listen dice value
			var _responseRead = callBackDiceValueListen.CheckResponseListener();
			if (_responseRead != noone) 
			{
			    // CallBack response Exists
				if (_responseRead != undefined )
				{
					if (_responseRead != -1)
					{
						// get current player 
						var _curChancePlayerID = curChancePlayerID;
						
						with(par_dice_roll)
						{
						   if(playerID == _curChancePlayerID)
						   {
							   // rolling dice  
								rolling_dice(_responseRead);
						   }
						}
					}
				}
			}
		}

		if(state == GameManagerState.UpadteToken)
		{
			// listen token data 
			var _responseRead = callBackTokenDataListen.CheckResponseListener();
			if (_responseRead != noone) 
			{
				// CallBack response Exists
				if (_responseRead != undefined)
				{
					var _tokenMap = json_decode(_responseRead);		
			
					// move token 
					move_token(_tokenMap);
				}
			}
		}
	}
	else
	{
		// read game chance 
		var _responseRead = callBackGameResultRead.CheckResponseRead();
		if (_responseRead != noone) 
		{
			// CallBack response Exists
			if (_responseRead != undefined)
			{
				debug_log("|| winner map -",_responseRead)
			
				// set current player 
				dsMapWinnerMap = json_decode(_responseRead);
			}
		}
	}
}
