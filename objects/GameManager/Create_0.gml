/// @description ????


// Inherit the parent event
event_inherited();

enum GameRoomPos{BottomLeft,TopLeft,TopRight,BottomRight};
enum PawnColour{Green,Yellow,Blue,Red};
enum GameManagerState {GameStart,ReadChance,ListenChance,ListenDiceValue,UpadteToken,GameResult};
enum GamePos {First,Second,Third,Fourth};

//initial state
state = GameManagerState.GameStart;


// current chance player id 
curChancePlayerID = -1;

curPlayerRechance = false;

noOfTokenAtHome = 0;


// current postion in game room 
gamePos = -1;

// avtar map  
dsMapAvatarObj = ds_map_create();

// player id list 
dsListPlayerUniqueID = ds_list_create();

// tile list 
dsListTileHome = ds_list_create();
dsListTileNormal = ds_list_create();
dsListTileFinish = ds_list_create();

// game result 
dsMapWinnerMap = ds_map_create();

// emoji data map 
dsMapEmojiData = ds_map_create();

// dialog data map 
dsMapDialogData = ds_map_create();

// initial data set 
ds_map_add(dsMapEmojiData,playerUniqueID,0);
ds_map_add(dsMapDialogData,playerUniqueID,0);


// emoji data set and listen  call back 
callBackEmojiDataSet = new CallBack();
callBackEmojiDataListen = new CallBack();

// dialog data set and listen call back 
callBackDialogDataSet = new CallBack();
callBackDialogDataListen = new CallBack();

// player token map 
dsMapPlayerToken = ds_map_create();

#region 
//debug 
//gameRoomPath = "GameRoom/"+ Get_Unique_Digit_Code(8);
//noOfPlayers = 4;

//lobbyPath = Get_Unique_Digit_Code(8);
//gamePos = 0;

#endregion

// token data listen 
callBackTokenDataListen = new CallBack(gameRoomPath + "/PlayerToken");

// game chance set call back 
callBackGameChanceSet = new CallBack(gameRoomPath+"/Chance");
callBackGameChanceRead = new CallBack(gameRoomPath+"/Chance");
callBackGameChanceListen = new CallBack(gameRoomPath+"/Chance");


// dice value call back
callBackDiceValue = new CallBack(gameRoomPath+"/DiceValue");

// dice value listen call back 
callBackDiceValueListen = new CallBack(gameRoomPath+"/DiceValue");

// lobby detele call back 
callBacklobbyDelete = new CallBack(lobbyPath);

// game temp player list call back 
callBackGameRoomTempList = new CallBack(gameRoomPath + "/PlayerIDsTemp");

// upadate game room data call back 
callBackGameRoomUpdate = new CallBack(gameRoomPath);

// game room player data call back 
callBackGameRoomPlayerIDs = new CallBack(gameRoomPath +"/PlayerIDs");

callBackGameRoomPlayerIDsSet = new CallBack();

callBackGamePlayerIDsListen = new CallBack(gameRoomPath +"/PlayerIDs");

callBackGameWinnerIDs = new CallBack(gameRoomPath +"/WinnerIDs");

callBackGameResultRead = new CallBack(gameRoomPath +"/WinnerIDs");

if(isHost == true)
{
	 //set listener in game room temp list if host
	callBackGameRoomTempList.ListenerSet();
}
else
{
	// check existance of player ids 
	callBackGameRoomPlayerIDs.Exists();
}

// set game manager state script 
State_Add_Data(GameManagerState.GameStart,		-1,	GameManager_State_GameStart);
State_Add_Data(GameManagerState.ReadChance,		-1,	GameManager_State_ReadChance);
State_Add_Data(GameManagerState.ListenChance,	-1,	GameManager_State_ListenChance);
State_Add_Data(GameManagerState.ListenDiceValue,-1,	GameManager_State_ListenDiceValue);
State_Add_Data(GameManagerState.UpadteToken,	-1,	GameManager_State_UpadteToken);
State_Add_Data(GameManagerState.GameResult,		-1,	GameManager_State_GameResult);

