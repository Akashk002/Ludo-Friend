/// @description Event Step

//
if (firstTimeInStep == true) {
	    // code here
		firstTimeInStep = false;
		event_user(0);
		exit;
	};


var _stateMap = dsMapState[? state];

//var _script = _stateMap[? DataType.Script];
//if (is_undefined(_script) == false)
//	{
//	 script_execute(_script);
//	};

var _spr = ds_map_find_value(_stateMap,DataType.Sprite);
if (is_undefined(_spr) == false)
	{

		 if (sprite_index != _spr) {
			 sprite_index = _spr;
			 image_index = 0;	 
		 }
	 };