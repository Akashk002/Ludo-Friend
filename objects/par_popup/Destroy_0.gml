/// @description Destroy

// Destroy the layer and all the content in it
var _layerListSize = ds_list_size(__popUpLayerList);
for (var _layerIndex = 0; _layerIndex < _layerListSize; ++_layerIndex) {
		// Destroy the layer
		var _layerName	= __popUpLayerList[| _layerIndex];
		var _layerID	= layer_get_id(_layerName);
		global.__popUpLayerNo--;
		layer_destroy(_layerID);	
	};
	
// Add Popup id to the list
ds_stack_pop(global.__popUpIDList);
	
// Decrease the depth index
if (global.__popUpDepthIndex > 0) global.__popUpDepthIndex--;
	
// Refresh
var _id = ds_stack_top(global.__popUpIDList);	
// Disable the buttons under and on other popups		
with (___par_popup_element) {
			
		// Normal Button with no popup parent
		if (get_popup_id() == noone) {
				set_active(ds_stack_empty(global.__popUpIDList));
			}
			else
			if (get_popup_id() != _id)
			{
			set_active(false);
			}
			else
			if (get_popup_id() == _id)
			{
			set_active(true);
			}
	};
	
	
if (destroyCallBackObject != noone) 
{
	if(destroyCallBack != noone)
	{
	
	    destroyCallBack();
	}
}	
	
	