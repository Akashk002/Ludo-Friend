/// @description ????

// deselect all  
with (par_button_vs_comp) 
{
	isSelected = false;
	image_index = 0;
};

// slected 
isSelected = true;
image_index = 1;

//
noOfPlayers = noofPlayers;

// activate edit box 
obj_pop_up_vs_computer.activate_name_edit_box(noOfPlayers);

/*
if (instance_exists(obj_pop_up_vs_computer) || instance_exists(obj_pop_up_local)) 
{
	
	var _noOfPlayers = noOfPlayers;
    // code here
	with (obj_pop_up_vs_computer) || (obj_pop_up_local) 
	{
	    // 
		var _i = 0;
		repeat (array_length(arrayEditBox)) 
		{
		    // 
			arrayEditBox[_i].image_alpha = 0.5;
			//
			_i++
		};
		
		//
		
		var _i = 0;
		repeat (_noOfPlayers) 
		{
		    // 
			arrayEditBox[_i].image_alpha = 1;
			//
			_i++
		};
		
	}
}