#region Emoji function 

// get emoji map data 
function get_emojiMap_data(PlayerID)
{
	// get player emoji last no data 
    var _value = ds_map_find_value(dsMapEmojiData,PlayerID);
	
	return _value;
}

// update data in map  
function update_emojiMap_data(PlayerID)
{
	// old emoji no  
	var _oldsValue = ds_map_find_value(dsMapEmojiData,PlayerID);
	
	// increment old no.
	_oldsValue++;
	
	// set new emoji no 
	ds_map_set(dsMapEmojiData,PlayerID,_oldsValue);
}

// send emoji data in firebase  
function send_emoji_data(ReciverID,EmoijiType = irandom(4),SenderID = playerUniqueID)
{
	// current time stamp
	var _timeStamp = Date_To_TimeStamp(date_current_datetime());
   
   // create emoji map 
   var _emojiMap = ds_map_create();
   
   // add data in emoji map 
   ds_map_add(_emojiMap,"Receiver",ReciverID)
   ds_map_add(_emojiMap,"Timestamp",_timeStamp)
   ds_map_add(_emojiMap,"EmojiType",EmoijiType)
   
   // get emoji no.
   var _emojiNo = get_emojiMap_data(SenderID)
	
	// set emoji map data 
   callBackEmojiDataSet.Path_Update(gameRoomPath+"/Emojis/"+ SenderID +"/"+ string(_emojiNo))
   callBackEmojiDataSet.Set(json_encode(_emojiMap));
}

// help to create emoji 
function create_emoji(EmojiStruct)
{
    for (var _playerIndex = 0; _playerIndex < noOfPlayers; ++_playerIndex)
	{
		// get sender id 
		var _senderID = ds_list_find_value(dsListPlayerUniqueID,_playerIndex);
		
		// get data from emoji struct 
		var _array = variable_struct_get(EmojiStruct,_senderID);
		
		// if array is not undefined 
		if(is_undefined(_array) == false)
		{
			// array size 
			var _arraySize = array_length(_array);
			
			// last emoji no 
			var _lastEmoijiNo = ds_map_find_value(dsMapEmojiData,_senderID);
			
			// if new emoji data receieve
			if(_arraySize > _lastEmoijiNo)
			{
			    for (var _emojiPackNo = _lastEmoijiNo ; _emojiPackNo < _arraySize; ++_emojiPackNo) 
				{
					// get receiever  id  
					var _reciverID =  _array[_emojiPackNo].Receiver; 
					
					// get emoji type 
					var _emoijiType =  _array[_emojiPackNo].EmojiType; 
					
					// get sender obj 
				    var _senderObj =  ds_map_find_value(dsMapAvatarObj,_senderID)
					
					// get receiver obj
					var _receiverObj = ds_map_find_value(dsMapAvatarObj,_reciverID);

					var _x = _senderObj.x; 
					var _y = _senderObj.y;
					
					// create  struct 
					var _struct = 
					{
						targetObj : _receiverObj,
						image_index : _emoijiType,
					}
					
					// create emoji 
					var _emoji = instance_create_depth(_x,_y,-100,obj_emoji_temp,_struct);
						_emoji.image_xscale = 0.2;
						_emoji.image_yscale = 0.2;
					// update emoji data 
					update_emojiMap_data(_senderID);
				}
			}
		}
	}
}

#endregion

#region Dialog function 

// get dialog map data 
function get_dialogMap_data(PlayerID)
{
	// get player emoji last no data 
    var _value = ds_map_find_value(dsMapDialogData,PlayerID);
	return _value;
}

// update data in map  
function update_dialogMap_data(PlayerID)
{
	// old emoji no  
	var _oldsValue = ds_map_find_value(dsMapDialogData,PlayerID);
	
	// increment old no.
	_oldsValue++;
	
	// set new emoji no 
	ds_map_set(dsMapDialogData,PlayerID,_oldsValue);
}

