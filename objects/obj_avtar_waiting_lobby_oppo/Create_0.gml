/// @description
GMLiveSet

// Inherit the parent event
event_inherited();

image_xscale = 2;
image_yscale = 2;

randamAvtar = 0;
avtarIndex = noone;
callBackPlayerAvtar = new CallBack();


function load_Avtar(PlayerID)
{
   if(avtarIndex == noone)
   {
		callBackPlayerAvtar.Path_Update("User/" + string(PlayerID) + "/AvtarSprite");
		callBackPlayerAvtar.Read();
   }
}