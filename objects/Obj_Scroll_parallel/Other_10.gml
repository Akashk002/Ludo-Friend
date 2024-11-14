
var a = 0
var ins_pressed = noone
while(true)
{	
	var ins = list[|a]
	
	if(is_undefined(ins))
		break
		
	if(ins.pressed)
	{
		ins_pressed = ins
	}
	a++
}

Script_Scroll_parallel(ins_pressed,list)
