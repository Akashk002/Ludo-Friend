// Script 1.0.0

// 
global.BASE_WIDTH	= 1080;
global.BASE_HEIGHT	= 1920;

//
global.VIEW_WIDTH	= global.BASE_WIDTH;
global.VIEW_HEIGHT	= global.BASE_HEIGHT;

function Get_Room_Width(){
	return global.VIEW_WIDTH;
	};

function Get_Room_Height(){
	return global.VIEW_HEIGHT;
	};
	
	
// Recalculate the position 
function Get_Room_X(X){	
	return (X/global.BASE_WIDTH) * (global.VIEW_WIDTH);
	};

function Get_Room_Y(Y){
	return 	(Y/global.BASE_HEIGHT) * (global.VIEW_HEIGHT);
	};