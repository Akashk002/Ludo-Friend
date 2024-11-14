/// @description Insert description here
// You can write your code in this editor

// if file is exist 
if (file_exists(SAVE_FILE) == false)
{
	// create player set data 
	instance_create_depth(0,0,0,PlayerSetData);
}