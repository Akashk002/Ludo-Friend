 /// @description Insert description here
// You can write your code in this editor

turn = false; 
imageIndex = 0;
diceRolling = false;
diceNum = -1;
diceRolled = false;
sixComes = 0;

playerID = noone;

indicator = false;
// ideal spr
diceIdealSprite = Dice_Get_Data(diceIndex,DiceData.Sprite);

// rolling spr 
diceAnimation = Dice_Get_Data(diceIndex,DiceData.AnimSprite);

// dice sprite 
diceSprite = diceIdealSprite;

// anim timer 
animTimer = diceRollIngTime;

// update dice value  
callBackUpdateDiceValueSet = new CallBack(gameRoomPath + "/DiceValue");

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
   with(par_dice_roll)
   {
	   // disable turnOn 
      turn = false;
   }
   
   // enable turnOn 
   turn = Turn;
   
   diceRolled = false;
   indicator = true;
}