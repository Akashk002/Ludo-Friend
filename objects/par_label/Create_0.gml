/// @description Create

// Inherit the parent event
event_inherited();

function set(Text = "",Font = -1,Color = c_white,TextScale =  image_yscale)
	{
	text		= Text;
	color		= Color;
	textScale	= TextScale;
	font		= Font;
	}

// Setter
function set_text(Text = "")						{ text		= Text; }
function set_color(Color = c_white)					{ color		= Color; }
function set_text_scale(TextScale =  image_yscale)	{ textScale = TextScale;}
function set_font(Font =  -1)						{ font		= Font;}
function set_align(VAlign = fa_left,HAlign =  -1)	{ vAlign	= VAlign; hAlign = HAlign;}

// Getter
function get_text()									{ return text;}
function get_color()								{ return color; }
function get_text_scale()							{ return textScale;}
function get_font()									{ return font;}

/// Properties
text		= "";
color		= c_white;
textScale	= image_yscale;
font		= -1;
vAlign		= fa_middle;
hAlign		= fa_center;