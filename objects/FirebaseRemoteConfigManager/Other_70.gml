/// @description Handle callbacks

debug_local(debug,json_encode(async_load));

switch(async_load[?"type"])
{
	// @triggered be FirebaseRemoteConfig_FetchAndActivate()
	case "FirebaseRemoteConfig_setDefaultsAsync":
		if (async_load[?"success"]) {
		    // code here
			FirebaseRemoteConfig_FetchAndActivate();
		}
		break;
	
	// @triggered be FirebaseRemoteConfig_FetchAndActivate()
	case "FirebaseRemoteConfig_FetchAndActivate":
		debug_local(debug,"FirebaseRemoteConfig_FetchAndActivate: " + string(async_load[?"success"]));
		// At this point if 'success' is true we were able to fetch the remote values and activate them
		// they can now be used inside the app if the function was not successful them the default values
		// are used instead.
		popupAnimSpd		= FirebaseRemoteConfig_GetDouble("popup_Anim_Spd");
		entryAmount			= FirebaseRemoteConfig_GetDouble("entry_Amount");
		lobbyWaitTime		= FirebaseRemoteConfig_GetDouble("lobby_Wait_Time");
		tokenMoveSpd		= FirebaseRemoteConfig_GetDouble("token_Move_Spd");
		tokenMoveBackSpd	= FirebaseRemoteConfig_GetDouble("token_Move_Back_Spd");
		diceRollIngTime		= FirebaseRemoteConfig_GetDouble("dice_RollIng_Time");
		perAdIntersitial	= FirebaseRemoteConfig_GetDouble("per_Ad_Intersitial");
		perMobileReview		= FirebaseRemoteConfig_GetDouble("per_Mobile_Review");
		emojiMoveSpd		= FirebaseRemoteConfig_GetDouble("emoji_Move_Spd");
		dialogMoveSpd		= FirebaseRemoteConfig_GetDouble("dialog_Move_Spd");
		dialogWaitTime		= FirebaseRemoteConfig_GetDouble("dialog_Wait_Time");
		
		// clear map 
		ds_map_clear(dsMapStoreCoin);
		ds_map_clear(dsMapStoreCash);
		ds_map_clear(dsMapStoreDiamond);
		ds_map_clear(dsMapDailyReward);
		ds_map_clear(dsMapDialogPretext);
		ds_map_clear(dsMapSpinWheelData);
		
		// get map data  
		var _dsMapStoreCoin		= FirebaseRemoteConfig_GetString("ds_Map_Store_Coin");
		var _dsMapStoreCash		= FirebaseRemoteConfig_GetString("ds_Map_Store_Cash");
		var _dsMapStoreDiamond	= FirebaseRemoteConfig_GetString("ds_Map_Store_Diamond");
		var _dsMapDailyReward	= FirebaseRemoteConfig_GetString("ds_Map_Daily_Reward");
		var _dsMapDialogPretext	= FirebaseRemoteConfig_GetString("ds_Map_Dialog_Pretext");
		var _dsMapSpinWheelData	= FirebaseRemoteConfig_GetString("ds_Map_Spin_Wheel_Data");

		// get map from RC
		dsMapStoreCoin		= json_decode(_dsMapStoreCoin);
		dsMapStoreCash		= json_decode(_dsMapStoreCash);
		dsMapStoreDiamond	= json_decode(_dsMapStoreDiamond);
		dsMapDailyReward	= json_decode(_dsMapDailyReward);
		dsMapDialogPretext	= json_decode(_dsMapDialogPretext);
		dsMapSpinWheelData	= json_decode(_dsMapSpinWheelData);

		break;
	
	// @triggered be FirebaseRemoteConfig_Reset()
	case "FirebaseRemoteConfig_Reset":
		debug_local(debug,"FirebaseRemoteConfig_Reset: " + string(async_load[?"success"]));
		// At this point if 'success' is true we were able to reset all the keys
		// this function is not compatible with iOS.
		break;
}
