/// @description

// Set GMLive
GMLiveSet

// if target tile is not last tile 
if(tileIndex < lastHomeTileNo) 
{
	// if target tile index is less current tile index  
	if(tileIndex < tarTileIndex)
	{
		// increase tile index 
		tileIndex++;

		if(tileIndex == lastHomeTileNo)
		{
			alarm[1] = 1;
		}
		
		// get target tile object 
		targetTileObj = ds_list_find_value(dsListTile,tileIndex);
	}
	else
	{
		
		// current tile 
		tileID = ds_list_find_value(dsListTile,tileIndex);
		
		tileID.add_token(id);
		
		// check oppo token 
	    check_oppo_token(tileID);
		
		// reset 
		uploadOppoData = false;
		
		// change state to listen chance  
		GameManager_Change_State(GameManagerState.ReadChance);
		
	}
}