function send_dialog_data(Dialog = "Hi!",SenderID = playerUniqueID)
{
	// current time stamp
	var _timeStamp = Date_To_TimeStamp(date_current_datetime());
   
   // create emoji map 
   var _dailogMap = ds_map_create();
   
   ds_map_add(_dailogMap,"Timestamp",_timeStamp)
   ds_map_add(_dailogMap,"Dailog",Dialog)
   
   // get emoji no.
   var _dialogNo = get_dialogMap_data(SenderID)
	
	// set emoji map data 
   callBackDialogDataSet.Path_Update(gameRoomPath+"/Dialogs/"+ SenderID +"/"+ string(_dialogNo))
   callBackDialogDataSet.Set(json_encode(_dailogMap));

}

// help to create emoji 
function create_dialog(DialogStruct)
{
    for (var _playerIndex = 0; _playerIndex < noOfPlayers; ++_playerIndex)
	{
		// get sender id 
		var _senderID =  ds_list_find_value(dsListPlayerUniqueID,_playerIndex);
		
		// get data from emoji struct 
		var _array = variable_struct_get(DialogStruct,_senderID);
		
		// if array is not undefined 
		if(is_undefined(_array) == false)
		{
			// array size 
			var _arraySize = array_length(_array);
			
			// last emoji no 
			var _lastDialogNo = ds_map_find_value(dsMapDialogData,_senderID);
			
			// if new emoji data receieve
			if(_arraySize > _lastDialogNo)
			{
			    for (var _dialogPackNo = _lastDialogNo ; _dialogPackNo < _arraySize; ++_dialogPackNo) 
				{	
					// get emoji type 
					var _dailog =  _array[_dialogPackNo].Dailog; 
					
					// get sender obj 
				    var _senderObj =  ds_map_find_value(dsMapAvatarObj,_senderID)

					var _x = _senderObj.x; 
					var _y = _senderObj.y;
					
					// avtar pos
					var _pos = _senderObj.avtarPos;
					
					var _posX = x;
					
					if(_pos ==  GameRoomPos.TopRight || _pos ==  GameRoomPos.BottomRight)
					{
					    _x -= 240;
					}
					
					// create  struct 
					var _struct = 
					{
						avtarPos : _pos,
						dialog	 : _dailog,
						posX	 : _posX,
					}
					
					// create emoji 
					instance_create_depth(_x,_y,_senderObj.depth - 100,obj_dialog_temp,_struct);
					
					// update emoji data 
					update_dialogMap_data(_senderID);
				}
			}
		}
	}
}

#endregion

