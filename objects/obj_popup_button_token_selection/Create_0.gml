/// @description

// Set GMLive
GMLiveSet

event_inherited();

// Add Code Here

tokenSprite = Token_Get_Data(tokenIndx,TokenData.Sprite);
tokenName = Token_Get_Data(tokenIndx,TokenData.Name);


function select()
{
	with(obj_popup_button_token_selection)
	{
		isSelected = false;
	 }
	 
	 tokenIndex = tokenIndx;
	 
	 Player_Set_Data(SaveDataType.TokenIndex,tokenIndex);
	 
	 instance_create_depth(0,0,0,PlayerSetData);	
	 
	 isSelected = true;
}


