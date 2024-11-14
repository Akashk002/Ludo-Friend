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

// home tiles index 
tileIndex = -1; 

tileID	=  homeTileID;
// target tile 
tarTileIndex = -1;

// target Tile object
targetTileObj = noone;

uploadOppoData = false;

// upload token data call back 
callBackTokenDataSet = new CallBack(gameRoomPath +"/PlayerToken/" + string(playerUID) + "/Token" + string(tokenNo));

// upload oppo token data 
callBackOppoTokenDataSet = new CallBack();

// get token path list 
function get_path_list(GameroomPos)
{
	// normal type tile 
	var _tileType = TileType.Normal;
	
	// no of normal tile  
	var _normalTileCount = 51;
	for (var _tileIndex = 0; _tileIndex <= lastHomeTileNo; ++_tileIndex) 
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
	    var _tile = GameManager.get_tile_object(_tileNo,_tileType,GameroomPos);
		
		// add tile in player tile path list 
		ds_list_add(dsListTile,_tile);
	}
}

// call function 
get_path_list(gameRoomPos)

// this function help to check token can move or move forward 
function token_move_forward(TarTileIndex)
{
	// reset pawn size to normal 
	with(obj_pawn_my)
	{
		image_xscale = 1; 
		image_yscale = 1; 
	}
	// get target tile index
	 tarTileIndex =  TarTileIndex ;
	 
	 tileID.remove_token(id);
	 
	alarm[0] = 1;
}

// this function help to token back to home 
function token_back_to_home()
{
	// token speed  
   var _spd = 50;
   
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
function check_oppo_token(TileObj)
{
	// get oppo token  
	var _oppoToken = instance_place(x,y,par_pawn);
	
	// if oppo token found 
	if(_oppoToken != noone)
	{
		// oppo token id 
		var _oppoID = _oppoToken.playerUID;
		
		// token no 
		var _oppoTokenNo = _oppoToken.tokenNo;
		
		// oppotoken current tile object 
		var _oppoCurTileObj = _oppoToken.tileID ;
		
		if(_oppoID != playerUID && TileObj.tileType != TileType.Star && _oppoCurTileObj == tileID) 
		{
			// oppo token back to home 
			_oppoToken.token_back_to_home();
			
			// if upload data is true 
			if(uploadOppoData == true)
			{
				rechance();
				// upload oppo token data 
				upload_oppoToken_data(_oppoID,_oppoTokenNo)
			}
		}
	}
}

// this function help check token can move 
function check_token_can_move(DiceNum = -1)
{
	var _canMove = true;

	// get dice no.
	var _diceNum = (DiceNum != -1)? DiceNum : obj_button_dice_roll.diceNum;
	
	debug_log("diceNum",_diceNum);
	
	// if tile index is in home 
	if (tileIndex == -1)
	{
		// token move if 6num is comes  
		if(_diceNum < 6)
		{
			_canMove = false;
		}
	}
	else
	{
		//get  target tile index 
		var _targetTileIndex = tileIndex + _diceNum;
		
		// if target tile is not last tile 
		if(_targetTileIndex > lastHomeTileNo)
		{
			_canMove = false;
		}
	}
	
	return _canMove;
}

function rechance()
{ 
	GameManager.set_player_chance(playerUniqueID);
}

function upload_token_data(Step)
{
	callBackTokenDataSet.Set(Step);
}