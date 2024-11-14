/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

#region Pop Up Add Friends

	if (instance_exists(obj_pop_up_add_friend))
	{
		draw_set_halign(fa_center);
		draw_set_color(c_black);
		draw_set_font(font_size_32);
		//friend code
		draw_text(x - 250,y - 100,"Friend:");
		//search friend 
		draw_text(x - 250, y + 80, "Search Friend:");
	};

#endregion

#region Pop Up Daily Rewards

	if (instance_exists(obj_pop_up_daily_rewards))
	{
		//align horizontal text
		draw_set_halign(fa_center);
		//set font color
		draw_set_color(c_black);
		//draw text
		draw_text(x,y + 460, "Come back every day for new reward");
	};

#endregion

#region Pop Up Online

	if (instance_exists(obj_pop_up_online))
	{
		draw_set_halign(fa_center);
		//
		Draw_Text_Outlined(x,y - 400, "Classic", c_blue, c_blue);
	};

#endregion

#region Pop Up Online Choose Entry

	if (instance_exists(obj_pop_up_online_choose_entry))
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		//set font
		draw_set_font(font_size_44);
		//set color blue for text
		draw_set_color(c_black);

		//Draw text "1 Prize"
		draw_text(x,y - 320,"1st Prize :");

		//Draw text "Entry"
		draw_text(x,y + 120,"Entry :");
	};

#endregion

#region Pop Up Store

	if (instance_exists(obj_pop_up_store))
	{
		var _gapY = 435;

		if (image_xscale == 1)
		{

			//draw dark panel
			for (var i = 0; i < 3; ++i) {
			    //
				draw_sprite_ext(spr_panel_dark, image_index, obj_pop_up_store.anchor.middle , obj_pop_up_store.anchor.center - 380 + _gapY * i, image_xscale * 8.3, image_yscale * 3.7, 0, c_white, image_alpha);
			}

		}
	};

#endregion
