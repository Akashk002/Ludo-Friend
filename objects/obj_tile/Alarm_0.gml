/// @description

// Set GMLive
GMLiveSet

// Add Code Here
if(tileType == TileType.Home)
{	
	ds_list_add(gameObject.dsListTileHome,id);
}
else
if(tileType == TileType.Finish)
{
	ds_list_add(gameObject.dsListTileFinish,id);
}
else
{
	ds_list_add(gameObject.dsListTileNormal,id);
}



