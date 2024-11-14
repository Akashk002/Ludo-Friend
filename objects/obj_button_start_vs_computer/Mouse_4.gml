/// @description Event Left Pressed

// Inherit the parent event
event_inherited();

// set player data 
obj_pop_up_vs_computer.Set_player_data();

//change room 
room_goto(rm_game_computer);