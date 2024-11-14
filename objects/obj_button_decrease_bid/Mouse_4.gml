/// @description ????


// Inherit the parent event
event_inherited();

if (entryAmount > 100)
{
	//decrese entry amount
	entryAmount = entryAmount/2;
	//decrese winning amount if entry amount decreses
	winningAmount = (noOfPlayers) * entryAmount;
	
};