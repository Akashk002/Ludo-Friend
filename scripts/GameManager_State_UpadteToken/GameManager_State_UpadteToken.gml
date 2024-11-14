// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GameManager_State_UpadteToken()
{
	
	OnStateStart
	{
		// if my chance 
		if(curChancePlayerID == playerUniqueID)
		{
			
			with(obj_pawn_my)
			{
				// if token can move 
				var _canMove = check_token_can_move();

				if(_canMove == true)
				{
					// increase token size to 150%
					image_xscale = 1.5; 
					image_yscale = 1.5; 
				}
			}  
			 
		}
	}
}