// create oppo player in game room 
function create_oppo_player(NoofPlayer)
{
	
	// create player index list 
	var _dsListPlayerIndex = ds_list_create();
	
	// check no of player play game 
	switch (NoofPlayer) 
	{
		// if 2 player play game  
	    case NoOfPlayer.Two:
		
			// my pos in game 
	        switch (gamePos) 
			{
				// if first 
			    case GamePos.First:
					// add game pos list 
			        ds_list_add(_dsListPlayerIndex,GameRoomPos.BottomLeft,GameRoomPos.TopRight);
			        break;
				// if second 	
			    case GamePos.Second:
			        ds_list_add(_dsListPlayerIndex,GameRoomPos.TopRight,GameRoomPos.BottomLeft);
			        break;
			    default:
			        // code here
			        break;
			}
	        break;
			// if 3 player play game
	    case NoOfPlayer.Three:
	        switch (gamePos) 
			{
				// if first 
			    case GamePos.First:
			        ds_list_add(_dsListPlayerIndex,GameRoomPos.BottomLeft,GameRoomPos.TopLeft,GameRoomPos.TopRight);
			        break;
				// if second
			    case GamePos.Second:
			        ds_list_add(_dsListPlayerIndex,GameRoomPos.BottomRight,GameRoomPos.BottomLeft,GameRoomPos.TopLeft);
			        break;
				// if third 	
			    case GamePos.Third:
			        ds_list_add(_dsListPlayerIndex,GameRoomPos.TopRight,GameRoomPos.BottomRight,GameRoomPos.BottomLeft);
			        break;
			    default:
			        // code here
			        break;
			}
	        break;
	    case NoOfPlayer.Four:
	        switch (gamePos) 
			{
				// if first 
			    case GamePos.First:
			        ds_list_add(_dsListPlayerIndex,GameRoomPos.BottomLeft,GameRoomPos.TopLeft,GameRoomPos.TopRight,GameRoomPos.BottomRight);
			        break;
				// if second	
			    case GamePos.Second:
			        ds_list_add(_dsListPlayerIndex,GameRoomPos.BottomRight,GameRoomPos.BottomLeft,GameRoomPos.TopLeft,GameRoomPos.TopRight);
			        break;
				// if third 	
			    case GamePos.Third:
			        ds_list_add(_dsListPlayerIndex,GameRoomPos.TopRight,GameRoomPos.BottomRight,GameRoomPos.BottomLeft,GameRoomPos.TopLeft);
			        break;
				// if fourth 	
			    case GamePos.Fourth:
			        ds_list_add(_dsListPlayerIndex,GameRoomPos.TopLeft,GameRoomPos.TopRight,GameRoomPos.BottomRight,GameRoomPos.BottomLeft);
			        break;
			    default:
			        // code here
			        break;
			}
	        break;
	    default:
	        // code here
	        break;
	}

	var _playerPos = 0;
	 
	// initial width & height  
	var _rw = Get_Room_Width()/2;
	var _rh = Get_Room_Height()/2;
	var _w = 420;
	var _h = 640;
	//arrayPlayerID[0] =  playerUniqueID;
	repeat(NoofPlayer)
	{
		// get game room pos
		var _gameRoomPos = ds_list_find_value(_dsListPlayerIndex,_playerPos);
		
		// if game room position is top left 
		if(_gameRoomPos == GameRoomPos.TopLeft)
		{
			//top left
			
			// get opponent id 
			var _oppoID = ds_list_find_value(dsListPlayerUniqueID,_playerPos);
			//var _oppoID = "0YQZPZV4"
			
			// get pawn colour 
			var _pawnColour = (pawnColour + _gameRoomPos) mod 4;
			
			// create oppo avatar 
			var _avtarIcon	= instance_create_layer(_rw - _w, _rh - _h,				"Instances_Dice", obj_game_avtar_oppo);
				_avtarIcon.avtarPos = _gameRoomPos;
				_avtarIcon.get_player_data(_oppoID);
			
			// create dice roll object 
			var _diceRollObj= instance_create_layer(_rw - _w + 200, _rh - _h ,		"Instances_Dice", obj_dice_roll_oppo);
				_diceRollObj.playerID = _oppoID;
				_diceRollObj.get_player_data(_oppoID);
			
			// create emoji create object  
			var _emojiObj = instance_create_layer(_rw - _w - 25, _rh - _h - 135,	"Instances_Dice", obj_button_game_smily);
				_emojiObj.oppoPlayerUID = _oppoID;
				
			// add player object data in map  	
			ds_map_add(dsMapAvatarObj,_oppoID,_avtarIcon);
			ds_map_add(dsMapEmojiData,_oppoID,0);
			ds_map_add(dsMapDialogData,_oppoID,0);
			
			// create oppo token 
			create_token(_oppoID,_pawnColour,_gameRoomPos,false);
		}
			
			
		if(_gameRoomPos == GameRoomPos.TopRight)
		{
			//top right
			
			// get opponent id 
			var _oppoID = ds_list_find_value(dsListPlayerUniqueID,_playerPos);
			//var _oppoID = "13UI5MVI";
			
			// get pawn colour
			var _pawnColour = (pawnColour + _gameRoomPos) mod 4;
			
			// create oppo avatar 
			var _avtarIcon	= instance_create_layer(_rw + _w, _rh - _h,				"Instances_Dice", obj_game_avtar_oppo);
				_avtarIcon.avtarPos = _gameRoomPos;
				_avtarIcon.get_player_data(_oppoID);
			
			// create dice roll object 
			var _diceRollObj= instance_create_layer(_rw + _w - 200, _rh - _h,		"Instances_Dice", obj_dice_roll_oppo);
				_diceRollObj.playerID = _oppoID;
				_diceRollObj.get_player_data(_oppoID)
			
			// create emoji create object  
			var _emojiObj = instance_create_layer(_rw + _w + 25, _rh - _h - 135,	"Instances_Dice", obj_button_game_smily);
				_emojiObj.oppoPlayerUID = _oppoID;
			
			// add player object data in map
			ds_map_add(dsMapAvatarObj,_oppoID,_avtarIcon);
			ds_map_add(dsMapEmojiData,_oppoID,0);
			ds_map_add(dsMapDialogData,_oppoID,0);
			
			// create oppo token
			create_token(_oppoID,_pawnColour,_gameRoomPos,false);
		}
			
		if(_gameRoomPos == GameRoomPos.BottomRight)
		{
			//bottom left

			// get opponent id 
			var _oppoID = ds_list_find_value(dsListPlayerUniqueID,_playerPos);
			//var _oppoID = "1T765FW4"; 
			
			// get pawn colour
			var _pawnColour = (pawnColour + _gameRoomPos) mod 4;
			
			// create oppo avatar 
			var _avtarIcon	= instance_create_layer(_rw + _w, _rh + _h,				"Instances_Dice", obj_game_avtar_oppo);
				_avtarIcon.avtarPos = _gameRoomPos;
				_avtarIcon.get_player_data(_oppoID);
			
			// create dice roll object 
			var _diceRollObj= instance_create_layer(_rw + _w - 200, _rh + _h ,		"Instances_Dice", obj_dice_roll_oppo);
				_diceRollObj.playerID = _oppoID;
				_diceRollObj.get_player_data(_oppoID)
			
			// create emoji create object  
			var _emojiObj = instance_create_layer(_rw + _w + 25, _rh + _h + 135,	"Instances_Dice", obj_button_game_smily);
				_emojiObj.oppoPlayerUID = _oppoID;
			
			// add player object data in map
			ds_map_add(dsMapAvatarObj,_oppoID,_avtarIcon);
			ds_map_add(dsMapEmojiData,_oppoID,0);
			ds_map_add(dsMapDialogData,_oppoID,0);
			
			// create oppo token
			create_token(_oppoID,_pawnColour,_gameRoomPos,false);
		}
		
		_playerPos++;
	}
	
	// listen emoji data 
	callBackEmojiDataListen.Path_Update(gameRoomPath + "/Emojis");
	callBackEmojiDataListen.ListenerSet();
		
	// listen dialog data 
	callBackDialogDataListen.Path_Update(gameRoomPath + "/Dialogs");
	callBackDialogDataListen.ListenerSet();
	
	// listen token data 
	callBackTokenDataListen.ListenerSet();
	
	// listen dice value  
	callBackDiceValueListen.ListenerSet();
	
	// listen game chance  
	callBackGameChanceListen.ListenerSet();
	
	// listen game chance  
	callBackGamePlayerIDsListen.ListenerSet();
	
}

