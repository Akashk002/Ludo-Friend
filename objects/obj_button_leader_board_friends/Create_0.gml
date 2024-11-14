/// @description 

// Inherit the parent event
event_inherited();

//leader board friend display name
leaderName = "Hello";

//leader board friend display rank
leaderRank = 01;

//friend display reward
leaderReward = "10K";

list = ds_list_create();
ds_list_add(list,instance_create_depth(0,0,depth,Obj_Scroll_Item_Img))