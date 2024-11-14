/// @description 
GMLiveSet
// Inherit the parent event
event_inherited();

userName = noone;
userAvtarInd = noone ;
matchWon = noone;

playerUID = noone;

// player data call back 
callBackPlayerData = new CallBack();

// help to load player data 
function load_player_data()
{
   callBackPlayerData.Path_Update("User/" + string(playerUID));
   
   callBackPlayerData.Read();   
}

// delete player data pannel from popup and  scroll
function delete_player_from_scroll()
{
	popUpID.popup_child_scroll_remove_child(owner,id); 
}