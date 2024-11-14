/// @function Scroll_moveToPorcent_brute(scroll,porcent)
/// @description 
function Scroll_moveToPorcent_brute(argument0, argument1) {

	/// @param {real} scroll
	/// @param {real} porcent

	var scroll = argument0
	var goto = argument1

	Scroll_moveToPorcent(scroll,goto)

	scroll.pixels_transfer = scroll.pixels
	scroll.porcent_transfer = scroll.porcent


	with(scroll)
	{	
		event_perform(ev_other,ev_user2)
		event_perform(ev_other,ev_user3)
	}




}
