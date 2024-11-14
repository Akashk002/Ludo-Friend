/// @description

// Set GMLive
GMLiveSet

// Add Code Here

if(ds_exists(list ,ds_type_list))
{
	for (var i = 0; i < ds_list_size(list); ++i) 
	{
	    // code here
		
		instance_destroy(list[| i]);
	};
	
	//
	ds_list_destroy(list)
}







