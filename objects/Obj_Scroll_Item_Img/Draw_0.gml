/// @description ????


// Inherit the parent event
event_inherited();

if(!draw)
	exit

var text = ""

draw_set_valign(fa_left)
draw_set_halign(fa_left)

draw_set_color(c_black)
draw_set_font(Font_Normal)

if(owner.owner.V_H == ScrollAxis.Vertical)
	draw_text(Xdraw+140 ,Ydraw+20, text)
else
	draw_text(Xdraw+20,Ydraw-90, text)
	