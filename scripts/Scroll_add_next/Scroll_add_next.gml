/// @function Scroll_add_next(scroll,ins)
/// @description 
function Scroll_add_next(argument0, argument1) {

	/// @param {real} scroll
	/// @param {real} ins

	var scroll = argument0
	var Obj_Scroll_next_child = argument1


	scroll.Next = Obj_Scroll_next_child
	Obj_Scroll_next_child.owner = scroll




}