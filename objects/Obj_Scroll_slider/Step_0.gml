
if(pressed)
if(mouse_check_button(mb_left))
{
	var pos;
	
	if(V_H == ScrollAxis.Vertical)
		pos = mouse_y
	else	
		pos = mouse_x
	
	var percent = (pos - start_sprite) / (end_sprite - start_sprite) * 100
	
	Scroll_Move_To_Percent_Brute(owner,percent)
	
	event_perform(ev_other,ev_user1)
	
}
else
	pressed = false