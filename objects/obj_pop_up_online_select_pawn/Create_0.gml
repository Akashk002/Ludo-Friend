/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

xScale = 4;
yScale = 4;

//
transitionType	= PopUpTransition.None;

//
popup_refresh();

destroyType = false;
/// Cretae Popup Child
///Create Popup panel
var _panelID = create_popup_child_panel(anchor.middle, anchor.center, xScale, yScale, obj_pop_up_panel_online_select_pawn);
//close button
create_popup_child_button(_panelID, anchor.right - 32, anchor.top + 32,1,1,obj_popup_button_close);

//title
var _title = create_popup_child_button(_panelID, anchor.middle , anchor.top + 32,6,1.3,obj_title);
	_title.title = dsMapPopUpSelectPawn[? "title"];


create_popup_child_button(_panelID, anchor.left + 60, anchor.top + 56,1,1,obj_button_back_to_choose_no_of_player);

var _gapX = 330;
var _gapY = 330;
var _playerIndex = 0;
//create pawns buttons
for (var  i = 0; i < 2; i++)
{
	for (var j = 0; j < 2; j++)
	{
		var _pawn = create_popup_child_button(_panelID, anchor.middle - 150 + _gapX * j,anchor.center - 180 + _gapY * i,1,1,obj_button_select_pawn_blue);
			_pawn.pawnColor = _playerIndex++;
			_pawn.image_index = _pawn.pawnColor;
	};
};
