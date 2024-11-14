/// @description

// Set GMLive
GMLiveSet

// Add Code Here
//homeTileID = noone;
//playerUID = noone;
//gameRoomPos = GameRoomPos.BottomLeft;

image_speed = 0;

// tile list 
dsListTile = ds_list_create();

canMove = false;

// home tiles index 
tileIndex = -1; 

tileID	=  homeTileID;
// target tile 
tarTileIndex = -1;

// target Tile object
targetTileObj = noone;

uploadOppoData = false;


GameManagerObj = GameManagerVsComp;



// get token path list 
function get_path_list(GameroomPos)
{
	// normal type tile 
	var _tileType = TileType.Normal;
	
	// no of normal tile  
	var _normalTileCount = 51;
	for (var _tileIndex = 0; _tileIndex <= lastHomeTileNo  ; ++_tileIndex) 
	{
		// get tile no 
		var _tileNo = (_tileIndex + 13 * GameroomPos) mod 52;
		
		// if normal tile list is over 
		if(_tileIndex >= _normalTileCount)
		{
			// change tile to finish tile  
			var _tileType = TileType.Finish;
			
			// get tile no 
			_tileNo = _tileIndex - _normalTileCount; 
		}
		// get tile object 
	    var _tile = GameManagerObj.get_tile_object(_tileNo,_tileType,GameroomPos);
		
		// add tile in player tile path list 
		ds_list_add(dsListTile,_tile);
	}
}

// call function 
get_path_list(gameRoomPos)

// this function help to check token can move or move forward 
function token_move_forward(DiceNum)
{
	if(canMove == true)
	{
		canMove = false; 
	
		// reset pawn size to normal 
		with(obj_pawn_vs_comp)
		{
			image_xscale = 1; 
			image_yscale = 1; 
		}
		
		var _diceNum = (tileIndex == -1) ? 1 : DiceNum;
		// get target tile index
		 tarTileIndex =  tileIndex + _diceNum ;
	 
		 tileID.remove_token(id);
	 
		alarm[0] = 1;
	}
}

// this function help to token back to home 
function token_back_to_home()
{
	// token speed  
   var _spd = tokenMoveBackSpd;
   
   // create path 
   var _path = path_add(); 
   
   var _iniTileObj = ds_list_find_value(dsListTile,tileIndex);
   
   for (var _tileIndex = tileIndex; _tileIndex >= 0; --_tileIndex) 
   {
		// get tile object 
		var _tileObj = ds_list_find_value(dsListTile,_tileIndex);
		
		// add path point  
		path_add_point(_path,_tileObj.x,_tileObj.y,_spd);
   }
   
   // add home tile point in path 
   path_add_point(_path,homeTileID.x,homeTileID.y,_spd);
   
   // set path to closed path 
   path_set_closed(_path,false);
   
   // start path 
   path_start(_path,_spd,path_action_stop,false);
   
   	_iniTileObj.remove_token(id);
   
   // set tile index to default 
   tileIndex = -1;
}

// this function help to oppo token exist in same tile index
function check_oppo_token(TileIndex)
{
	var _oppoID = noone;

	var _tileID = ds_list_find_value(dsListTile,TileIndex);
	//debug_log("_tileID",_tileID)
	
	var _tokenID = _tileID.get_token();
	
	//debug_log("_tokenID",_tokenID)
	
	if(_tokenID != noone)
	{
		// 
		if(_tokenID.gameRoomPos != gameRoomPos && _tileID.tileType != TileType.Star)
		{
			_oppoID = _tokenID;
			_oppoID.token_back_to_home();
		}
	}
	
	return _oppoID;
}


// this function help check token can move 
function check_token_can_move(DiceNum)
{
	var _canMove = true;
	
	// if tile index is in home 
	if (tileIndex == -1)
	{
		// token move if 6num is comes  
		if(DiceNum < 6)
		{
			_canMove = false;
		}
	}
	else
	{
		//get  target tile index 
		var _targetTileIndex = tileIndex + DiceNum;
		
		// if target tile is not last tile 
		if(_targetTileIndex > lastHomeTileNo)
		{
			_canMove = false;
		}
	}
	
	return _canMove;
}

// this function help to oppo token exist in same tile index
function token_can_hit_oppo(Dicevalue)
{
	// current tile 
	var _tileID = ds_list_find_value(dsListTile,tileIndex + Dicevalue);
		
	var _oppoID = _tileID.get_token();
	
	if(_oppoID != noone) && (_tileID.tileType != TileType.Star)
	{
		if(_oppoID.gameRoomPos == gameRoomPos) 
		{
			_oppoID = noone;
		}
	}
	
	return _oppoID;
}

function get_oppo_token(Num)
{
	// current tile 
	var _tileIndex = tileIndex + Num;
	
	//debug_log("tileIndex",_tileIndex)
	
	var _tokenID = noone;
	
	if(_tileIndex < 0 || _tileIndex > lastHomeTileNo)
	{
		return _tokenID;
	}
	
	var _tileID = ds_list_find_value(dsListTile,_tileIndex);
	//debug_log("_tileID",_tileID)
	
	var _tokenID = _tileID.get_token();
	
	//debug_log("_tokenID",_tokenID)
	
	if(_tokenID != noone)
	{
		if(_tokenID.gameRoomPos == gameRoomPos)
		{
			_tokenID = noone;
		}
	}
	return _tokenID;
}

// this function help to oppo token exist in same tile index
function token_get_tile(Dicevalue)
{
	// current tile 
	var _tileID = ds_list_find_value(dsListTile,tileIndex + Dicevalue);

	return _tileID;
}
