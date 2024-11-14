/// @description ????


// Inherit the parent event
event_inherited();
if (entryAmount >= 100)
{
		//increase entry amount
		entryAmount = 2 * entryAmount;
		//increase winning amount if entry amount increases
		winningAmount = noOfPlayers * entryAmount;
		
};