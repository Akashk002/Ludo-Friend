/// @description ????


if(value)
{
	value = false
	instance_create_depth(0,0,0,Obj_buttonSyncMove)

}
else
{
	value = true
	with(Obj_buttonSyncMove)
		instance_destroy()			
}

room_restart()
