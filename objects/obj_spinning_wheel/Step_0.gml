/// @description

// Set GMLive
GMLiveSet

// Add Code Here

if(canSpin == true)
{
	// get image 
	image_angle = lerp(image_angle,rewardAngle,spinWheelSpd/100);
	
	// reset all value  
	if(abs(angle_difference(image_angle,rewardAngle)) < 1 )
	{
		wheelSpinning = false;
		canSpin = false;
		
		//playerCoins += get_spin_reward();
		
		rewardIndex = 0;
		rewardAngle = rewardIndex * 36;
		
		
		if(freeSpin == true)
		{
			// free spin is disable 
			free_spin_set(false);
		}
	}
}






