/// @description ????

//with (par_button_local) 
//{
//    // 
//	isSelected = false;
//	image_index = 0;
//};

//isSelected = true;
//image_index = 1;
////
//noOfPlayers = noofPlayers;

//obj_pop_up_local.activate_name_edit_box(noofPlayers);


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