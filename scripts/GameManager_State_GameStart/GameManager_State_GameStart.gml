// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function GameManager_State_GameStart()
{
	//Event User 0
	OnStateStart
	{
		var _rw = Get_Room_Width()/2;
		var _rh = Get_Room_Height()/2;
		var _w = 420;
		var _h = 640;
		
		// self 
		//bottom left 
		// create player avatar 
		var _avtarIcon	= instance_create_layer(_rw - _w, _rh + _h,				"Instances_Dice", obj_game_avtar_player);
			_avtarIcon.avtarPos = GameRoomPos.BottomLeft;
		
		// create rolling dice object 
		var _diceRollObj = instance_create_layer(_rw - _w + 200, _rh + _h,		"Instances_Dice", obj_button_dice_roll);
			_diceRollObj.playerID = playerUniqueID;
		
		// create dialog object 
		instance_create_layer(_rw - _w - 25, _rh + _h + 135,	"Instances_Dice", obj_button_game_text);
		
		// add avatar object in map 
		ds_map_add(dsMapAvatarObj,playerUniqueID,_avtarIcon);
		
		// create token 
		create_token();	
	
	};
};