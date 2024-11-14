// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum TokenData {Name,Sprite};

function Token_Add_Data(TokenIndex,Name,Sprite)
{
	var _tokenMap = ds_map_create();
	
	ds_map_add(_tokenMap,TokenData.Name	,Name);
	ds_map_add(_tokenMap,TokenData.Sprite,Sprite);
	
	ds_map_add_map(dsMaptokenData,TokenIndex,_tokenMap);
}

function Token_Get_Data(TokenIndex,TokenDataType)
{
	var _tokenMap	= ds_map_find_value(dsMaptokenData,TokenIndex);
	var _val		= ds_map_find_value(_tokenMap,TokenDataType);
	return _val;
}

