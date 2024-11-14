/// @description
//GMLiveSet

// Inherit the parent event
event_inherited();

playerUID = " ";

nameMsg = -1;

callBackSearchPlayerRead = new CallBack();

function search_friend()
{
	if(playerUID == "") { return; }
	
	show_debug_message("search friend ")
	
	callBackSearchPlayerRead.Path_Update("User/" + string_lettersdigits(playerUID));
	
   callBackSearchPlayerRead.Read();
}