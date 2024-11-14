/// @description Event Draw

var _stateMap = ds_map_find_value(dsMapState,state);

var _script = ds_map_find_value(_stateMap,DataType.Script);
if (is_undefined(_script) == false)
	{
	 script_execute(_script);
	};