// this function help to update game room after all member join game 
function upadate_gameroom(PlayerIDsTemp)
{	
	// get no of player join game 
	var _mapSize = ds_map_size(PlayerIDsTemp);
	
	// if all player join game 
	if(_mapSize == noOfPlayers - 1)
	{
		// gam room map create
		var _gameRoomMap = ds_map_create();
		
		// all player map create 
		var _playerIDMap = ds_map_create();
		
		// add self id in player map 
		ds_map_add(_playerIDMap,"Player0ID",playerUniqueID);
		
		// all player token map 
		var _playerTokenMap = ds_map_create();
		
		// token map 
		var _tokenDataMap = ds_map_create();
		
		//set default value
		ds_map_add(_tokenDataMap,"Token0",-1)
		ds_map_add(_tokenDataMap,"Token1",-1)
		ds_map_add(_tokenDataMap,"Token2",-1)
		ds_map_add(_tokenDataMap,"Token3",-1)

		// add token map in all player token map 
		ds_map_add_map(_playerTokenMap,string(playerUniqueID),_tokenDataMap);
		
		// token map 
		var _winnerMap = ds_map_create();
		
		//set default value
		
		for (var _winnerIndex = 0; _winnerIndex < noOfPlayers; ++_winnerIndex) 
		{
		    ds_map_add(_winnerMap,"Winner" + string(_winnerIndex),-1)
		}

		// add self id all player array 
		ds_list_add(dsListPlayerUniqueID,playerUniqueID);
		
		// my pos in game 
		gamePos = GamePos.First;
		
		// get oppo player id from temp player list 
		var _oppoPlayerID = ds_map_find_first(PlayerIDsTemp);
		
		// second player index 
		var _playerIndex = GamePos.Second;
		
		repeat(noOfPlayers - 1)
		{
			// gat player from temp player map and set in player list 
			ds_list_add(dsListPlayerUniqueID,_oppoPlayerID);
			
			//add oppo player in player id map 
			ds_map_add(_playerIDMap,"Player"+string(_playerIndex)+"ID",_oppoPlayerID);
			
			// add token map in all player token map
			ds_map_add_map(_playerTokenMap,string(_oppoPlayerID),_tokenDataMap);
			
			// get next oppo Player ID from temp player list 
			_oppoPlayerID = ds_map_find_next(PlayerIDsTemp,_oppoPlayerID);
			
			// next player index 
			_playerIndex++;
		}
		
		// set default data, playerID and token map in game room map 
		ds_map_add(_gameRoomMap,"Chance",playerUniqueID);
		ds_map_add_map(_gameRoomMap,"PlayerToken",_playerTokenMap);
		ds_map_add_map(_gameRoomMap,"PlayerIDs",_playerIDMap);
		ds_map_add_map(_gameRoomMap,"WinnerIDs",_winnerMap);
	
		// reset game room 
		callBackGameRoomUpdate.Set(json_encode(_gameRoomMap));
		
		// remove listener fom temp list 
		callBackGameRoomTempList.ListenerRemove();
	}
}

