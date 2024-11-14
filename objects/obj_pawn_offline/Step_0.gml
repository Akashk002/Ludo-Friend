/// @description

// Set GMLive
GMLiveSet

// Add Code Here
if(targetTileObj != noone)
{
	// get target tile x and y 
	var _tileX = targetTileObj.x;
	var _tileY = targetTileObj.y;
	
	// get distance bet current tile and target tile 
	var _dis = point_distance(x,y,_tileX,_tileY);

  if(_dis > 4)
  {
	 // move toward target tile  
     x = lerp(x,_tileX,tokenMoveSpd/100);
     y = lerp(y,_tileY,tokenMoveSpd/100);
	 depth = -y;
  }
  else
  {
	// reset target tile 
	targetTileObj = noone;
	// set alarm 
	alarm[0] = 1;
  }
}




