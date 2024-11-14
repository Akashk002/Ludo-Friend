// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum DiceData {Name,Sprite,AnimSprite};

function Dice_Add_Data(DiceIndex,Name,Sprite,AnimSprite)
{
	var _dice1Map = ds_map_create();
	ds_map_add(_dice1Map,DiceData.Name		,Name);
	ds_map_add(_dice1Map,DiceData.Sprite	,Sprite);
	ds_map_add(_dice1Map,DiceData.AnimSprite,AnimSprite);
	ds_map_add_map(dsMapDiceData,DiceIndex,_dice1Map);
}

function Dice_Get_Data(DiceIndex,DiceDataType)
{
	var _diceMap	= ds_map_find_value(dsMapDiceData,DiceIndex);
	var _val		= ds_map_find_value(_diceMap,DiceDataType);
   
	return _val;
}

