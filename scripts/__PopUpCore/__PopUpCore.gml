
// Constants
#macro PopUpDepth -10000

#macro PopUpClickEvent		if !is_active() exit
#macro PopUpDisableEvent	if (instance_exists(par_popup)) exit

// Enums
enum PopUpSlideDirection	{ None,	Up, Down, Left, Right };

global.__popUpLayerNo		= 0;
global.__popUpDepthIndex	= 0;
global.__popUpIDList		= ds_stack_create();


// Pop Up Create 
function PopUp_Create(PopUpID,TIn = PopUpSlideDirection.None,TOut = PopUpSlideDirection.None)
{	
	var X = 0,Y = 0;
	var _json_rooms = __PopUpData();
	var _map = _json_rooms[? PopUpID];
	#region

	// Exclude the background layer

	//// List all the instances
	var _instList = ds_list_create();
	room_pack_store_instances(_instList);
	var _layerList = ds_list_create();
	room_pack_store_layers(_layerList);

	// Create A popup at the middle of the screen
	var _x = X;
	var _y = Y;
		room_pack_exclude_layer("Background");
	// Load the Data in the room
	room_pack_load_map(_map,_x,_y);
	
	#region Properties
	
		var _tinx,_tiny,_toutx,_touty,_tx,_ty,_tw,_th;
		_tx = camera_get_view_x(view_camera[0]);
		_ty = camera_get_view_y(view_camera[0]);
		_tw = camera_get_view_width(view_camera[0]);
		_th = camera_get_view_height(view_camera[0]);
		
		#region Calculate the Slide position depending on the slide direction type an
	
		switch (TIn) {
		
		    case PopUpSlideDirection.Up:
		
		        // 
				_tinx =  0;
				_tiny =  -_th;

		        break;
		
		    case PopUpSlideDirection.Down:
		
		        // 
			
				_tinx =  0;
				_tiny =  _th;

		        break;
		
		    case PopUpSlideDirection.Left:
		
		        // 
				_tinx =  -_tw;
				_tiny =  0;

		        break;
		
		    case PopUpSlideDirection.Right:
		
		        // 
				_tinx =  _tw;
				_tiny =  0

		        break;
			
		    default:
		        // code here
				_tinx = 0;
				_tiny = 0;
		        break;
		}
		
		switch (TOut) {
		
		    case PopUpSlideDirection.Up:
		
		        // 
				_toutx =  0;
				_touty =  -_th;

		        break;
		
		    case PopUpSlideDirection.Down:
		
		        // 
			
				_toutx =  0;
				_touty =  _th;

		        break;
		
		    case PopUpSlideDirection.Left:
		
		        // 
				_toutx =  -_tw;
				_touty =  0;

		        break;
		
		    case PopUpSlideDirection.Right:
		
		        // 
				_toutx =  _tw;
				_touty =  0

		        break;
			
		    default:
		        // code here
				_toutx = 0;
				_touty = 0;
		        break;
		}
	#endregion
		
	#endregion
	
	var _popUpData = 
		{
			
			__popUpLayerList	: _layerList,		// Give the layer list
				
			targetInX			: _tinx,			// Target In X
			targetInY			: _tiny,			// Target In Y
		
			targetOutX			: _toutx,			// Target Out X
			targetOutY			: _touty,			// Target Out Y
		
			targetX				: _tx,			// Target X
			targetY				: _ty,			// Target Y
			
			x : _tinx,
			y : _tiny,
		}
		
	// Create the popup object
	var _depth = layer_get_depth(room_pack_raw_top_layer) + 100;
	var _popUp = instance_create_depth(0,0,_depth, par_popup, _popUpData);
				
	#region Load and add depth to the instances
	// Choose a randome color
	for (var _instIndex = 0; _instIndex < ds_list_size(_instList); ++_instIndex) {		
		// 
		var _instID = _instList[| _instIndex];	
		if (variable_instance_exists(_instID,"__buttonID") == false) {
		    // Forgot to made as a child
			show_error("ADD " + object_get_name(_instID.object_index) + "as the child of __par_popup_elemnt",false);
		};
		var _instButtonID = _instID.__buttonID;	
		//variable_instance_set(_instID,"__popUpDepthIndex",global.__popUpDepthIndex);
		variable_instance_set(_instButtonID,"__popUpID",_popUp);
		variable_instance_set(_instButtonID,"visible",false);
		
		};		
	#endregion
		
	#region Disable the buttons under and on other popups	
	with (___par_popup_element) {
			show_debug_message(object_get_name(object_index))
			// Normal Button with no popup parent
			if (get_popup_id() == noone) {
					set_active(false);
				}
				else
				if (get_popup_id() != _popUp)
				{
				set_active(false);
				}
				else
				if (get_popup_id() == _popUp)
				{
				set_active(true);
				};
		};

	#endregion		
		
	#endregion
	// Add Popup id to the list
	ds_stack_push(global.__popUpIDList,_popUp);

	// Return the id of the popup
	return _popUp;
};

function popup_approach(Start,Finish,Rate){
	/****************************************
	 Increments a value by a given shift but 
	 never beyond the end value
	 ****************************************/
	if (Start < Finish)
		    return min(Start + Rate, Finish); 
		else
		    return max(Start - Rate, Finish);
};
