/// @function Scroll_moveToPixels(scroll,position)
function Scroll_moveToPixels(scroll, goto) {

	/// @description 

	/// @param {real} c
	/// @param {real} position

	//var scroll = argument0

	//var goto = argument1

	if(goto > scroll.move_lenght)
		goto = scroll.move_lenght

	if(goto < 0)
		goto = 0

	scroll.pixels = goto
	scroll.porcent = scroll.pixels/scroll.move_lenght*100




}
