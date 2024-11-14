/// @description

// Set GMLive
GMLiveSet

// Add Code Here

// tile list 
dsListTileHome = ds_list_create();
dsListTileNormal = ds_list_create();
dsListTileFinish = ds_list_create();

// game paused 
gamePaused  = false;

// dice list create 
dsListDice = ds_list_create();

// player map create 
dsMapPlayerToken = ds_map_create();

// computer chance 
CompPlayerChance = false;

diceValue = 0;

playerChance = 0;

// initial state
state = GameState.WaitDiceRoll;

autoGame = false;

dsListResult =  ds_list_create();

enum GameState {WaitDiceRoll,DiceRolling,ChooseToken,TokenMoving,GameEnd};

// create player in game room 
function create_player(NoofPlayer)
{
	var _rw = Get_Room_Width()/2;
	var _rh = Get_Room_Height()/2;
	var _w = 420;
	var _h = 640;
	
	// create list 
	var _dsListGamePos = ds_list_create();
	
	switch (NoofPlayer) 
	{
		// if 2 player 
	    case NoOfPlayer.Two:
			// add game room pos 
	        ds_list_add(_dsListGamePos,GameRoomPos.BottomLeft,GameRoomPos.TopRight);
	        break;
		// if 3 player 
	    case NoOfPlayer.Three:
		// add game room pos 
	        ds_list_add(_dsListGamePos,GameRoomPos.BottomLeft,GameRoomPos.TopLeft,GameRoomPos.TopRight);
	        break;
		// if 4 player 
	    case NoOfPlayer.Four:
		// add game room pos 
	        ds_list_add(_dsListGamePos,GameRoomPos.BottomLeft,GameRoomPos.TopLeft,GameRoomPos.TopRight,GameRoomPos.BottomRight);
	        break;
	    default:
	        // code here
	        break;
	}

	for (var _gamePos = 0; _gamePos < NoofPlayer; ++_gamePos) 
	{
		// find current player game pos 
		var _gameRoomPos = ds_list_find_value(_dsListGamePos,_gamePos);
		if(_gameRoomPos == GameRoomPos.BottomLeft)
		{
			// get player map 
			var _playerMap = ds_map_find_value(dsMapPlayerVsCompName,_gamePos);
			//bottom left 
			// create dice roll object add set player data  
			var _diceRollObj = instance_create_layer(_rw - _w, _rh + _h,"Instances_Dice", obj_dice_roll_vs_comp);
				_diceRollObj.gameRoomPos = _gameRoomPos;
				_diceRollObj.name =  ds_map_find_value(_playerMap,"Name");
				_diceRollObj.compPlayer =  ds_map_find_value(_playerMap,"Comp");
			
			// add dice roll object in list  
			ds_list_add(dsListDice,_diceRollObj);
			
			// create tokens 
			var _pawnColour = PawnColour.Green;
			create_token(_pawnColour,_gameRoomPos);
		}
		
		if(_gameRoomPos == GameRoomPos.TopLeft)
		{
			// get player map 
			var _playerMap = ds_map_find_value(dsMapPlayerVsCompName,_gamePos);
			
			//top right
			// create dice roll object add set player data
			var _diceRollObj = instance_create_layer(_rw - _w, _rh - _h,		"Instances_Dice", obj_dice_roll_vs_comp);
			_diceRollObj.gameRoomPos = _gameRoomPos;
			_diceRollObj.name =  ds_map_find_value(_playerMap,"Name");
			_diceRollObj.compPlayer =  ds_map_find_value(_playerMap,"Comp");
			
			// add dice roll object in list  
			ds_list_add(dsListDice,_diceRollObj);
			
			// create token 
			var _pawnColour = PawnColour.Yellow;
			create_token(_pawnColour,_gameRoomPos);
		}
		
		if(_gameRoomPos == GameRoomPos.TopRight)
		{
			var _playerMap = ds_map_find_value(dsMapPlayerVsCompName,_gamePos);
			
			//top left
			// create dice roll object add set player data
			var _diceRollObj = instance_create_layer(_rw + _w, _rh - _h ,		"Instances_Dice", obj_dice_roll_vs_comp);
			_diceRollObj.gameRoomPos = _gameRoomPos;
			_diceRollObj.name =  ds_map_find_value(_playerMap,"Name");
			_diceRollObj.compPlayer =  ds_map_find_value(_playerMap,"Comp");
			
			// add dice roll object in list  
			ds_list_add(dsListDice,_diceRollObj);
			
			// create token 
			var _pawnColour = PawnColour.Blue;
			create_token(_pawnColour,_gameRoomPos);
		}
		
		if(_gameRoomPos == GameRoomPos.BottomRight)
		{
			var _playerMap = ds_map_find_value(dsMapPlayerVsCompName,_gamePos);
			
			//bottom right 
			// create dice roll object add set player data
			var _diceRollObj = instance_create_layer(_rw + _w, _rh + _h ,		"Instances_Dice", obj_dice_roll_vs_comp);
			_diceRollObj.gameRoomPos = _gameRoomPos;
			_diceRollObj.name =  ds_map_find_value(_playerMap,"Name");
			_diceRollObj.compPlayer =  ds_map_find_value(_playerMap,"Comp");
			
			// add dice roll object in list  
			ds_list_add(dsListDice,_diceRollObj);
			
			// create token 
			var _pawnColour = PawnColour.Red;
			create_token(_pawnColour,_gameRoomPos);
		}
	}
}

