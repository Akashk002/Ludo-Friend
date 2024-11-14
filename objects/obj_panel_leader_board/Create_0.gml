/// @description 

var scroll;

var color = c_white;
var list = ds_list_create();

// Add Items in the List
for(var a = 0 ; a < 20 ; a++)
	{		
		var ins = instance_create_depth(x,y,depth,obj_button_leader_board_friends);
			ins.image_blend = color;
			ins.image_xscale = 8;
			ins.leaderRank = a;
			
			//
			ds_list_add(list,ins)
	};
	
//
var _xx = x + 24;

//
var scroll = Scroll_create(_xx,y,depth,sprite_width,sprite_height,list,"H",160,1)

//
Scroll_refresh(scroll);

//This object dont matter
instance_destroy()
