/// @description
//GMLiveSet
event_inherited()

if(deActivate == true) { exit };
if(compPlayer == true) { exit };

// get string value 
playerMsg = get_string_async("Enter Your Name?",name);