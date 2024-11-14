/// @description

// Set GMLive
GMLiveSet


// Inherit the parent event
event_inherited();

draw_text(room_width/2,room_height * 0.05,"State - " + string(state));
draw_text(room_width/2,room_height * 0.1,"curChancePlayerID - " + string(curChancePlayerID));
//draw_text(room_width/2,room_height * 0.1,"current player  - " + string(curChancePlayerID));
