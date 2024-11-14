/// @function Scroll_moveToPixels_brute(scroll,position)
/// @description 
function Scroll_moveToPixels_brute(argument0, argument1) {

	/// @param {real} scroll
	/// @param {real} position

	var scroll = argument0

	var goto = argument1

	Scroll_moveToPixels(scroll,goto)

	scroll.pixels_transfer = scroll.pixels
	scroll.porcent_transfer = scroll.porcent




}
