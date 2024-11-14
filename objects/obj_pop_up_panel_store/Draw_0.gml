/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

var _gapY = 435;

if (image_xscale == 1)
{

	//draw dark panel
	for (var i = 0; i < 3; ++i) {
		//
		draw_sprite_ext(spr_panel_dark, image_index, obj_pop_up_store.anchor.middle , obj_pop_up_store.anchor.center - 380 + _gapY * i, image_xscale * 8.3, image_yscale * 3.7, 0, c_white, image_alpha);
	}

}
