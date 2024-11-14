
going = true

if(owner)
{
	if(owner.V_H == ScrollAxis.Vertical)
	{
		x = owner.x
		go = Ystart - owner.pixels_transfer
	}
	else
	{
		go = Xstart - owner.pixels_transfer
		y = owner.y
	}
}

if(master)
{
	Xdraw = x-master.x
	Ydraw = y-master.y
}

Script_Scroll_callChildenMove(list)