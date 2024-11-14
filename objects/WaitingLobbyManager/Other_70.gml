
var _setResponse = callBackPlayerTimeStamp.CheckResponseSet();
if (_setResponse != noone)
{
	if (_setResponse == true)
	{
		if(inviteLobbyID == noone)
		{
			// check existance of lobby 
			callBackLobbyExists.Exists();
		}
		else
		{
			if(inviteLobbyID == playerUniqueID)
			{
				create_lobby();
			}
			else
			{
				// read lobby 
				callBackInviteLobbyExists.Exists();
			}
		}
	}
	else
	{
		callBackPlayerTimeStamp.Set(selfTimeStamp);
	}
};
//callBackLobbyClientID

#region Host 

#region Create invite lobby 

var _responseExists = callBackLobbyExists.CheckResponseExists();
if (_responseExists != noone) 
{
    // CallBack response Exists
	if (_responseExists != undefined)
	{
		if (_responseExists == false) 
		{	
			// create lobby 
			create_lobby();
		};
	}
	else
	{
		callBackLobbyExists.Exists();
	}
};

#endregion

var _responseExists = callBackLobbySet.CheckResponseSet();
if (_responseExists != noone) 
{
    // CallBack response Exists
	if (_responseExists != undefined)
	{
		if (_responseExists == true) 
		{
			// upadate path 
			callBackLobbyCheckPlayerID.Path_Update(lobbyName + "/" + string(lobbyUniqueID) +"/PlayerIDs");
						
			// set listener 
			callBackLobbyCheckPlayerID.ListenerSet();
		}
		else
		{
			
		}
	}
	else
	{
		callBackLobbySet.Exists();
	}
}

// Set the Game Start on server
var _responseRead = callBackLobbyCheckPlayerID.CheckResponseListener();
if (_responseRead != noone) 
{
    // CallBack response Exists
	if (_responseRead != undefined)
	{
		// get string map 
		var _sMap = _responseRead;
					
		lobbyPlayerMap = noone;	
					
		// decode stirng map in to map 
		lobbyPlayerMap = json_decode(_sMap);
			
		var _getAllPlayer = true;	
			
		// get map size
		var _mapSize = ds_map_size(lobbyPlayerMap);
		
		
		var _lobbyPlayerIndex = 0;
		// check if all player is found or not 
		for (var _playerIndex = 1; _playerIndex <= _mapSize; ++_playerIndex) 
		{
			// player map keys 
			var _key = "Player"+ string(_playerIndex) + "ID";
						
			// get player id 
			var _playerID = ds_map_find_value(lobbyPlayerMap,_key);
			
			// if player not found 
			if(_playerID == "-1")
			{
				// all player no found
				_getAllPlayer = false;
				break;
			}
			else
			{
				// if oppo player id found
				if(_playerID != playerUniqueID)
				{
					// set oppoplayer id in array
					//arrayPlayerID[_lobbyPlayerIndex] = _playerID;
					
					//get avtar id  
					var _avtarObj = ds_list_find_value(dsListAvtarBox,_lobbyPlayerIndex);
					
					// load avtar 
					_avtarObj.load_Avtar(_playerID);
					
					// player index 
					_lobbyPlayerIndex++;
				}
			}
		}
				
		// if all player is found
		if(_getAllPlayer == true)
		{
			// create game room 
			create_gameRoom();
		}
	};
};

// check game room  set status
var _setResponse = callBackGameRoomID.CheckResponseSet();
if (_setResponse != noone)
{
	if (_setResponse == true)
	{
		// path update 
		callBackGameRoomName.Path_Update(lobbyName +"/"+ string(lobbyUniqueID) + "/GameRoomName")
				
		show_debug_message(gameRoomName) 
		// set game room 
		callBackGameRoomName.Set(gameRoomName);
	}
};

// check game room name set status
var _setResponse = callBackGameRoomName.CheckResponseSet();
if (_setResponse != noone)
{
	if (_setResponse == true)
	{
		// change room 
		room_goto(rm_game);
	}
};

#endregion	

#region Client   

var _responseExists = callBackLobbyExists.CheckResponseExists();
if (_responseExists != noone) 
{
    // CallBack response Exists
	if (_responseExists != undefined)
	{
		if (_responseExists == true) 
		{	
			// read lobby 
			callBackLobbyRead.Read();
		};
	}
	else
	{
		// check lobby exist 
		callBackLobbyExists.Exists();
	}
};

var _responseExists = callBackInviteLobbyExists.CheckResponseExists();
if (_responseExists != noone) 
{
    // CallBack response Exists
	if (_responseExists != undefined)
	{
		if (_responseExists == true) 
		{	
			// read lobby 
			callBackLobbyRead.Read();
		};
		else
		{
			// invite lobby exist 
			callBackInviteLobbyExists.Exists();
		}
	}
	
};
	
