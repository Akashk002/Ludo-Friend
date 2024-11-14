/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

playerName = obj_edit_stats_name.title;
playerAvtarSprite = obj_stats_avtar.avtarIndex;

// add player data in map 
Player_Set_Data(SaveDataType.PlayerName,	playerName);
Player_Set_Data(SaveDataType.AvtarSprite,	playerAvtarSprite);

instance_create_depth(0,0,0,PlayerSetData);

if (visible == false) exit;
//
if (popUpID != noone) 
{
    // 
	get_popup_id().close();;
};

//create pop up
//PopUp_Create(obj_pop_up_stats);
