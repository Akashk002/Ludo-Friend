/// @description

bgAlpha = 1;
destroy = false;
destroyCallBack = noone;
destroyCallBackObject = noone;
// Close the popup
function close(Obj = noone,Fun = noone)
{
	//
	targetX = targetOutX;
	targetY = targetOutY;
	//
	destroy = true;
	destroyCallBack = Fun;
	destroyCallBackObject = Obj;
}