var _responseRead = callBackLobbyRead.CheckResponseRead();
if (_responseRead != noone) 
{
    // CallBack response Exists
	if (_responseRead != undefined)
	{
		// get string map 
		var _sMap =  _responseRead;
						
		// decode map  
		var _lobbyMainMap = json_decode(_sMap);	
			
		// main map size 
		var _mainMapSize = ds_map_size(_lobbyMainMap);
			
		// get lobby id  
		var _lobbyID = (inviteLobbyID == noone) ? ds_map_find_first(_lobbyMainMap) : inviteLobbyID ;	
				
		repeat(_mainMapSize)		
		{		
			// get map from key 
			var _lobbyMap = ds_map_find_value(_lobbyMainMap,_lobbyID);
			
			// set lobby data 
			var _timeStamp	=  (_lobbyMap[? "TimeStamp"]);
			
			// get lobby create time
			var _lobbyCreateTime = TimeStamp_To_Date(_timeStamp);
					
					
			// get self current timestamp 
			//var _selfTime =  TimeStamp_To_Date(selfTimeStamp);
						
			// diff both time 
			var _diff = date_second_span(_lobbyCreateTime,date_current_datetime());
						
			//check diff bet both time 
			if(_lobbyID != playerUniqueID) //&& (_diff < lobbyWaitTime)
			{
				// playerMap
				var _playerMap	= (_lobbyMap[? "PlayerIDs"]);

				// count empty slot in lobby map
				var _emptySlotFound = false;
				
				// get map size 
				var _mapSize = ds_map_size(_playerMap);
			
				for (var _playerIndex = 2; _playerIndex <= _mapSize; ++_playerIndex) 
				{
					// player map keys 
					var _key = "Player"+ string(_playerIndex) + "ID";
						
					// get player id 
					var _playerID = ds_map_find_value(_playerMap,_key);
					
					// if empty space is found 
					if(_playerID == "-1")
					{
						callBackLobbyPlayerSet.Path_Update(lobbyName + "/"+ _lobbyID + "/PlayerIDs/" + _key);
						
						// set player unique data in player id 
						callBackLobbyPlayerSet.Set(playerUniqueID);
						
						_emptySlotFound = true;
						
						break;
					}
				}
				if (_emptySlotFound == true)
				{
					lobbyUniqueID = _lobbyID;
				}
				else
				{
				   _lobbyID = ds_map_find_next(_lobbyMainMap,_lobbyID)
				}
			}
			else
			{
				callBackLobbyDelete.Path_Update(lobbyName + "/"+ string(_lobbyID));
				// set listener to gamestart 
				callBackLobbyDelete.Delete();
			}	
		}	
	};
};

// delete current lobby and check existence of another lobby   
var _responseDelete = callBackLobbyDelete.CheckResponseDelete();

if (_responseDelete != noone) 
{
    // CallBack response Exists
	if (_responseDelete != undefined)
	{
		if (_responseDelete == true) 
		{
			if(inviteLobbyID == noone)
			{
				// check existance of lobby 
				callBackLobbyExists.Exists();
			}
			else
			{
				room_goto(rm_menu);
			}
		};
	};
};

// check game room name set status
var _setResponse = callBackLobbyPlayerSet.CheckResponseSet();
if (_setResponse != noone)
{
	if (_setResponse == true)
	{
		// set listener in lobby player ids 
		callBackLoadLobbyPlayerID.Path_Update(lobbyName + "/" + string(lobbyUniqueID) +"/PlayerIDs");
		callBackLoadLobbyPlayerID.ListenerSet();
		
		
		// set listener in game room name
		callBackGameRoomNameListener.Path_Update(lobbyName + "/"+ lobbyUniqueID + "/GameRoomName");
		callBackGameRoomNameListener.ListenerSet();
	}
};


// Set the Game Start on server
var _responseRead = callBackLoadLobbyPlayerID.CheckResponseListener();
if (_responseRead != noone) 
{
    // CallBack response Exists
	if (_responseRead != undefined)
	{
		// get string map 
		var _sMap = _responseRead;
		
		var _lobbyPlayerMap = json_decode(_sMap);
				
		load_player_from_lobby(_lobbyPlayerMap)
	};
};

var _responseRead = callBackGameRoomNameListener.CheckResponseListener();
if (_responseRead != noone) 
{
    // CallBack response Exists
	if (_responseRead != undefined)
	{
		if(_responseRead != "-1")
		{
			// game room name
			gameRoomName = _responseRead;
			
			lobbyPath = lobbyName + "/" + string(lobbyUniqueID); 
			
			// game room path 
			gameRoomPath = "GameRoom/"+ string(gameRoomName);
				
			// update call back path  
			callBackGameRoomExist.Path_Update(gameRoomPath);
			
			// check path existance
			callBackGameRoomExist.Exists();
		}
	}
}




var _responseExists = callBackGameRoomExist.CheckResponseExists();
if (_responseExists != noone) 
{
    // CallBack response Exists
	if (_responseExists != undefined)
	{
		if (_responseExists == true) 
		{
			alarm[0] = -1;
			// upadate path 
			callBackGameRoomPlayerIDSet.Path_Update(gameRoomPath+"/PlayerIDsTemp/" + string(playerUniqueID));
						
			// set listener 
			callBackGameRoomPlayerIDSet.Set(playerUniqueID);
		}
		else
		{
		   alarm[0] = 15;
		}
	};
	
};

var _responseExists = callBackGameRoomPlayerIDSet.CheckResponseSet();
if (_responseExists != noone) 
{
    // CallBack response Exists
	if (_responseExists != undefined)
	{
		if (_responseExists == true) 
		{
			// remove all listener 
			FirebaseRealTime().ListenerRemoveAll();
			
			// goto game room 
			room_goto(rm_game);
		}
	}
}
			
#endregion
