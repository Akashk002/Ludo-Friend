/// @description 1.0.0

//
var _base_w = global.BASE_WIDTH;
var _base_h = global.BASE_HEIGHT;
var _base_aspect = (_base_w/_base_h);

//
global.VIEW_WIDTH	= _base_w;
global.VIEW_HEIGHT	= _base_h;

//
var _max_w = display_get_width();
var _max_h = display_get_height();
var _aspect = display_get_width() / display_get_height();

//
if (_base_aspect == _aspect) exit;
//
if (os_type == os_macosx) || (os_type == os_windows) exit;

if (_max_w < _max_h)
    {
    // portait
    var _VIEW_WIDTH = min(_base_w, _max_w);
    var _VIEW_HEIGHT = _VIEW_WIDTH / _aspect;
    }
else
    {
    // landscape
    var _VIEW_HEIGHT = min(_base_h, _max_h);
    var _VIEW_WIDTH = _VIEW_HEIGHT * _aspect;
    };

//
global.VIEW_WIDTH	= _VIEW_WIDTH;
global.VIEW_HEIGHT	= _VIEW_HEIGHT;

//
camera_set_view_size(view_camera[0], floor(_VIEW_WIDTH), floor(_VIEW_HEIGHT))
view_wport[0] = _max_w;
view_hport[0] = _max_h;
surface_resize(application_surface, view_wport[0], view_hport[0]);
display_set_gui_size(view_wport[0], view_hport[0]);


var _dsListException = ds_list_create();


ds_list_add(_dsListException,obj_tile,obj_board);

// Recalculate the position 
with(all)
{
	if(ds_list_find_index(_dsListException,id.object_index) == -1) 
	{ 
		x = (xstart/_base_w) * (global.VIEW_WIDTH);
		y = (ystart/_base_h) * (global.VIEW_HEIGHT);
	}
}

var _yy = Get_Room_Y(960) - 960;

for (var _index = 0; _index < ds_list_size(_dsListException); ++_index) 
{
    var _objID = ds_list_find_value(_dsListException,_index);
	
	with(_objID)
	{
	   y += _yy ; 
	}
}
