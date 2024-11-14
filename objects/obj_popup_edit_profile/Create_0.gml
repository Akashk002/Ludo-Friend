/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

xScale = 4;
yScale = 6.4;

//
transitionType	= PopUpTransition.None;

//refresh pop up
popup_refresh();

/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale, yScale, obj_pop_up_panel_stats_change_avtar);

//title
var _title = create_popup_child_button(_panelID, anchor.middle, anchor.top + 32,6.1,1.3,obj_title);
	_title.title = "Change Avtar"

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_pop_up_button_change_avtar_close);

//avtar 
create_popup_child_button(_panelID, anchor.left + 200, anchor.top + 230,2,2,obj_stats_avtar);

//change avtar
//create_popup_child_button(_panelID, anchor.right - 220, anchor.bottom - 90, 5, 0.8, obj_stat_pop_up_change_avtar);

var _imageXScale = 9.5;
var _imageYScale = 1.5;

//name box
create_popup_child_button(_panelID, anchor.middle + 150, anchor.top + 200,_imageXScale,_imageYScale,obj_edit_stats_name);

#region Avtar Scroll

var _scroll;

var color = c_white;
var _list = ds_list_create();

//
//var _scroll = create_popup_child_scroll(_panelID, anchor.middle - 355, anchor.top + 200,700,680,_list,ScrollAxis.Vertical,128,128);

sprite_set_live(spr_change_avtar,true);
	
	var _imageIndex = 0;
	var _iniX = _panelID.x - 255;
	var _iniY =  _panelID.y - 280;
	var _gapX = 170;
	var _gapY = 170;
	
	// create selection avtar object 
	for (var i = 0; i < 5; ++i) 
	{
		var _y = _iniY + _gapY * i;
	    for (var j = 0; j < 4; ++j) 
		{
			var _x = _iniX + _gapX * j;
		    var _instance = create_popup_child_button(_panelID, _x,_y ,1,1,obj_avtar_icon_selection);
			_instance.image_index = _imageIndex;
			
			_imageIndex++;
		}
	}
	
	
	
	
	/*
	var _listScroll = ds_list_create();
	var _gap = 256;
	var _num = 0
	
	repeat (3) 
	{
		
		var _listItem = ds_list_create();
	
		for (var i = 0; i < 4; ++i) 
		{
			//
			var _obj = create_popup_child_button(_panelID,x,y,1,1,obj_change_avtar);
				_obj.image_blend = c_white;
				ds_list_add(_listItem,_obj)
		}

		//
		popup_child_scroll_add_child(_scroll,_obj);
		
		if (_num != 0) 
		{
			//
			Scroll_dragDisable(_scroll);
		}
		
		_num++;
	}
*/
#endregion

//Apply 
create_popup_child_button(_panelID, anchor.middle, anchor.bottom - 150, 1, 1, obj_change_avtar_pop_up_button_apply);