/// @description Event Create

GMLiveSet

// Inherit the parent event
event_inherited();

xScale = 4;
yScale = 6;

//
transitionDir	= PopUpSlideDirection.Down;
//
popup_refresh();

/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale, yScale, obj_pop_up_panel_store);

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

//title
var _title = create_popup_child_button(_panelID, anchor.middle,anchor.top + 32,1,1,obj_title);
	_title.title = "Store"
	_title.image_xscale = 6.1;
	_title.image_yscale = 1.4;

//heading coins
var _headingName = create_popup_child_button(_panelID, anchor.middle, anchor.top + 128,1,1,obj_pop_up_heading);
	_headingName.title = "Coins"

//heading cashs
var _headingName = create_popup_child_button(_panelID, anchor.middle, anchor.top + 560,1,1,obj_pop_up_heading);
	_headingName.title = "Cash"

//heading Diamonds
var _headingName = create_popup_child_button(_panelID, anchor.middle, anchor.bottom - 450,1,1,obj_pop_up_heading);
	_headingName.title = "Diamonds"

#region Create coins

var _storeType = StoreType.Coin;
var _storeButton = obj_button_coin;

var _scroll;

var _color = c_white;
var _list = ds_list_create();
var _scroll = create_popup_child_scroll(_panelID, anchor.middle - 355, anchor.top + 200,700,680,_list,ScrollAxis.Horizontal,128,128);

var _noOfPannel = Store_Get_Pannel_Count(_storeType);

// Add Items in the List
for(var _pannelNo = 0 ; _pannelNo < _noOfPannel ; _pannelNo++)
	{		
		var _earnValue		= Store_Get_Data(_storeType,_pannelNo,StoreDataType.Earn);
		var _price			= Store_Get_Data(_storeType,_pannelNo,StoreDataType.Price);
		var _pannelIndex	= Store_Get_Data(_storeType,_pannelNo,StoreDataType.PannelIndex);
		
		
		var ins = create_popup_child_button(_panelID,x,y,1,1,_storeButton);
			ins.image_blend = _color;
			ins.earn		= _earnValue;
			ins.price		= _price;
			ins.pannelIndex = _pannelIndex;
			
			//
			popup_child_scroll_add_child(_scroll,ins);
	};

#endregion

#region Create cash

var _storeType = StoreType.Cash;
var _storeButton = obj_button_cash;

var _scroll;

var _color = c_white;
var _list = ds_list_create();
var _scroll = create_popup_child_scroll(_panelID, anchor.middle - 355, anchor.center - 90,700,680,_list,ScrollAxis.Horizontal,128,128);

var _noOfPannel = Store_Get_Pannel_Count(_storeType);

// Add Items in the List
for(var _pannelNo = 0 ; _pannelNo < _noOfPannel ; _pannelNo++)
	{		
		var _earnValue		= Store_Get_Data(_storeType,_pannelNo,StoreDataType.Earn);
		var _price			= Store_Get_Data(_storeType,_pannelNo,StoreDataType.Price);
		var _pannelIndex	= Store_Get_Data(_storeType,_pannelNo,StoreDataType.PannelIndex);
		
		
		var ins = create_popup_child_button(_panelID,x,y,1,1,_storeButton);
			ins.image_blend = _color;
			ins.earn		= _earnValue;
			ins.price		= _price;
			ins.pannelIndex = _pannelIndex;
			
			//
			popup_child_scroll_add_child(_scroll,ins);
	};

#endregion

#region Create diamond

var _storeType = StoreType.Diamond;
var _storeButton = obj_button_diamond;

var _scroll;

var _color = c_white;
var _list = ds_list_create();
var _scroll = create_popup_child_scroll(_panelID, anchor.middle - 355, anchor.center + 335,700,680,_list,ScrollAxis.Horizontal,128,128);

var _noOfPannel = Store_Get_Pannel_Count(_storeType);

// Add Items in the List
for(var _pannelNo = 0 ; _pannelNo < _noOfPannel ; _pannelNo++)
	{		
		var _earnValue		= Store_Get_Data(_storeType,_pannelNo,StoreDataType.Earn);
		var _price			= Store_Get_Data(_storeType,_pannelNo,StoreDataType.Price);
		var _pannelIndex	= Store_Get_Data(_storeType,_pannelNo,StoreDataType.PannelIndex);
		
		
		var ins = create_popup_child_button(_panelID,x,y,1,1,_storeButton);
			ins.image_blend = _color;
			ins.earn		= _earnValue;
			ins.price		= _price;
			ins.pannelIndex = _pannelIndex;
			
			//
			popup_child_scroll_add_child(_scroll,ins);
	};

#endregion

