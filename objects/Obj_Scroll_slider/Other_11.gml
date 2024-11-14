
var pos = start_sprite + (end_sprite-start_sprite) * owner.percent_transfer / 100

if(V_H == ScrollAxis.Vertical)
	y = pos
else
	x = pos

with(owner)
	Scroll_Call_Childen_Move(list)

