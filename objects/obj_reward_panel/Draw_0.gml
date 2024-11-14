/// @description
//GMLiveSet
/*
draw_sprite_ext(sprite_index, isRewardDay, x, y - 10, image_xscale, image_yscale, 0, image_blend, image_alpha);
draw_set_font(font_size_26);
draw_set_color(c_black);
draw_set_halign(fa_center);

#region Coins
var _sprCoin = spr_store_coin_3;
if (day < 3)
{
	if (day == 01)
	{
		_sprCoin = spr_store_coin_1;
	}
	else if (day == 02)
	{
		_sprCoin = spr_store_coin_2;
	}
}

//draw coins sprite

draw_sprite_ext(_sprCoin, 0, x, y - 10, 1, image_yscale, 0, image_blend, image_alpha);

#endregion
//draw days
draw_text(x,y - 110,"Day " + string(day));

//draw coins text
draw_text(x,y + 105,string(coins));

if (isRewarded)
{
	draw_sprite_ext(sprite_index, 2, x, y - 10, image_xscale, image_yscale, 0, image_blend, image_alpha);
}