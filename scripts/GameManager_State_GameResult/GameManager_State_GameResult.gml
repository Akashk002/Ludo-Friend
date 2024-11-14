// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GameManager_State_GameResult()
{
	OnStateStart
	{
		with(par_dice_roll)
		{
			// trun off dice pannel 
			turnOn(false);
		}
		
		callBackGameResultRead.Read();
		
		
	}
}