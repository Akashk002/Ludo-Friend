/// @description ????


var list = Scroll_getList(owner)

var ins = instance_create_depth(x,y,depth,Obj_Scroll_text_H)
ins.text = "added :)"
ds_list_add(list,ins)


Scroll_refresh(owner)