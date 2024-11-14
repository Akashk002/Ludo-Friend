/// @description
//GMLiveSet

// Inherit the parent event
event_inherited();

xScale = 4;
yScale = 4.5;

transitionType	= PopUpTransition.Fade;
transitionX =  - 512;


dsListEditBox = ds_list_create();
//
popup_refresh();

isSelected2 = true;

/// Cretae Popup Child
///Create Popup panel
panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale, yScale, obj_pop_up_panel_vs_computer);

//close button
create_popup_child_button(panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

//title
var _title = create_popup_child_button(panelID, x , anchor.top + 32,1,1,obj_title);
	_title.title = "Computer";
	_title.image_xscale = 6;
	_title.image_yscale = 1.3;

//button 2 player
var _button = create_popup_child_button(panelID, x - 230, y + 150,1,1,obj_button_vs_computer_2_players);
	_button.isSelected = true;
	_button.image_index = true; 
 
//button 3 noOfPlayers
create_popup_child_button(panelID, x , y + 150,1,1,obj_button_vs_computer_3_players);

//button 4 player
create_popup_child_button(panelID, x + 230, y + 150,1,1,obj_button_vs_computer_4_players);

//button start
create_popup_child_button(panelID, x , anchor.bottom - 160,1,1,obj_button_start_vs_computer);

// clear map 
ds_map_clear(dsMapPlayerVsCompName);

for (var _playerIndex = 0; _playerIndex < 4; ++_playerIndex) 
{	
	// get name 
	var _name = (_playerIndex <= 0) ? "Player" : "Comp" ;
	
	// player name
	var _playerName =  _name + string(_playerIndex + 1);
	
	// comp player 
	var _compPlayer = (_playerIndex > 0) 
		
		//create edit box
	var _editBox = create_popup_child_button(panelID, x - 320, y - 340 + _playerIndex * 90,1,1,obj_edit_box_player_vs_comp_name);
		_editBox.image_xscale	= 8;
		_editBox.image_yscale	= 1.2;
		_editBox.playerIndex	= _playerIndex; // set player index 
		_editBox.defaultName	= _playerName;  // set default name
		_editBox.name			= _playerName;	// set name
		_editBox.compPlayer		= _compPlayer;  

	if(_compPlayer = true)
	{
		// create popup button 
		var _button = create_popup_child_button(panelID,_editBox.bbox_right + 150,_editBox.y + 40,1,1,obj_buttom_comp_edit);
			_button.boxID = _editBox;
	}
	// add edit box in list 
	ds_list_add(dsListEditBox,_editBox);
};

// help to activate edit box 
function activate_name_edit_box(NoofPlayer)
{
    with (obj_edit_box_player_vs_comp_name)
	{
		// activate edit box 
	   deActivate = true;
	   
	   // reset name to default name
	   name = defaultName;
	   
	   if(playerIndex != 0)
	   {
			compPlayer = true;
	   }
	}
	 
	 for (var i = 0; i < NoofPlayer; ++i) 
	 {
		 // get edit box and activate edit box 
		var _editBox = ds_list_find_value(dsListEditBox,i);
			_editBox.deActivate = false;
	 }
}

// set player data 
function Set_player_data()
{
	// get list size 
    var _listSize = ds_list_size(dsListEditBox);
	
	for (var _playerIndex = 0; _playerIndex < _listSize; ++_playerIndex) 
	{
		// create map 
		var _playerDataMap = ds_map_create();
		
		// get edit box id 
	    var _editBoxID = ds_list_find_value(dsListEditBox,_playerIndex);
		
		// get player name
		var _playerName = _editBoxID.name;
		
		// com player 
		var _comPlayer = _editBoxID.compPlayer;
		
		// add player name and data 
		ds_map_add(_playerDataMap,"Name",_playerName);
		ds_map_add(_playerDataMap,"Comp",_comPlayer);
		
		// add player map to main map 
		ds_map_add_map(dsMapPlayerVsCompName,_playerIndex,_playerDataMap);
	}
	
}

// activate name edit box 
activate_name_edit_box(2)

