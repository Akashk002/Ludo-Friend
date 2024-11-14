if (list == noone) exit;

size = ds_list_size(list)

Step = Holder_step + sep

length = Step*size - sep

if(V_H == ScrollAxis.Vertical)
	move_length = length - heigth
else
	move_length = length - width
	
move_length_mine = move_length

var X = x
var Y = y

var a = 0

while(true)
{

	var ins = list[|a]
	
	if(is_undefined(ins))
		break
	
	ins.Xstart = X
	ins.Ystart = Y
	
	//show_message(string(id) + " -> " + string(justCreated))
	if(justCreated or ins.go == noone)
	{
		ins.x = X
		ins.y = Y
	}

	if(V_H == ScrollAxis.Vertical)
	{
		ins.go = Y
		Y += Step
	}
	else
	{
		ins.go = X
		X += Step
	}
	
	ins.depth = depth - 1
	ins.owner = id
	ins.ind = a
	
	if(!master)
		ins.master = id
	else
		ins.master = master
	
	a++
	
	if(justCreated)
		ins.justCreated = true
		
	with(ins)	
		event_perform(ev_other,ev_user0)
		
}

justCreated = false

Scroll_Call_Childen_Move(list)



