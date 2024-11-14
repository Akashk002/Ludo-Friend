/// @description
//GMLiveSet
event_inherited()

draw_self();

image_index = deActivate;

var _col = (compPlayer == true) ? c_gray : c_black;

draw_set_color(_col);
draw_set_font(font_size_34);
//
draw_set_halign(fa_left);
//
draw_set_valign(fa_middle);
//
draw_text(bbox_left + 32,y + sprite_height / 2, name);

var _imageIndex = playerIndex;

// 
if(noOfPlayers == 2)
{
  if(playerIndex == 1)
  {
    _imageIndex = 2;
  }
  else
  if(playerIndex == 2)
  {
     _imageIndex = 1;
  }
}

//draw sprite 
draw_sprite(spr_pawn, _imageIndex,bbox_right + 20,y );