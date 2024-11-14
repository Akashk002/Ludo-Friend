/// @description Event Create
GMLiveSet

/// @description ????
// create unique lobby code 
lobbyUniqueID = noone;

time = room_speed;
timer = time;
count = 0;
timerON = true;
 
lobbyPlayerMap = noone;
 
lobbyPath = noone; 
 
if(global.inviteLobbyID == noone)
{
	switch (noOfPlayers) 
	{
	    case NoOfPlayer.Two:
	        lobbyName = "Lobby_2P" ;
	        break;
	    case NoOfPlayer.Three:
	        lobbyName = "Lobby_3P" ;
	        break;
	    case NoOfPlayer.Four:
	        lobbyName = "Lobby_4P" ;
	        break;
	    default:
	        // code here
	        break;
	}
}
else
{
  lobbyName = "InviteLobby" ;
}

//arrayPlayerID[0] = playerUniqueID;

callBackGameRoomExist = new CallBack();
// creart callback struct  
callBackLobbyExists = new CallBack(lobbyName);

callBackInviteLobbyExists = new CallBack("InviteLobby");


callBackLobbySet = new CallBack();
callBackLobbyRead = new CallBack(lobbyName);


callBackLobbyPlayerSet = new CallBack();

// callback use to listen player map in lobby  
callBackLobbyCheckPlayerID = new CallBack();

callBackLoadLobbyPlayerID = new CallBack();

callBackLobbyDelete = new CallBack();

callBackGameRoomID = new CallBack();


callBackGameRoomName = new CallBack();

callBackGameRoomNameListener = new CallBack();

callBackGameRoomPlayerIDSet = new CallBack();


dsListAvtarBox = ds_list_create();


#region set Time Stamp

// current time 
var _curTime = date_current_datetime();

// current time stamp
selfTimeStamp = Date_To_TimeStamp(_curTime);
// 
var _pathTimeStamp = ("User/" + string(global.playerUniqueID) + "/TimeStamp");
callBackPlayerTimeStamp = new CallBack(_pathTimeStamp);
callBackPlayerTimeStamp.Set(selfTimeStamp);

#endregion


var _y = Get_Room_Height()/2 + 400;
var _gapX = 300;

switch (noOfPlayers) 
{
    case NoOfPlayer.Two:

		var _x = Get_Room_Width()/2;
		var _avtarObj = instance_create_depth(_x,_y,depth - 10,obj_avtar_waiting_lobby_oppo);
		
		ds_list_add(dsListAvtarBox,_avtarObj);
		
        break;
		
    case NoOfPlayer.Three:

		
		var _x = Get_Room_Width()/2 - 150;
		var _avtarObj = instance_create_depth(_x,	_y,depth - 10,obj_avtar_waiting_lobby_oppo);
		var _avtarObj1 = instance_create_depth(_x+_gapX,_y,depth - 10,obj_avtar_waiting_lobby_oppo);
		
		ds_list_add(dsListAvtarBox,_avtarObj,_avtarObj1);
		
        break;
		
    case NoOfPlayer.Four:

		var _x = Get_Room_Width()/2 - 300;
		var _avtarObj = instance_create_depth(_x,		_y,depth - 10,obj_avtar_waiting_lobby_oppo);
		var _avtarObj1 = instance_create_depth(_x+_gapX,	_y,depth - 10,obj_avtar_waiting_lobby_oppo);
		var _avtarObj2 = instance_create_depth(_x+_gapX*2,_y,depth - 10,obj_avtar_waiting_lobby_oppo);
       
	   ds_list_add(dsListAvtarBox,_avtarObj,_avtarObj1,_avtarObj2);
	   
	   break;
		
		default: 
         
        break;
}

function create_lobby()
{
	// create map 
	var _map = ds_map_create();
						
	// get current time 
	var _curTime = date_current_datetime();
						
	// get current time stamp 
	var _timeStamp = Date_To_TimeStamp(_curTime);
			
	var _playerMap = ds_map_create();
	
	ds_map_add(_playerMap,"Player1ID",string(playerUniqueID));
	

	for (var i = 2; i <= noOfPlayers; ++i) 
	{
	    ds_map_add(_playerMap,"Player" + string(i) + "ID","-1");
	}
			
	// create lobby 
	ds_map_add(_map,"TimeStamp",_timeStamp);
	ds_map_add(_map,"GameRoomName","-1");
	ds_map_add_map(_map,"PlayerIDs",_playerMap);
					
	lobbyUniqueID = Get_Unique_Digit_Code(10);				
	// update path 
	callBackLobbySet.Path_Update(lobbyName + "/" + string(lobbyUniqueID));
						
	// set map 
	callBackLobbySet.Set(json_encode(_map));
	
	// host true 
	global.isHost = true;
	
	
}

function create_gameRoom()
{
	// get map size 
	
	var _mapSize = ds_map_size(lobbyPlayerMap);
	
	// if more than 1 playre exist  
	if(_mapSize > 1)
	{
		// no of player 
		var _playerCount = 0;
		
		for (var _playerIndex = 1; _playerIndex <= _mapSize; ++_playerIndex) 
		{
			// player map keys 
			var _key = "Player"+ string(_playerIndex) + "ID";
						
			// get player id 
			var _playerID = ds_map_find_value(lobbyPlayerMap,_key);
			
			// if player id not found 
			if(_playerID != "-1")
			{
				// get player id and set game room name
				variable_global_set("player" + string(_playerIndex),_playerID);
				
				// count no of player 
				_playerCount++;
			}
		}
		
		// get no of player 
		noOfPlayers = _playerCount;
		
		isHost = true;
		
		lobbyPath = lobbyName + "/" + string(lobbyUniqueID); 
		
		// create unique id 
		gameRoomName = Get_Unique_Digit_Code(10);
				
		
		// set gameroom path 
		gameRoomPath = "GameRoom/"+ gameRoomName;
				
		// set map in to fire base 
		callBackGameRoomID.Path_Update(gameRoomPath);
		
		// Create the Game Room 
		var _gameRoom = ds_map_create();
		
		ds_map_add(_gameRoom,"PlayerIDsTemp",-1);
		ds_map_add(_gameRoom,"Chance",-1);
		ds_map_add(_gameRoom,"DiceValue",-1);
		
		// Set game room 
		callBackGameRoomID.Set(json_encode(_gameRoom));	
		
		// Some time later
		FirebaseRealTime().ListenerRemoveAll();	

	}
}

function load_player_from_lobby(LobbyplayerMap)
{
	// get map size
	var _mapSize = ds_map_size(LobbyplayerMap);
		
		
	var _lobbyPlayerIndex = 1;
	// check if all player is found or not 
	for (var _playerIndex = 1; _playerIndex <= _mapSize; ++_playerIndex) 
	{
		// player map keys 
		var _key = "Player"+ string(_playerIndex) + "ID";
						
		// get player id 
		var _playerID = ds_map_find_value(LobbyplayerMap,_key);
			
		// if oppo player id found
		if(_playerID != playerUniqueID)
		{
			// set oppoplayer id in array
				
			//get avtar id  
			var _avtarObj = ds_list_find_value(dsListAvtarBox,_lobbyPlayerIndex - 1);
			// load avtar 
			_avtarObj.load_Avtar(_playerID);
					
			// player index 
			_lobbyPlayerIndex++;
		}
	}	
}