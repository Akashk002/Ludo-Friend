/// @function Scroll_add_back(scroll,ins)
/// @description 
function Scroll_add_back(argument0, argument1) {

	/// @param {real} scroll
	/// @param {real} ins

	var scroll = argument0
	var Obj_Scroll_back_child = argument1


	scroll.Back = Obj_Scroll_back_child
	Obj_Scroll_back_child.owner = scroll




}


function Scroll_Remove_Child(argument0, argument1) 
{
	/// @param {real} scroll
	/// @param {real} ins

	var scroll = argument0
	var child = argument1


	var list = Scroll_getList(scroll)
	
	ds_list_delete(list,child.ind);
	instance_destroy(child);
	
	Scroll_Refresh(scroll)
}

