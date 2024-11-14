
enum SaveDataType { PlayerUID, PlayerName, Coin, Diamond, AvtarSprite, ComputerWins, ComputerLose, 
	OpponentToken, PlayerToken,WinStreak, OnlineWins, OnlineLose,FriendList,Request,Invite,FreeSpin,
	FreeSpinTime,DiceIndex,TokenIndex};


//player unique ID
globalvar dsMapPlayerData, playerUniqueID, playerName, playerCoins, playerDiamonds,playerAvtarSprite, playerComputerWins, 
		playerComputerLose,opponentTokensCaptured, playerTokensCaptured, playerWinStreak, playerOnlineWins,
		playerOnlineLose;

	dsMapPlayerData = ds_map_create();
	
	if (!file_exists(SAVE_FILE))
	{
		//unique ID
		playerUniqueID =  Get_Unique_Code(8);

		//name
		playerName = "Guest" + Get_Unique_Code(5);

		//coins
		playerCoins = 1000;

		//diamonds
		playerDiamonds = 10;
		
		//computer wins
		playerAvtarSprite = irandom(11);
		
		//computer wins
		playerComputerWins = 0;
		
		//computer lose
		playerComputerLose = 0;
		
		//opponent token captued by player in ONLINE MODE
		opponentTokensCaptured = 0;
		
		//player token captured by opponents in ONLINE MODE
		playerTokensCaptured = 0;
		
		//player win strek in ONLINE MODE
		playerWinStreak = 0;
		
		//player game wins in online mode
		playerOnlineWins = 0;
		
		//player game lose in online mode
		playerOnlineLose = 0;
		
		//free spin
		freeSpin = 1;
		
		//free spin time 
		freeSpinTime = -1;
		
		diceIndex = 1;
		
		tokenIndex = 1;
		// clear data map 
		ds_map_clear(dsMapPlayerData);

		// add player data in map 
		Player_Set_Data(SaveDataType.PlayerUID,		playerUniqueID);
		Player_Set_Data(SaveDataType.PlayerName,	playerName);
		Player_Set_Data(SaveDataType.Coin,			playerCoins);
		Player_Set_Data(SaveDataType.Diamond,		playerDiamonds);
		Player_Set_Data(SaveDataType.AvtarSprite,	playerAvtarSprite);
		Player_Set_Data(SaveDataType.ComputerWins,	playerComputerWins);
		Player_Set_Data(SaveDataType.ComputerLose,	playerComputerLose);
		Player_Set_Data(SaveDataType.OpponentToken,	opponentTokensCaptured);
		Player_Set_Data(SaveDataType.PlayerToken,	playerTokensCaptured);
		Player_Set_Data(SaveDataType.WinStreak,		playerWinStreak);
		Player_Set_Data(SaveDataType.OnlineWins,	playerOnlineWins);
		Player_Set_Data(SaveDataType.OnlineLose,	playerOnlineLose);
		Player_Set_Data(SaveDataType.FreeSpin,		freeSpin);
		Player_Set_Data(SaveDataType.FreeSpinTime,	freeSpinTime);
		Player_Set_Data(SaveDataType.DiceIndex,		diceIndex);
		Player_Set_Data(SaveDataType.TokenIndex,	tokenIndex);
	
	};

// this function help to set data 
function Player_Set_Data(DataType,Value)
{
  //ds_map_replace(dsMapPlayerData,string(DataType),Value);
  ds_map_replace(dsMapPlayerData,Player_Get_Data_Type_String(DataType),Value);
}
// this function help to set data 
function Player_Set_Map(DataType,Map)
{
  //ds_map_replace(dsMapPlayerData,string(DataType),Value);
  ds_map_add_map(dsMapPlayerData,Player_Get_Data_Type_String(DataType),Map);
}

// this function help to set data 
function Player_Map_Add_Player(DataType,UniqueID)
{
	var _map = Player_Get_Data(DataType);
	
	if(is_undefined(_map))
	{
	    _map = ds_map_create();
	}
	
	ds_map_add(_map,UniqueID,UniqueID);
	
	//ds_map_replace(dsMapPlayerData,string(DataType),Value);
	Player_Set_Map(DataType,_map);
}

// this function help to get data 
function Player_Get_Data(DataType)
{
  var _data = ds_map_find_value(dsMapPlayerData,Player_Get_Data_Type_String(DataType));
  return _data;
}

// get value in string 
function Player_Get_Data_Type_String(Datatype)
{
	switch (Datatype)
	{
	    case SaveDataType.PlayerUID:		return "PlayerUID"		break;
	    case SaveDataType.PlayerName:    	return "PlayerName"     break;
	    case SaveDataType.Coin:    			return "Coin"			break;
	    case SaveDataType.Diamond:			return "Diamond"		break;
	    case SaveDataType.AvtarSprite:		return "AvtarSprite"    break;
	    case SaveDataType.ComputerWins:		return "ComputerWins"   break;
	    case SaveDataType.ComputerLose:    	return "ComputerLose"   break;
	    case SaveDataType.OpponentToken:	return "OpponentToken"	break;
	    case SaveDataType.PlayerToken:		return "PlayerToken"    break;
	    case SaveDataType.WinStreak:    	return "WinStreak"      break;
	    case SaveDataType.OnlineWins:		return "OnlineWins"     break;
	    case SaveDataType.OnlineLose:    	return "OnlineLose"     break;
	    case SaveDataType.FriendList:		return "FriendList"		break;
	    case SaveDataType.Request:			return "Requests"		break;
	    case SaveDataType.Invite:			return "Invites"		break;
	    case SaveDataType.FreeSpin:			return "FreeSpin"		break;
	    case SaveDataType.FreeSpinTime:		return "FreeSpinTime"	break;
	    case SaveDataType.DiceIndex:		return "DiceIndex"		break;
	    case SaveDataType.TokenIndex:		return "TokenIndex"		break;
	}
}

function Create_Player()
{
  var _dsMapPlayer = ds_map_create();
  
  var _playerUI = Get_Unique_Code(8);
  
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.PlayerUID),		_playerUI);
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.PlayerName),		"Guest" + string(Get_Unique_Code(4)));
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.Coin),			irandom(1000));
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.Diamond),		irandom(100));
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.AvtarSprite),	irandom(11));
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.ComputerLose),	irandom(11));
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.ComputerWins),	irandom(11));
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.OpponentToken),	irandom(11));
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.PlayerToken),	irandom(11));
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.WinStreak),		irandom(11));
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.OnlineWins),		irandom(11));
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.OnlineLose),		irandom(11));
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.FreeSpin),		1);
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.FreeSpinTime),	-1);
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.DiceIndex),		1);
  ds_map_add(_dsMapPlayer,Player_Get_Data_Type_String(SaveDataType.TokenIndex),		1);
  
  // create callback 
	callBackUser = new CallBack("User/" + string(_playerUI));

	// set data 
	callBackUser.Set(json_encode(_dsMapPlayer));

}