/// @description Event Step

var _createLobbyID = layer_get_id("Instances_Create_Lobby");
var _joinLobbyID = layer_get_id("Instances_Join_Lobby");

if (createLobby == true)
{
	layer_set_visible(_joinLobbyID, false);
	layer_set_visible(_createLobbyID, true);
}
else
{
	layer_set_visible(_createLobbyID, false);
	layer_set_visible(_joinLobbyID, true);
};