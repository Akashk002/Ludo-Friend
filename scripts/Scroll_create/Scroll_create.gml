/// @function Script_Scroll_create(X,Y,depth,width,height,list,VorH,HolderStep,sep)
/// @description 
/// @param {real} x
/// @param {real} y
/// @param {real} depth
/// @param {real} width
/// @param {real} heigth

/// @param {string} list<Ids>
/// @param {string} "V"or"H" 
/// @param {real} HolderStep
/// @param {real} sep

function Scroll_create(X,Y,Depth,width,height,list,VorH,HolderStep,sep){


	var V_H = VorH;
	var Holder_step = HolderStep;

	var ins = instance_create_depth(X,Y,Depth-1,Obj_Scroll);

	ins.width = width;
	ins.heigth = height;

	ins.list = list;
	ins.V_H = V_H;
	ins.Holder_step = Holder_step;
	ins.sep = sep;

	//
	Scroll_refresh(ins);

	//	
	return(ins);
}
