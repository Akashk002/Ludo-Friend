/// @description
//GMLiveSet

// Inherit the parent event
event_inherited();

xScale = 4;
yScale = 4.5;

transitionType	= PopUpTransition.Fade;
transitionX =  - 512;



//
popup_refresh();

isSelected2 = true;

/// Cretae Popup Child
///Create Popup panel
panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale, yScale, obj_pop_up_panel_local);

//close button
create_popup_child_button(panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

//title
var _title = create_popup_child_button(panelID, x , anchor.top + 32,1,1,obj_title);
	_title.title = "Local";
	_title.image_xscale = 6;
	_title.image_yscale = 1.3;

//button 2 player
var _button = create_popup_child_button(panelID, x - 230, y + 150,1,1,obj_button_local_2_players);
	_button.isSelected = true;
	_button.image_index = true;
	
	


//button 3 noOfPlayers
create_popup_child_button(panelID, x , y + 150,1,1,obj_button_local_3_players);

//button 4 player
create_popup_child_button(panelID, x + 230, y + 150,1,1,obj_button_local_4_players);

//button start
create_popup_child_button(panelID, x , anchor.bottom - 160,1,1,obj_button_start_local);

dsListEditBox = ds_list_create();

ds_list_clear(dsListLocalPlayerName);

for (var _playerIndex = 0; _playerIndex < 4; ++_playerIndex) 
{	
	var _playerName = "Player" + string(_playerIndex+1);
		
		//create edit box
	var _editBox = create_popup_child_button(panelID, x -250, y - 340 + _playerIndex * 90,1,1,obj_edit_box_local_player_name);
		_editBox.image_xscale = 8;
		_editBox.image_yscale = 1.2;
		_editBox.playerIndex = _playerIndex;
		_editBox.defaultName = _playerName;
		_editBox.name = _playerName;
			
	ds_list_add(dsListLocalPlayerName,_playerName);
	ds_list_add(dsListEditBox,_editBox);
};


function activate_name_edit_box(NoofPlayer)
{
    with (obj_edit_box_local_player_name)
	{
	   deActivate = true;
	   name = defaultName;
	   
	}
	 
	 for (var i = 0; i < NoofPlayer; ++i) 
	 {
	     var _editBox = ds_list_find_value(dsListEditBox,i);
			_editBox.deActivate = false;
	 }
}

activate_name_edit_box(2)