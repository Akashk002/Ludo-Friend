/// @description Initialize variables
depth = -1000;
// Initialize the Firabase Remote Extension
// This function lets you setup the server refresh rate
// In this case this means the extension will refresh every hour.
// For testing purposes you might want to change this to "0" but to
// avoid unecessary queries you should up the value for production.
debug = true || MobileDebug;
var _refreshTime = debug_var(3600,0)
FirebaseRemoteConfig_Initialize(_refreshTime)

// Definition of the default values
var defaults = 
{
	popup_Anim_Spd		: 0.1, 
	entry_Amount		: 100,
	lobby_Wait_Time		: 90,
	token_Move_Spd		: 20,
	token_Move_Back_Spd	: 50,
	dice_RollIng_Time	: 90,
	per_Ad_Intersitial	: 25,
	per_Mobile_Review	: 5,
	emoji_Move_Spd		: 8, 
	dialog_Move_Spd		: 0.1,
	dialog_Wait_Time	: 1.5,
	ds_Map_Store_Coin	: dsMapStoreCoin,
	ds_Map_Store_Cash	: dsMapStoreCoin,
	ds_Map_Store_Diamond: dsMapStoreCoin,
	ds_Map_Daily_Reward	: dsMapDailyReward,
	ds_Map_Dialog_Pretext: dsMapDialogPretext,
	ds_Map_Spin_Wheel_Data: dsMapSpinWheelData,

};


// This will set the default values, default values are retreived for keys that don't exist
// on the remote server and when the application fails to fetch from remote.
var defaultsJSON = json_stringify(defaults);
FirebaseRemoteConfig_SetDefaultsAsync(defaultsJSON);
FirebaseRemoteConfig_FetchAndActivate();
debug_local(debug,"Fire base remote configration  start ")