//this function help to get particular tile object from tile map  
function get_tile_object(TileIndex,Tiletype = TileType.Normal,RoomPos = GameRoomPos.BottomLeft)
{
	// normal tile list 
	var _tileList = dsListTileNormal;
	var _tileObj = noone;
	
	// if tile type is home tile type 
	if(Tiletype == TileType.Home)
	{
		// home tile list 
		_tileList = dsListTileHome;
	}
	
	// if tile type is finish tile type
	if(Tiletype == TileType.Finish)
	{
		// finish tile list  
		_tileList = dsListTileFinish;
	}
	
	// get tile list size 
	var _listSize = ds_list_size(_tileList);
	
	for (var _tileIndex = 0; _tileIndex < _listSize; ++_tileIndex) 
	{
		// get tile object from 
	    var _tile = ds_list_find_value(_tileList,_tileIndex);
		
		var _tileNo = _tile.tileNo;
		var _roomPos = _tile.gameRoomPos;
		
		// if all condition is true 
		if( _tileNo ==  TileIndex && ( Tiletype == TileType.Normal ||_roomPos == RoomPos))
		{
			// get tile object 
		   _tileObj = _tile;
		   break;
		}
		
	}
	// return tile object id 
	return _tileObj;
}

// this function help to create token 
function create_token(PlayerId = playerUniqueID,PawnCol = pawnColour,roomPos = GameRoomPos.BottomLeft,myPlayer = true)
{
	// get pawn object  
	var _pawn = (myPlayer == true)? obj_pawn_my : obj_pawn_oppo;
	
	// create token list 
	var _dsListToken = ds_list_create();
	
	for (var _tileIndex = 0; _tileIndex < 4; ++_tileIndex) 
	{
		// get tile object 
		var _tileObj = get_tile_object(_tileIndex,TileType.Home,roomPos)
	   
		// get x and y 
		var _x = _tileObj.x;
		var _y = _tileObj.y;
	   
	   // get sprite 
	   var _spriteIndex = Token_Get_Data(tokenIndex,TokenData.Sprite);
	   
		// initailise pawn 
		var _struct = 
		{
			tokenNo		: _tileIndex,
			homeTileID	: _tileObj,
			playerUID	: PlayerId,
			gameRoomPos	: roomPos,
			
			image_index	: PawnCol,
			sprite_index : _spriteIndex,
			
		}
	 
		// create pawn 
		var _tokenObj =  instance_create_depth(_x,_y,-100,_pawn,_struct);
		
		if(myPlayer == false)
		{
		    _tokenObj.get_token_data(PlayerId);
		}
		
		_tileObj.add_token(_tokenObj);
		// add token object in token list 
		ds_list_add(_dsListToken,_tokenObj);
	}
	
	debug_log("PlayerId",PlayerId)
	debug_log("_dsListToken",_dsListToken)
	
	// add token list in player token map 
	ds_map_add_list(dsMapPlayerToken,PlayerId,_dsListToken);
}

