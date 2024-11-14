 /// @description Insert description here
// You can write your code in this editor

gameRoomPos = -1;


turn = false; 
imageIndex = 0;
diceRolling = false;
diceNum = -1;
diceRolled = false;
sixComes = 0;
tokenCompleted = 0;
name = -1;


indicator = false;
// ideal spr
diceIdealSprite = Dice_Get_Data(diceIndex,DiceData.Sprite);

// rolling spr 
diceAnimation = Dice_Get_Data(diceIndex,DiceData.AnimSprite);

// dice sprite 
diceSprite = diceIdealSprite;

// anim timer 
animTimer = room_speed;


GameManagerObj = GameManagerOffine ;

// rolling dice 
function rolling_dice(DiceNum = irandom_range(1,6))
{
	// dice rolling is true 
	diceRolled = true;
	
   diceRolling = true;
   
   indicator = false;
   // set dice num 
   diceNum = DiceNum; 
}

// reset num 
function reset()
{
   diceNum = -1;
}

// set turn 
function turnOn(Turn = true)
{	
   with(obj_dice_roll_offline)
   {
	  // disable turnOn 
      turn = false;
   }
   // enable turnOn 
   turn = Turn;
   diceRolled = false;
   indicator = true;
}

// token complete path 
function token_Complete_path()
{
   tokenCompleted++;
	
	// if all token complete path 
   if(tokenCompleted >= 1)
   {
	    player_set_result();
	   
	   // get dice object list 
		var _diceObjList = GameManagerObj.dsListDice;
		
		// get pos 
		var _pos = ds_list_find_index(GameManagerObj.dsListDice,id);
		
		// replace dice object  
		ds_list_replace(_diceObjList,_pos,-1); 
		
		
		// check player chance 
		GameManagerObj.check_player_chance();
   }    
}

// player set name and pawn index in result list 
function player_set_result()
{
	var _name = name ;
	var _gameRoomPos = gameRoomPos ;
	
	// set name and game room pos 
	var _playerStruct = 
	{ 
		name : _name,
		gameRoomPos : _gameRoomPos, 
	};
	
	// add player name in result map 
	var _dsListResult = GameManagerObj.dsListResult;   
	
	// player struct in result list 
	ds_list_add(_dsListResult,_playerStruct);
}