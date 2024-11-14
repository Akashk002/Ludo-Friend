/// @description

// Set GMLive
GMLiveSet

if(instance_exists(par_popup)) { exit } ;

// create list 
var _list = ds_list_create();
	
// get instance list  
instance_position_list(mouse_x,mouse_y,obj_pawn_offline,_list,false);
	
var _listSize =  ds_list_size(_list);

if(_listSize > 0)	
{	
	for (var i = 0; i < _listSize; ++i) 
	{
		// get token object 
		var _tokenObj = ds_list_find_value(_list,i);

		if(_tokenObj.canMove == true)
		{
			// move token object 
			_tokenObj.token_move_forward(diceValue);
			
			// 
			with(obj_pawn_offline) 
			{ 
				canMove = false 
			};
			
			break;
		}
	}
}






