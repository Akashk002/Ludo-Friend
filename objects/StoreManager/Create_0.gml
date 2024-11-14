
GMLiveSet
/// @description
var _noOfDiceType = ds_map_size(dsMapDiceData);

var _x = Get_Room_Width()/2;
var _iniY = 150;
var _gapY = 208;

for (var _diceIndex = 1; _diceIndex <= _noOfDiceType; ++_diceIndex) 
{
	var _y = _iniY + _gapY * _diceIndex;
	
	debug_log("_diceIndex",_diceIndex)
	
	var _select = (_diceIndex == diceIndex); 

	var _struct = {
						image_xscale : 3,
						image_yscale : 1.2,
						diceIndx : _diceIndex,
						isSelected : _select,
					};
	
	instance_create_layer(_x,_y,"Instances_Dice",obj_button_dice_selection,_struct);
}


var _noOfTokenType = ds_map_size(dsMaptokenData);

var _iniY = 1100;


for (var _tokenIndex = 1; _tokenIndex <= _noOfTokenType; ++_tokenIndex) 
{
	var _y = _iniY + _gapY * _tokenIndex;
	
	debug_log("_diceIndex",_tokenIndex)
	
	_select = (_tokenIndex == tokenIndex); 

	var _struct = {
						image_xscale : 3,
						image_yscale : 1.2,
						tokenIndx : _tokenIndex,
						isSelected : _select,
					};
	
	instance_create_layer(_x,_y,"Instances_Dice",obj_button_token_selection,_struct);
}









