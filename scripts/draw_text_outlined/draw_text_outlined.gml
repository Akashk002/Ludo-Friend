/// @description Draw_Text_Outlined(x, y, string, colour, outline_colour,outlineWidth)
/// @param x
/// @param  y
/// @param  string
/// @param  colour
/// @param  outline_colour
/// @param  OutlineWidth
function Draw_Text_Outlined(argument0, argument1, argument2, argument3, argument4,argument5 = 3) 
{
	var xx = argument0;
	var yy = argument1;
	var str = argument2;
	draw_set_colour(argument4);
	var _outlineWidth = argument5;
	
	draw_text(xx-_outlineWidth, yy, string_hash_to_newline(str));
	draw_text(xx+_outlineWidth, yy, string_hash_to_newline(str));
	draw_text(xx, yy-_outlineWidth, string_hash_to_newline(str));
	draw_text(xx, yy+_outlineWidth, string_hash_to_newline(str));
	draw_set_colour(argument3);
	draw_text(xx, yy, string_hash_to_newline(str));
	draw_set_colour(c_white);

}

/// @description Draw_Text_Outlined(x, y, string, colour, outline_colour,outlineWidth)
/// @param x
/// @param  y
/// @param  string
/// @param  colour
/// @param  outline_colour
/// @param  OutlineWidth

function Draw_Text_Outlined_ext(xx, yy, str, color,outlineColor,outlineWidth = 3,Alpha = 1,Scale = 1) 
{

	draw_text_transformed_color(xx-outlineWidth, yy, string_hash_to_newline(str),Scale,Scale,0,outlineColor,outlineColor,outlineColor,outlineColor,Alpha);
	draw_text_transformed_color(xx+outlineWidth, yy, string_hash_to_newline(str),Scale,Scale,0,outlineColor,outlineColor,outlineColor,outlineColor,Alpha);
	draw_text_transformed_color(xx, yy-outlineWidth, string_hash_to_newline(str),Scale,Scale,0,outlineColor,outlineColor,outlineColor,outlineColor,Alpha);
	draw_text_transformed_color(xx, yy+outlineWidth, string_hash_to_newline(str),Scale,Scale,0,outlineColor,outlineColor,outlineColor,outlineColor,Alpha);

	draw_text_transformed_color(xx, yy, string_hash_to_newline(str),Scale,Scale,0,color,color,color,color,Alpha);
	draw_set_colour(c_white);

}
