/// @description

// Set GMLive
GMLiveSet

if(instance_exists(par_popup)) { exit } ;

// Add Code Here
// if turn is true and dice rolling is false
if(turn == true && diceRolled == false && compPlayer == false)
{
	var _diceValue = get_dice_value();
	
	rolling_dice(_diceValue);
	
	GameManagerObj.change_state(GameState.DiceRolling);
}





