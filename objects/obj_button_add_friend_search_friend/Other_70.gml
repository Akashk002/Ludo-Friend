/// @description

// Set GMLive
GMLiveSet

var _responseRead = callBackSearchPlayerRead.CheckResponseRead();
if (_responseRead != noone) 
{
    // CallBack response Exists
	if (_responseRead != undefined)
	{
		// get string map 
		var _playerMap = json_decode(_responseRead);
		
		PopUp_Create(obj_pop_up_search_player, { playerMap: _playerMap });
	}
}






