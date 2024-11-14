/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

PopUpClickEvent
var _fun = function()
{
	PopUp_Create("rm_popup_player_edit",PopUpSlideDirection.Left,PopUpSlideDirection.Right);
}
// Destroy the PopUp
get_popup_id().close(id,_fun);

//var _map = ds_map_create();

//ds_map_add(_map, "Name",	playerName);
//ds_map_add(_map, "Coin",	playerCoins);
//ds_map_add(_map, "Diamond", playerDiamonds);

//var _sMap = json_encode(_map);

//FirebaseRealTime().Path("user/" + playerUniqueID).Set(_sMap);
