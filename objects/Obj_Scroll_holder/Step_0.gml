
//if (instance_exists(owner) == false) {instance_destroy()};

if(going)
{
	
	if(owner.V_H == ScrollAxis.Vertical)
	{
	
		if(abs(go - y) > 0.2)
		{	
			y += (go - y) / Scroll_K_transfer
			with(owner)
				Script_Scroll_callChildenMove(list)
		}
		else
			going = false

	}
	else
	{
		if(abs(go - x) > 0.2)
		{
			x += (go - x) / Scroll_K_transfer
			with(owner)
				Script_Scroll_callChildenMove(list)
		}
		else
			going = false
	}
}
