/// @description

// Set GMLive
GMLiveSet

if(boxID.deActivate == false)
{
	boxID.compPlayer = !boxID.compPlayer;
	
	// if box reset to comp player 
	if(boxID.compPlayer == true)
	{
		// reset data
		boxID.reset_name();
	}
}

