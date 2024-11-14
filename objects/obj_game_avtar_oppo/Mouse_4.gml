/// @description Insert description here
// You can write your code in this editorifv 

if(instance_exists(par_popup)) exit ;
if(oppoMap == -1) exit ;

var _popup = PopUp_Create(obj_pop_up_stats_oppo);

_popup.refresh_opp_data(oppoMap);