function change_state(State)
{
	if(state != GameState.GameEnd)
	{
		state = State;
	}
}
	
// check chance
function check_player_chance(MyChance = false)
{
	
	_diceRollObj = -1;
	
	// repeat player 
	repeat(noOfPlayers)
	{
		// if dice value is less than 6 add my chance is false 
		if(diceValue < 6) && (MyChance == false)
		{
			// next player chance 
			playerChance++;
			
			playerChance = playerChance mod noOfPlayers;
			
			// reset all player sixComes value 
			with(obj_dice_roll_vs_comp) 
			{ 
				sixComes = 0;
			}
		}
		
		// dice roll object with respect to player chance 
		var _diceRollObj = ds_list_find_value(dsListDice,playerChance);
		
		// if dice roll object is not -1 
		if(_diceRollObj != -1)
		{
			break;
		}
	}
	
		// all player complete game
	if(ds_list_size(dsListResult) == noOfPlayers - 1)
	{
		// change state 
		change_state(GameState.GameEnd);
		
		// set last player id 
		_diceRollObj.player_set_result();
	
	   // turn off all player dice roll object 
	   with(obj_dice_roll_vs_comp) 
	   { 
		   // turn off dice roll object 
		   turnOn(false) 
		};
		
		// game is completed 
		game_complete();
		
		return;
	}
	
	// turn on dice roll object 
	_diceRollObj.turnOn();
	
	// state change to wait dice roll 
	change_state(GameState.WaitDiceRoll);
	
	// get player map 
	var _playerMap = ds_map_find_value(dsMapPlayerVsCompName,playerChance);
	
	// check if comp chance or player chance 
	CompPlayerChance = ds_map_find_value(_playerMap,"Comp");
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
function create_token(PawnCol = PawnColour.Green,roomPos = GameRoomPos.BottomRight)
{
	// create token list 
	var _dsListToken = ds_list_create();
	
	for (var _tileIndex = 0; _tileIndex < 4; ++_tileIndex) 
	{
		// get tile object 
		var _tileObj = get_tile_object(_tileIndex,TileType.Home,roomPos)
	   
		// get x and y 
		var _x = _tileObj.x;
		var _y = _tileObj.y;
	   
	   var _spriteIndex = Token_Get_Data(tokenIndex,TokenData.Sprite);
	   
		// initailise pawn 
		var _struct = 
		{
			tokenNo		: _tileIndex,
			homeTileID	: _tileObj,
			gameRoomPos	: roomPos,
			image_index	: PawnCol,
			sprite_index : _spriteIndex
		}
	 
		// create pawn 
		var _tokenObj =  instance_create_depth(_x,_y,-100,obj_pawn_vs_comp,_struct);
		
		_tileObj.add_token(_tokenObj);
		
		// add token object in token list 
		ds_list_add(_dsListToken,_tokenObj);
	}
	
	// add token list in player token map 
	ds_map_add_list(dsMapPlayerToken,roomPos,_dsListToken);
}

// this function help to get token 
function get_tokenID(RoomPos,TokenIndex)
{
	// get token list 
	var _tokenList = ds_map_find_value(dsMapPlayerToken,RoomPos);
	
	// get token 
	var _token = ds_list_find_value(_tokenList,TokenIndex);
	return _token;
}

alarm[0] = 2;

// this function help to check token 
function check_token_can_move(DiceNum,GameroomPos)
{
	// 
	with(obj_pawn_vs_comp)
	{
		canMove = false;
	}
	
   var _singleToken = noone;
   var _tokenMoveCount = 0;
   for (var _tokenIndex = 0; _tokenIndex < 4; ++_tokenIndex) 
   {
	   // get token id 
       var _tokenID = get_tokenID(GameroomPos,_tokenIndex);
	   
	   // check token move 
	   var _tokenCanMove = _tokenID.check_token_can_move(DiceNum);
	   
	   // token can move 
	   if(_tokenCanMove == true)
	   {
		   _singleToken = _tokenID;
	      _tokenID.image_xscale = 1.5;
	      _tokenID.image_yscale = 1.5;
		  _tokenID.canMove = true;  
		  _tokenMoveCount++ ;
	   }
	   
   }
   
   // get dice value 
   diceValue = DiceNum;
   
   // if token move count 
	if(_tokenMoveCount <= 0)
	{
		// check player chance 
		check_player_chance();
	}
	else
	if(_tokenMoveCount == 1)
	{
		// token move forward 
		_singleToken.token_move_forward(DiceNum);
	}
	else
	{
		// state to choose token
		change_state(GameState.ChooseToken);
	}
}

// this function help to get right token 
function get_right_token(_tokenList)
{
	// priority lists created  
	var _tokenHitOppoList		= ds_list_create();
	var _tokenGetHitByOppoList	= ds_list_create();
	var _tokenCanHitToOppoList	= ds_list_create();
	var _tokenGetStarTileList	= ds_list_create();
	var _tokenGetLastTilelist	= ds_list_create();
	var _tokenHomeTileTokenList = ds_list_create();
	var _tokenNormalList		= ds_list_create();
	
	// create list 
	var _dsListPriority = ds_list_create();
	
	// add different list in priority list 
	ds_list_add(_dsListPriority,_tokenNormalList,_tokenHomeTileTokenList,_tokenGetStarTileList,_tokenCanHitToOppoList,_tokenGetHitByOppoList,_tokenHitOppoList);
	
	for (var _tokenIndex = 0; _tokenIndex < 4; ++_tokenIndex) 
	{
		// get token object from token list 
		var _tokenObj = ds_list_find_value(_tokenList,_tokenIndex);
		
		// if token can move 
		if(_tokenObj.canMove == true)
		{	
			// if tile index 
			if(_tokenObj.tileIndex <= 50)
			{
				#region hit list 
				// get oppoID 
				var _oppoID = _tokenObj.token_can_hit_oppo(diceValue);
				
				// if oppo ID is not noone 
				if(_oppoID != noone)
				{
					// add token object in hit list 
					ds_list_add(_tokenHitOppoList,_tokenObj);
				}
				#endregion
			
				#region can hitted by oppo list 
				for (var _stepIndex = 0; _stepIndex <= 7; ++_stepIndex) 
				{
					// get oppo id 
				    var _oppoID = _tokenObj.get_oppo_token(-_stepIndex);
					
					// if oppo id not noone 
					if(_oppoID != noone)
					{
						// add token object in list 
					    ds_list_add(_tokenGetHitByOppoList,_tokenObj);
						break;
					}
				}
				#endregion
			
				#region can hit to oppo list 
				for (var _stepIndex = 1; _stepIndex <= 7; ++_stepIndex) 
				{
					// get oppo id 
				    var _oppoID = _tokenObj.get_oppo_token(_stepIndex);
					
					// check condition 
					if(_oppoID != noone && _stepIndex > diceValue)
					{
						// add token in list
					    ds_list_add(_tokenCanHitToOppoList,_tokenObj);
						break;
					}
				}
				#endregion
			
				#region name here
				
				// get tile 
				var _Tile = _tokenObj.token_get_tile(diceValue);
				
				// if tile type is star type 
				if(_Tile.tileType == TileType.Star)
				{
					// add token in list 
					ds_list_add(_tokenGetStarTileList,_tokenObj);
				}
				#endregion
				
				#region name here
				
				// get tile 
				var _Tile = _tokenObj.token_get_tile(diceValue);
				
				// token reach last home tile 
				if(_Tile.tileNo == lastHomeTileNo)
				{
					// add token obj in list 
					ds_list_add(_tokenGetLastTilelist,_tokenObj);
				}
				#endregion
				
				#region name here
				
				// get tile index 
				var _tokenTileIndex = _tokenObj.tileIndex;
				if(_tokenTileIndex == -1)
				{
					// if token is in Home 
					ds_list_add(_tokenHomeTileTokenList,_tokenObj);
				}
				#endregion
			}
			
			// add token in list 
			ds_list_add(_tokenNormalList,_tokenObj);
		}
	}
	
	// create priority list 
	var _tokenMovePrioirity = ds_priority_create();
	
	// get list size 
	var _priorityListSize = ds_list_size(_dsListPriority);
	
	// get list size 
	var _normalListSize = ds_list_size(_tokenNormalList);
	
	for (var _tokenIndex = 0; _tokenIndex < _normalListSize; ++_tokenIndex) 
	{
		// get token ID  
		var _tokenID = ds_list_find_value(_tokenNormalList,_tokenIndex);
		
		var _tokenPriority = 0;
		
		for (var _listIndex = 0; _listIndex < _priorityListSize; ++_listIndex) 
		{
			// get list 
			var _list = ds_list_find_value(_dsListPriority,_listIndex);
			
			// if tokex is exist in the obove list 
			if(ds_list_find_index(_list,_tokenID) != -1)
			{
				// cal token priority 
				_tokenPriority += _listIndex + 1;
			}
			
			// if token is in star tile 
			if(ds_list_find_index(_tokenGetStarTileList,_tokenID) != -1)
			{
				// if oppo can be hit 
				if(ds_list_find_index(_tokenGetHitByOppoList,_tokenID) != -1)
				{
					// set priority to zero 
					_tokenPriority = 0;
				}
			}
		}
		
		if (_tokenPriority >= 0)
		{
			// set token priority 
			ds_priority_add(_tokenMovePrioirity,_tokenID,_tokenPriority)
		}
	}
	
	// get max priority token 
	var _tokenID = ds_priority_find_max(_tokenMovePrioirity);
	
	return _tokenID;
}

// help to get last remainging player 
function result_add_last_player()
{
	for (var _playerChance = 0; _playerChance < noOfPlayers; ++_playerChance) 
	{
		// get player map 
		var _playerMap = ds_map_find_value(dsMapPlayerVsCompName,_playerChance);
		// get name 
		var _name =  ds_map_find_value(_playerMap,"Name");

		// if obove name is not in result list 
		if(ds_list_find_index(dsListResult,_name) == -1)
		{
			// add player name
			ds_list_add(dsListResult,_name);
			
			break;
		}	
	}
}

// player complete game game 
function game_complete()
{
	// 
	var _resultList  = dsListResult;

	//create popup  
	PopUp_Create(obj_pop_up_game_result_offline,{ resultList : _resultList });
	
}

