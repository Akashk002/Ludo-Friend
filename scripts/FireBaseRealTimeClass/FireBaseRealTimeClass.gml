// Real Time Data Base Script (v1.5)

function CallBack(path = "", Id = -1) constructor
{
	
ID = Id;
Path = path;

function Path_Update(NewPath)
	{
	Path = NewPath;
	};

function Set(Value)
	{
	ID = FirebaseRealTime().Path(Path).Set(Value);
	};
	
function TimeStamp()
	{
		//	
		var _curTime = date_current_datetime();

		// Change the timestamp to UTC
		date_set_timezone(timezone_utc);

		// Create the starting Date
		var _date = date_create_datetime(1970,1,1,0,0,0);

		// Add the time in the starting date
		var _timeStamp = (_curTime - _date) * 86400; 
		ID = FirebaseRealTime().Path(Path).Set(_timeStamp);
	};
	
function Read()
	{
	ID = FirebaseRealTime().Path(Path).Read();
	};
	
function Delete()
	{
	ID = FirebaseRealTime().Path(Path).Delete();
	};
	
function Exists()
	{
	ID = FirebaseRealTime().Path(Path).Exists();
	};
	
function ListenerSet()
	{
	ID = FirebaseRealTime().Path(Path).Listener();
	};
	
function ListenerRemove()
	{
	ID = FirebaseRealTime().Path(Path).ListenerRemove();
	};
	
function ListenerRemoveAll()
	{
	ID = FirebaseRealTime().Path(Path).ListenerRemoveAll();
	};
	

function DebugData()
	{
		show_debug_message(object_get_name(object_index) + "|" + string(ID) + "|" + string(Path));
	};
	
function CheckResponseSet()
	{
		var _map = async_load;	
		var _ourResponse = noone;
		
		if (_map[? "type"] == "FirebaseRealTime_Set")
		{
			if ((_map[? "listener"]	== ID) && (_map[? "path"]	== Path))
			{
				if (_map[? "status"] == 200)
				{
					_ourResponse = true;
				}
				else
				{
					_ourResponse = false;
				}
			};
		};
		return _ourResponse;
	};
	
function CheckResponseRead()
	{
	var _map = async_load;	
	var _ourResponse = noone;
	if (_map[? "type"] == "FirebaseRealTime_Read")
		{

		if ((_map[? "listener"]		== ID)
			&& (_map[? "path"]		== Path))
			{
				
			if (_map[? "status"] == 200)
				{
					_ourResponse = true;
					
					//
					if (_map[? "value"]	!= undefined)
						{
						_ourResponse = _map[? "value"];						
						}
						else
						{
						_ourResponse = undefined;
						};
					
				}
				else
				{
				_ourResponse = false;
				}
			};
		};
	
	return _ourResponse;
	};
	
function CheckResponseExists()
	{
	var _map = async_load;	
	var _ourResponse = noone;
	if (_map[? "type"] == "FirebaseRealTime_Exists")
		{

		if ((_map[? "listener"]		== ID)
			&& (_map[? "path"]		== Path))
			{
				
			if (_map[? "status"] == 200)
				{
					_ourResponse = true;
					
					//
					if (_map[? "value"]	!= undefined)
						{
						_ourResponse = _map[? "value"];						
						}
						else
						{
						_ourResponse = undefined;
						};
					
				}
				else
				{
				_ourResponse = false;
				}
			};
		};
	
	return _ourResponse;
	};
	
function CheckResponseDelete()
	{
	var _map = async_load;	
	var _ourResponse = noone;
	
	if (_map[? "type"] == "FirebaseRealTime_Delete")
		{

		if ((_map[? "listener"]		== ID)
			&& (_map[? "path"]		== Path))
			{
				
			if (_map[? "status"] == 200)
				{
					_ourResponse = true;
					
					//
					if (_map[? "value"]	!= undefined)
						{
						_ourResponse = _map[? "value"];						
						}
						else
						{
						_ourResponse = undefined;
						};
					
				}
				else
				{
				_ourResponse = false;
				}
			};
		};
	
	return _ourResponse;
	};
	
function CheckResponseListener()
	{
	var _map = async_load;	
	var _ourResponse = noone;
	
	if (_map[? "type"] == "FirebaseRealTime_Listener")
		{

		if ((_map[? "listener"]		== ID)
			&& (_map[? "path"]		== Path))
			{
				
			if (_map[? "status"] == 200)
				{
					_ourResponse = true;
					
					//
					if (_map[? "value"]	!= undefined)
						{
						_ourResponse = _map[? "value"];						
						}
						else
						{
						_ourResponse = undefined;
						};
					
				}
				else
				{
				_ourResponse = false;
				}
			};
		};
	return _ourResponse;
	};

};