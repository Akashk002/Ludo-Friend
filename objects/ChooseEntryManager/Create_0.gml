/// @description
//GMLiveSet

//set initial winning amount according to no of noOfPlayers playing

if (noOfPlayers == NoOfPlayer.Two)				//if two noOfPlayers playing
{
	//
	winningAmount = 2 * entryAmount;
}
else if (noOfPlayers == NoOfPlayer.Three)		//if there are three noOfPlayers
{
	//
	winningAmount = 3 * entryAmount;
}
else if (noOfPlayers == NoOfPlayer.Four)		//if there are four noOfPlayers
{
	//
	winningAmount = 4 * entryAmount;
};