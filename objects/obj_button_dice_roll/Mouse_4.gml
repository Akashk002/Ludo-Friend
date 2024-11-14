/// @description Insert description here
// You can write your code in this editor
GMLiveSet

// if turn is true and dice rolling is false
if(turn == true) && (diceRolled == false)
{
	// get dice value 
	var _diceValue = 6//irandom_range(1,6);
	
	// if dice value is 6 
	if(_diceValue == 6)
	{
		// sixComes count 
		sixComes++;
		
		// if six come more than 2 times 
		if(sixComes > 1)
		{
		   _diceValue = irandom_range(1,5);
		}
	}
	
	// set dice value 
	callBackUpdateDiceValueSet.Set(_diceValue);
	
	// dice rolling is true 
	diceRolled = true;
}

