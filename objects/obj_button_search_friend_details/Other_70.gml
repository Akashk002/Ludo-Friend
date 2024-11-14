/// @description

// Set GMLive
GMLiveSet

// Add Code Here

var _responseExists = callBackFriendRequestSend.CheckResponseSet();
if (_responseExists != noone) 
{
    // CallBack response Exists
	if (_responseExists != undefined)
	{
		if (_responseExists == true) 
		{

			// Destroy the PopUp
			get_popup_id().close();

		}
	}
}

