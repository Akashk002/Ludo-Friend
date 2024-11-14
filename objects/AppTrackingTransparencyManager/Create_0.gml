//Call this code block before of any other extension that collect data

debug = false;
visible = debug;
var _exit = true
if(os_type == os_ios)
{
if(AppTrackingTransparency_available())
	{
		if(AppTrackingTransparency_status() == AppTrackingTransparency_NotDetermined)
			{
				_exit = false;
				AppTrackingTransparency_request();
			}
	};
};

if (_exit)
{
room_goto_next();
}