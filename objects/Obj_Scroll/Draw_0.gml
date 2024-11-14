if (list == noone) exit;

if(!owner)
{

	var surf = surface_create(width,heigth)

	surface_set_target(surf)

	Scroll_Draw_Childs(list)
	
	surface_reset_target()

	draw_surface(surf,x,y)

	surface_free(surf)
}
else
{
	
	if(!draw)
		exit
	
	Scroll_Draw_Childs(list)
	
}


