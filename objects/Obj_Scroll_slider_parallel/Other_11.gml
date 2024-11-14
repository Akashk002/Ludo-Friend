
var a = 0
var ins_pressed = list[|0]
while(true)
{	
	var ins = list[|a]
	
	if(is_undefined(ins))
		break
		
	if(ins.pressed)
	{
		ins_pressed = ins
		break
	}
	a++
}


var pos = start_sprite + (end_sprite-start_sprite) * list[|0].percent_transfer / 100

if(V_H == ScrollAxis.Vertical)
	y = pos
else
	x = pos

Scroll_Parallel(ins_pressed,list)


var a = 0
while(true)
{
	var ins = list[|a]
	
	if(is_undefined(ins))
		break
		
	with(ins)
		Scroll_Call_Childen_Move(list)
			
	a++
}

