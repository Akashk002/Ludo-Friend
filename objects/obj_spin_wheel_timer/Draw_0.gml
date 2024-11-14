/// @description
// Set GMLive
GMLiveSet

event_inherited();
// Add Code Here

if(instance_exists(obj_button_wheel_spin) == true)
{
	var _nextSpinText = obj_button_wheel_spin.nextSpinText;
	
	if(_nextSpinText != "")
	{
		draw_sprite_ext(spr_choose_entry_coins_bg,0,x,y,1.75,1,0,c_white,1);
		draw_text(x,y,_nextSpinText);
	}
}
