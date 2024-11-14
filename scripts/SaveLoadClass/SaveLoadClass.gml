
#macro SAVE_FILE "ludoTest7.sav"

///Save Game
function Game_Save()
{
	//check if save file already exist
	if (file_exists(SAVE_FILE))
	{
		//if file exist, delet it
		file_delete(SAVE_FILE);
	};
	
	//create a new save file
	
	//create map
	var _saveMap = ds_map_create();
	
	ds_map_add(_saveMap, string( SaveDataType.PlayerUID)	,playerUniqueID);
	ds_map_add(_saveMap, string( SaveDataType.PlayerName)	,playerName);
	ds_map_add(_saveMap, string( SaveDataType.Coin)			,playerCoins);
	ds_map_add(_saveMap, string( SaveDataType.AvtarSprite)  ,playerAvtarSprite);
	ds_map_add(_saveMap, string( SaveDataType.Diamond)		,playerDiamonds);
	ds_map_add(_saveMap, string( SaveDataType.ComputerWins)	,playerComputerWins);
	ds_map_add(_saveMap, string( SaveDataType.ComputerLose)	,playerComputerLose);
	ds_map_add(_saveMap, string( SaveDataType.OpponentToken),opponentTokensCaptured);
	ds_map_add(_saveMap, string( SaveDataType.PlayerToken)	,playerTokensCaptured);
	ds_map_add(_saveMap, string( SaveDataType.WinStreak)	,playerWinStreak);
	ds_map_add(_saveMap, string( SaveDataType.OnlineWins)	,playerOnlineWins);
	ds_map_add(_saveMap, string( SaveDataType.OnlineLose)	,playerOnlineLose);
	
	//secure save file
	ds_map_secure_save(_saveMap, SAVE_FILE);

};


///Load Game
function Game_Load()
{
	//check file exist
	if (file_exists(SAVE_FILE))
	{
		//load map
		var _saveMap = ds_map_secure_load(SAVE_FILE);

		//get data from map
		playerUniqueID			= _saveMap[? string(SaveDataType.PlayerUID)];
		playerName				= _saveMap[? string(SaveDataType.PlayerName)];
		playerCoins				= _saveMap[? string(SaveDataType.Coin)];
		playerAvtarSprite		= _saveMap[? string(SaveDataType.AvtarSprite)];
		playerDiamonds			= _saveMap[? string(SaveDataType.Diamond)];
		playerComputerWins		= _saveMap[? string(SaveDataType.ComputerWins)];
		playerComputerLose		= _saveMap[? string(SaveDataType.ComputerLose)];
		opponentTokensCaptured	= _saveMap[? string(SaveDataType.OpponentToken)];
		playerTokensCaptured	= _saveMap[? string(SaveDataType.PlayerToken)];
		playerWinStreak			= _saveMap[? string(SaveDataType.WinStreak)];
		playerOnlineWins		= _saveMap[? string(SaveDataType.OnlineWins)];
		playerOnlineLose		= _saveMap[? string(SaveDataType.OnlineLose)];
		
		Player_Set_Data( string( SaveDataType.PlayerUID)	,playerUniqueID);
		Player_Set_Data( string( SaveDataType.PlayerName)	,playerName);
		Player_Set_Data( string( SaveDataType.Coin)			,playerCoins);
		Player_Set_Data( string( SaveDataType.AvtarSprite)  ,playerAvtarSprite);
		Player_Set_Data( string( SaveDataType.Diamond)		,playerDiamonds);
		Player_Set_Data( string( SaveDataType.ComputerWins)	,playerComputerWins);
		Player_Set_Data( string( SaveDataType.ComputerLose)	,playerComputerLose);
		Player_Set_Data( string( SaveDataType.OpponentToken),opponentTokensCaptured);
		Player_Set_Data( string( SaveDataType.PlayerToken)	,playerTokensCaptured);
		Player_Set_Data( string( SaveDataType.WinStreak)	,playerWinStreak);
		Player_Set_Data( string( SaveDataType.OnlineWins)	,playerOnlineWins);
		Player_Set_Data( string( SaveDataType.OnlineLose)	,playerOnlineLose);
		
	};
};
