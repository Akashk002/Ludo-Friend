/// @description

// Set GMLive
GMLiveSet

event_inherited();

// Add Code Here

tokenIndx = 1;

tokenSprite = Token_Get_Data(tokenIndx,TokenData.Sprite);
tokenName = Token_Get_Data(tokenIndx,TokenData.Name);
isSelected = false;

function select()
{
	with(par_popup_button_token_selection)
	{
		isSelected = false;
	 }
	 
	 tokenIndex = tokenIndx;
	 
	 Player_Set_Data(SaveDataType.TokenIndex,tokenIndex);
	 
	 instance_create_depth(0,0,0,PlayerSetData);	
	 
	 isSelected = true;
}


