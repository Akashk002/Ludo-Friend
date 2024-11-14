/// @description

// Set GMLive
GMLiveSet

// Add Code Here

// tile list 
dsListTileHome		= ds_list_create();
dsListTileNormal	= ds_list_create();
dsListTileFinish	= ds_list_create();
dsListDice			= ds_list_create();
dsMapPlayerToken	= ds_map_create();
diceValue = 0;

// random player chance 
playerChance = irandom(noOfPlayers - 1);

// result list 
dsListResult = ds_list_create();

// create oppo player in game room 
function create_player(NoofPlayer)
{
	
	var _rw = Get_Room_Width()/2;
	var _rh = Get_Room_Height()/2;
	var _w = 420;
	var _h = 640;
	
	// creat list 
	var _dsListGamePos = ds_list_create();
	
	// no of player played game 
	switch (NoofPlayer) 
	{
	    case NoOfPlayer.Two:
			//add Game pos  
	        ds_list_add(_dsListGamePos,GameRoomPos.BottomLeft,GameRoomPos.TopRight);
	        break;
	    case NoOfPlayer.Three:
			//add Game pos 
	        ds_list_add(_dsListGamePos,GameRoomPos.BottomLeft,GameRoomPos.TopLeft,GameRoomPos.TopRight);
	        break;
	    case NoOfPlayer.Four:
			//add Game pos 
	        ds_list_add(_dsListGamePos,GameRoomPos.BottomLeft,GameRoomPos.TopLeft,GameRoomPos.TopRight,GameRoomPos.BottomRight);
	        break;
	    default:
	        // code here
	        break;
	}

	for (var _gamePos = 0; _gamePos < NoofPlayer; ++_gamePos) 
	{
		// get player game pos 
		var _gameRoomPos = ds_list_find_value(_dsListGamePos,_gamePos);
		
		if(_gameRoomPos == GameRoomPos.BottomLeft)
		{
			//bottom left 
			var _diceRollObj = instance_create_layer(_rw - _w, _rh + _h,		"Instances_Dice", obj_dice_roll_offline);
				_diceRollObj.gameRoomPos = _gameRoomPos;
				_diceRollObj.name = ds_list_find_value(dsListLocalPlayerName,_gamePos);
				ds_list_add(dsListDice,_diceRollObj);
			
			// set pawn colour
			var _pawnColour = PawnColour.Green;
			
			// create token 
			create_token(_pawnColour,_gameRoomPos);
		}
		
		if(_gameRoomPos == GameRoomPos.TopLeft)
		{
			//top right
			var _diceRollObj = instance_create_layer(_rw - _w, _rh - _h,		"Instances_Dice", obj_dice_roll_offline);
			_diceRollObj.gameRoomPos = _gameRoomPos;
			_diceRollObj.name = ds_list_find_value(dsListLocalPlayerName,_gamePos);
			ds_list_add(dsListDice,_diceRollObj);
			
			// set pawn colour
			var _pawnColour = PawnColour.Yellow;
			// create token 
			create_token(_pawnColour,_gameRoomPos);
		}
		
		if(_gameRoomPos == GameRoomPos.TopRight)
		{
			//top left
			var _diceRollObj = instance_create_layer(_rw + _w, _rh - _h ,		"Instances_Dice", obj_dice_roll_offline);
			_diceRollObj.gameRoomPos = _gameRoomPos;
			_diceRollObj.name = ds_list_find_value(dsListLocalPlayerName,_gamePos);
			ds_list_add(dsListDice,_diceRollObj);
			
			// set pawn colour
			var _pawnColour = PawnColour.Blue;
			// create token 
			create_token(_pawnColour,_gameRoomPos);
		}
		
		if(_gameRoomPos == GameRoomPos.BottomRight)
		{
			//bottom right 
			var _diceRollObj = instance_create_layer(_rw + _w, _rh + _h ,		"Instances_Dice", obj_dice_roll_offline);
			_diceRollObj.gameRoomPos = _gameRoomPos;
			_diceRollObj.name = ds_list_find_value(dsListLocalPlayerName,_gamePos);
			
			ds_list_add(dsListDice,_diceRollObj);
			
			// set pawn colour
			var _pawnColour = PawnColour.Red;
			// create token 
			create_token(_pawnColour,_gameRoomPos);
		}
	}
}

// check player chance 
function check_player_chance(MyChance = false)
{
	_diceRollObj = -1;

	repeat(noOfPlayers)
	{
		//. if dice value is less than 6 
		if(diceValue < 6) && (MyChance == false)
		{
			// next player chance 
			playerChance++;
			playerChance = playerChance mod noOfPlayers;
			
			with(obj_dice_roll_offline) 
			{ 
				sixComes = 0;
			}
		}
		
		var _diceRollObj = ds_list_find_value(dsListDice,playerChance);
		
		if(_diceRollObj != -1)
		{
			break;
		}
	}
	  
	// all player complete game
	if(ds_list_size(dsListResult) == noOfPlayers - 1)
	{
		// set last player id 
		_diceRollObj.player_set_result();
	
	   // turn off all player dice roll object 
	   with(obj_dice_roll_offline) 
	   { 
		   // turn off dice roll object 
		   turnOn(false) 
		};
		
		// game is completed 
		game_complete();
		
		return;
	}
	else
	{
		_diceRollObj.turnOn();
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
			sprite_index : _spriteIndex,
		}
	 
		// create pawn 
		var _tokenObj =  instance_create_depth(_x,_y,-100,obj_pawn_offline,_struct);
		
		_tileObj.add_token(_tokenObj);
		
		// add token object in token list 
		ds_list_add(_dsListToken,_tokenObj);
	}
	
	// add token list in player token map 
	ds_map_add_list(dsMapPlayerToken,roomPos,_dsListToken);
}

// get token id 
function get_tokenID(RoomPos,TokenIndex)
{
	// get token list 
	var _tokenList = ds_map_find_value(dsMapPlayerToken,RoomPos);
	// get token id
	var _token = ds_list_find_value(_tokenList,TokenIndex);
	
	return _token;
}

alarm[0] = 2;

// check token can move 
function check_token_can_move(DiceNum,GameroomPos)
{
	// reset pawn to can not move 
	with(obj_pawn_offline)
	{
		canMove = false;
	}
	var _tokenMoveCount = 0;
	var _singleToken = noone;
	
   for (var _tokenIndex = 0; _tokenIndex < 4; ++_tokenIndex) 
   {
	   // get token id 
       var _tokenID = get_tokenID(GameroomPos,_tokenIndex);
		
		// token can move 
	   var _tokenCanMove = _tokenID.check_token_can_move(DiceNum);
	   
	   // if token can move 
	   if(_tokenCanMove == true)
	   {
			_singleToken = _tokenID;
			_tokenID.image_xscale = 1.5;
			_tokenID.image_yscale = 1.5;
			_tokenID.canMove = true;  
			_tokenMoveCount++ ;
	   }
	   
	   // set dice value 
	   diceValue = DiceNum;
   }
   
   if(_tokenMoveCount == 1)
   {
	   // token move forward 
	   _singleToken.token_move_forward(DiceNum);
   }
   else
   if(_tokenMoveCount <= 0)
   {
	   // check player chance 
      check_player_chance();
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