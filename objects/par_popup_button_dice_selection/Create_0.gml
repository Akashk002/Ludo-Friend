/// @description

// Set GMLive
GMLiveSet

event_inherited();

// Add Code Here
diceIndx = 1;
isSelected = false;

diceSprite = Dice_Get_Data(diceIndx,DiceData.Sprite);
diceName = Dice_Get_Data(diceIndx,DiceData.Name);


function select()
{
	with(par_popup_button_dice_selection)
	{
		isSelected = false;
	 }
	 
	 diceIndex = diceIndx;
	 
	 Player_Set_Data(SaveDataType.DiceIndex,diceIndex);
		
	instance_create_depth(0,0,0,PlayerSetData);	
		
	 isSelected = true;
}


