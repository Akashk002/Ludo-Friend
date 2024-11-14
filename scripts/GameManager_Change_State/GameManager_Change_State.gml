// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GameManager_Change_State(State)
{
	show_debug_message("||Change State to|| - " + string(State))
	
	with(GameManager)
	{
	  state = State;
	  firstTimeInStep = true;
	}
}