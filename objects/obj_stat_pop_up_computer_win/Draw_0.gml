/// @description Event Draw

// Inherit the parent event
event_inherited();

//set text alingment
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//draw win text
draw_text(x,y,playerComputerWins);
