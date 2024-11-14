/// @description 
//GMLiveSet
var scroll;

var color = c_white;
var list = ds_list_create();

/*// Add Items in the List
for(var a = 0 ; a <= 5 ; a++)
	{		
		var ins = instance_create_depth(x,y,depth,obj_button_coin);
			ins.image_blend = color;
			ins.coins = (a + 1) * 5;
			ins.val = (a+1) * 500;
			
			if (a < 2)
			{
				if (a == 0)
				{
					ins.sprCoin = spr_store_coin;
				}
				else if (a == 1)
				{
					ins.sprCoin = spr_store_coin;
				};
			}
			else
			{
				ins.sprCoin = spr_store_coin;
			}
			
			//
			ds_list_add(list,ins)
	};

//
var _xx = x + 24;

//
var scroll = Scroll_create(_xx,y,depth,sprite_width,sprite_height,list,"H",sprite_get_width(spr_store_mini_base) * 1.15,10)

//
Scroll_refresh(scroll);

//This object dont matter
instance_destroy()
