/// @description

// Set GMLive
GMLiveSet


// Inherit the parent event
event_inherited();

callBackOppoDataRead = new CallBack();

function get_token_data(PlayerUID)
{
	callBackOppoDataRead.Path_Update("User/" + string(PlayerUID)); 

	callBackOppoDataRead.Read();
}
