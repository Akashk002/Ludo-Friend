/// @description

// Set GMLive
GMLiveSet

// Inherit the parent event
event_inherited();

draw_self();

var _index = 0;
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_set_font(font_size_38);

for (var _imageAngle = 360; _imageAngle > 0; _imageAngle -= 36) 
{
	// get direction 
    var _dir =   (floor(image_angle) + 18) + _imageAngle;

	var _x = x + lengthdir_x(300,_dir); 
	var _y = y + lengthdir_y(300,_dir); 
	
	// draw coin 
	draw_sprite(spr_coin,0,_x,_y);
	
	_x = x + lengthdir_x(245,_dir); 
	_y = y + lengthdir_y(245,_dir); 
	
	// get reward value  
	var _value = ds_map_find_value(dsMapSpinWheelReward,string(_index));
	
	// draw reward value  
	draw_text_transformed(_x,_y,_value,1,1,_dir);
	
	_index++;
}

var _x = x;
var _y = y - 375;

// draw spin wheel arrow  
draw_sprite_ext(spr_spinning_wheel_arrow,0,_x,_y,2,2,0,c_white,1);