// this function help to move token  
function move_token(TokenMap)
{
	// get token map size    
	var _mapSize = ds_map_size(TokenMap);

	for (var _playerIndex = 0; _playerIndex < _mapSize; ++_playerIndex) 
	{
		// get player id 
		var _playerID = ds_list_find_value(dsListPlayerUniqueID,_playerIndex);
		
		if(_playerID != -1)
		{
			// get player token map 
			var _tokenMap = ds_map_find_value(TokenMap,_playerID)
			
			// get token object list 
			var _tokenObjList = ds_map_find_value(dsMapPlayerToken,_playerID);
			
			for (var _tokenIndex = 0; _tokenIndex < 4; ++_tokenIndex) 
			{
				// get target token index 
				var _tarTokenIndex = ds_map_find_value(_tokenMap,"Token"+ string(_tokenIndex));
			
				// ignore if target tile index is -1 
				if(_tarTokenIndex != -1)
				{
					// get token object from list 
					var _tokenObj = ds_list_find_value(_tokenObjList,_tokenIndex);
				
					// move token object  
					_tokenObj.token_move_forward(_tarTokenIndex);
				
					// if self id 
					if(_playerID == playerUniqueID)
					{
						// can upload oppo data if hit oppo 
						_tokenObj.uploadOppoData = true;
					}
				}
			}  
		}	
	}
}

// set chance to next player chance 
function next_player_chance()
{
	// next player game pos 
	var _gamePos = gamePos;
	
	var _nextPlayerID = -1
	
	while(_nextPlayerID == -1)
	{
	   _gamePos++;
	
		_gamePos = _gamePos mod noOfPlayers;

		// next player id 
		 _nextPlayerID = ds_list_find_value(dsListPlayerUniqueID,_gamePos);
	}
	diceValue = 0;
	// set next player 
	set_player_chance(_nextPlayerID);
}

// reset dice value to -1 
function set_player_chance(PlayerID)
{
	// set next player  
	callBackGameChanceSet.Set(PlayerID);;
}


// reset dice value to -1 
function reset_dice_value()
{
  callBackDiceValue.Set(-1);
}


function token_reach_home()
{
	var _allPlayerReach = false;
   
   noOfTokenAtHome++;
   
   if(noOfTokenAtHome == 1)
   {
	   _allPlayerReach = true;
	   
		game_complete();
   }
   
   return _allPlayerReach;
}

function game_complete()
{
	 callBackGameWinnerIDs.Read();
}

function left_playerID_map()
{
    callBackGameRoomPlayerIDsSet.Path_Update(gameRoomPath +"/PlayerIDs/Player" + string(gamePos)+"ID");
	callBackGameRoomPlayerIDsSet.Set(-1);
}

// debug
//create_oppo_player(noOfPlayers)