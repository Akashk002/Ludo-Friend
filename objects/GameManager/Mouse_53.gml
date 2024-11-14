/// @description

// Set GMLive
GMLiveSet

// check state 
if(state == GameManagerState.UpadteToken)
{
	// create list 
	var _list = ds_list_create();
	
	// get instance list  
	instance_position_list(mouse_x,mouse_y,obj_pawn_my,_list,false);
	
	// get token object 
	var _tokenObj = ds_list_find_value(_list,0);
	
	if(is_undefined(_tokenObj) == false)
	{
		// move token object 
		_tokenObj.move_forward();
	}
}






