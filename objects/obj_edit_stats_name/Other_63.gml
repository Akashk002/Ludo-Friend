/// @description ????

var i_d = ds_map_find_value(async_load, "id");

if i_d == input
{
    if ds_map_find_value(async_load, "status")
    {
        if (ds_map_find_value(async_load, "result") != "")
        {
			//	get deck name  	
          var _val = ds_map_find_value(async_load, "result");
		  
		  // get title 
		  title = string_copy(_val,0,limit);
		  
        }
    }
}







