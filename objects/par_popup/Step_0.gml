/// @description

//
if (x == targetX) &&(y == targetY) exit;
// Move
x = popup_approach(x, targetX,PopUpSpeed);
y = popup_approach(y, targetY,PopUpSpeed);

#region Destroy the layer and all the content in it
var _layerListSize = ds_list_size(__popUpLayerList);
for (var _layerIndex = 0; _layerIndex < _layerListSize; ++_layerIndex) {
	// Destroy the layer
	var _layerName	= __popUpLayerList[| _layerIndex];
	var _layerID	= layer_get_id(_layerName);
	
	// Move the layer
	layer_x(_layerID,x);
	layer_y(_layerID,y);
	
	// Move the Child of the layer
	with(___par_popup_element)
	{
	if (layer == _layerID){
		visible = true;
		// 
		x = __popUpID.x + (xstart - __popUpID.xstart);
		y = __popUpID.y + (ystart - __popUpID.ystart);
		}
	};
};
#endregion
