/// @description Insert description here
// You can write your code in this editor

avtarIndex = -1
oppoMap = -1; 
oppoName = -1;
avtarPos = -1;
flagIndex = -1;
dialog = "Hurry Up";

callBackOppoDataRead = new CallBack();


function get_player_data(PlayerUID)
{
	callBackOppoDataRead.Path_Update("User/" + string(PlayerUID)); 

	callBackOppoDataRead.Read();
}
