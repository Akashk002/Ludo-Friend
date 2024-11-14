// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

#macro OnStateStart				if ((event_type == ev_other) && (event_number == ev_user0))
#macro OnStateRunning			if ((event_type == ev_step) && (event_number == ev_step_normal))
#macro OnStateDraw				if ((event_type == ev_draw) && (event_number != ev_gui))
#macro OnStateDrawGUI			if ((event_type == ev_draw) && (event_number == ev_gui))
#macro OnStateAnimationEnd		if ((event_type == ev_other) && (event_number == ev_animation_end))

enum DataType {Sprite, Script};

function State_Add_Data(State,Sprite,Script){
	//Add map Idle
	var _map = ds_map_create();
		ds_map_add(_map,DataType.Sprite,Sprite);
		ds_map_add(_map,DataType.Script,Script);

		//
		ds_map_add_map(dsMapState,State,_map);
	}

function State_Change(State){
	//Add map Idle
		state = State;
		firstTimeInStep = true;
}