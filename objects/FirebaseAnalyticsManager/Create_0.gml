/// @description
debug	= false;
visible	= debug;
// Unique ID
var _uniqueID = Get_Unique_Code(8);
FirebaseAnalytics_SetUserId(_uniqueID);

function level_retry()
	{
		//
		var _value =
			{
				LEVEL_NAME : string(global.level),
				SUCCESS		: string(false),
			};
		//
		FirebaseAnalytics_LogEvent("LEVEL_END",json_stringify(_value));
		show_debug_message(_value)
	}; 


function user_review(Response)
	{
		//
		//var _value =
		//	{
		//		LEVEL_NAME : string(global.level),
		//		SUCCESS		: string(Response),
		//	};
		////
		//FirebaseAnalytics_LogEvent("LEVEL_END",json_stringify(_value));
		show_debug_message(_value)
	}; 

function show_ad(AdUnitName)
	{
		//
		var _value =
			{
				AD_PLATFORM		: "ADMob",
				AD_UNIT_NAME	: AdUnitName,
				AD_FORMAT		: AdUnitName,

			};
		//
		FirebaseAnalytics_LogEvent("AD_IMPRESSION",json_stringify(_value));
		show_debug_message(_value)
	}; 


function level_complete()
	{
		//
		var _value =
			{
				LEVEL_NAME : string(global.level),
				SUCCESS		: string(true),
			};
		//
		FirebaseAnalytics_LogEvent("LEVEL_END",json_stringify(_value));
		show_debug_message(_value)
	};

function level_skip()
	{
		//
		var _value =
			{
				LEVEL	: string(global.level),
			};
		//
		FirebaseAnalytics_LogEvent("LEVEL_UP",json_stringify(_value));
		show_debug_message(_value)
	};