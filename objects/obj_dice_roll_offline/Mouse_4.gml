/// @description

// Set GMLive
GMLiveSet

if(instance_exists(par_popup)) { exit } ;

// Add Code Here
// if turn is true and dice rolling is false
if(turn == true) && (diceRolled == false)
{
	// get dice value 
	var _diceValue = irandom_range(1,6);
	
	// if dice value is 6 
	if(_diceValue == 6)
	{
		// sixComes count 
		sixComes++;
		
		// if six come more than 2 times 
		if(sixComes > 2)
		{
		   _diceValue = irandom_range(1,5);
		}
	}

	rolling_dice(_diceValue);
}





