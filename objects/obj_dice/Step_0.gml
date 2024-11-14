/// @description Event Step

//var _pressed = mouse_check_button_pressed(mb_left);

//if (_pressed == true) //&& (isPressed == true)
//{
//	timer++;
//	image_speed = 1;
//	sprite_index = spr_dice_white_dot_rotating;
	
//	if (timer > time)
//	{
//		sprite_index = spr_dice_white_dot_front;
//		image_index = irandom(image_number) - 1;
//		image_speed = 0;
//		timer = 0;
//	};
//};

if (sprite_index == spr_dice_white_dot_rotating)
{
	timer++;
	
	if (timer > time)
	{
		sprite_index = spr_dice_white_dot_front;
		image_index = irandom(image_number) - 1; 
		image_speed = 0;
		timer = 0;
	};
};