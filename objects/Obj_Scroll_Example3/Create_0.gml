/// @description ????


/// @description ????


Scroll_Example3()
instance_destroy()



/*
var list = ds_list_create()

for(var a = 0 ; a < 10 ; a++)
{
	var ins = instance_create_depth(x,y,depth,Obj_Scroll_product)
	ins.name = "NAME" + string(a)
	ins.price = "PRICE" + string(a)
		var list_product = ds_list_create()
		var ins_ = instance_create_depth(30,30,depth,Obj_Scroll_buy)
		ins.text = "im here :)"
		ds_list_add(list_product,ins_)
	ins.list = list_product
	
	ds_list_add(list,ins)
}
	
var scroll = Scroll_create(x,y,depth,sprite_width,sprite_height,list,"H",512,1)
Scroll_dragDisable(scroll)

//This object dont matter
instance_destroy()

