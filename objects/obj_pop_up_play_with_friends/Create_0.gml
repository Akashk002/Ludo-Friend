/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

xScale = 4;
yScale = 4.5;

transitionType	= PopUpTransition.Fade;
//
popup_refresh();

/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale, yScale, obj_pop_up_panel_play_with_friends);

//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

//title
var _title = create_popup_child_button(_panelID, x , y - 500,1,1,obj_title);
	_title.title = dsMapPopUpPlayWithFriends[? "title"];
	_title.image_xscale = 7;
	_title.image_yscale = 1.3;


var _gapX = 330;
var _gapY = 330;
var _playerIndex = 0;
//create pawns buttons
for (var  i = 0; i < 2; i++)
{
	for (var j = 0; j < 2; j++)
	{
		var _pawn = create_popup_child_button(_panelID, anchor.middle - 150 + _gapX * i,anchor.center - 180 + _gapY * j,1,1,obj_button_select_pawn_blue);
			_pawn.playerIndex = _playerIndex++;
			_pawn.image_index = _pawn.playerIndex;
	};
};
