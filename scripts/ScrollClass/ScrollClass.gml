//Default is 7.5   recomended 5 - 10
#macro Scroll_K_transfer 7.5

enum ScrollAxis { Vertical , Horizontal }

/// @function Scroll_Add_Back(Scroll,INS)
/// @description 
function Scroll_Add_Back(Scroll, childBackButton) {
	//
	Scroll.Back = childBackButton
	childBackButton.owner = Scroll
}

/// @function Scroll_Add_Back_Parallel(Scroll,INS)
function Scroll_Add_Back_Parallel(Scroll,INS) {

	/// @param {real} Scroll
	/// @param {real} INS

	for(var a = 0 ; a < ds_list_size(List) ; a++)
		{
			var _Scroll = List[|a]
			_Scroll.Back = INS
		};
	//
	INS.List = List
}

/// @function Scroll_Add_Next(Scroll,INS)
/// @description 
function Scroll_Add_Next(Scroll,INS) {

	/// @param {real} Scroll
	/// @param {real} INS

	Scroll.Next = INS
	INS.owner = Scroll
}

/// @function Scroll_Create(X,Y,depth,width,height,List,VorH,HolderStep,sep)
/// @description 
function Scroll_Create(X,Y,Depth,Width,Height,List,VorH,HolderStep,Sep) {

	var INS = instance_create_depth(X,Y,Depth-1,obj_scroll)

		INS.width = Width
		INS.heigth = Height

		INS.List = List
		INS.V_H = VorH
		INS.Holder_step = HolderStep
		INS.sep = Sep

	
	//
	Scroll_Refresh(INS)

	//
	return(INS);

}

/// @function Scroll_Drag_Disable(Scroll)
/// @description 
function Scroll_Drag_Disable(Scroll) {

	/// @param {real} Scroll

	Scroll.drag_enable = false

}

/// @function Scroll_Drag_Enable(Scroll)
/// @description 
function Scroll_Drag_Enable(Scroll) {

	/// @param {real} Scroll
	Scroll.drag_enable = true

}

/// @function Scroll_Get_length(Scroll)
/// @description 
function Scroll_Get_length(Scroll) {

	/// @param {real} Scroll

	return(Scroll.length)

}

/// @function Scroll_Get_length_Move(Scroll)
/// @description 
function Scroll_Get_length_Move(Scroll) {

	/// @param {real} Scroll

	return(Scroll.move_length)

}

/// @function Scroll_Get_List(Scroll)
/// @description 
function Scroll_Get_List(Scroll) {

	/// @param {real} Scroll

	return(Scroll.List)
}

/// @function Scroll_Get_Orientation(Scroll)
/// @description 
function Scroll_Get_Orientation(Scroll) {

	/// @param {real} Scroll

	return(Scroll.V_H)
}

/// @function Scroll_Get_Percent(Scroll)
/// @description 
function Scroll_Get_Percent(Scroll) {

	/// @param {real} Scroll

	return(Scroll.percent)
}

/// @function Scroll_Get_Percent_Transfer(Scroll)
/// @description 
function Scroll_Get_Percent_Transfer(Scroll) {

	/// @param {real} Scroll

	return(Scroll.percent_transfer)
}

/// @function Scroll_Get_Pos(Scroll)
/// @description 
function Scroll_Get_Pos(Scroll) {

	/// @param {real} Scroll

	return(Scroll.pixels);
}

/// @function Scroll_Get_Pos_Transfer(Scroll)
/// @description 
function Scroll_Get_Pos_Transfer(Scroll) {

	/// @param {real} Scroll
	return(Scroll.pixels_transfer)
}

/// @function Scroll_Get_Step(Scroll)
/// @description 
function Scroll_Get_Step(Scroll) {

	/// @param {real} Scroll

	return(Scroll.Step)
}

/// @function Scroll_Is_Valid_Click()
/// @description 
function Scroll_Is_Valid_Click() {

	//if(mouse_x > master.x and mouse_x<master.x+master.width)
	//if(mouse_y > master.y and mouse_y<master.y+master.heigth)
	if (point_in_rectangle(mouse_x,mouse_y,master.x,master.y,master.x+master.width,master.y+master.heigth) == true)
	{

		var ok = false
		var owner_ = owner
		while(true)
		{
			if(!owner_)
			{
				ok = true//Ok anthing is dragging
				break
			}

			if(owner_.object_index == obj_scroll)
			if(owner_.drag_enable)
			{
				if(owner_.dragging_abs < 15)
				if(owner_.press_steps < room_speed/2)
				{
					ok = true
				}
				break
			
			}
		
			owner_ = owner_.owner
	
		}
	
		if(ok)
		{
			return(true)
		}
	}

	return(false)
}

/// @function Scroll_Move_To_Pixels(Scroll,position)
function Scroll_Move_To_Pixels(Scroll,position) {

	/// @description 

	/// @param {real} Scroll
	/// @param {real} position

	var goto = position

	if(goto > Scroll.move_length)
		goto = Scroll.move_length

	if(goto < 0)
		goto = 0

	Scroll.pixels = goto
	Scroll.percent = (Scroll.pixels/Scroll.move_length)*100;

}


/// @function Scroll_Move_To_Pixels_Brute(Scroll,position)
/// @description 
function Scroll_Move_To_Pixels_Brute(Scroll,position) {

	/// @param {real} Scroll
	/// @param {real} position

	var goto = position;
	
	//
	Scroll_Move_To_Pixels(Scroll,goto)

	//
	Scroll.pixels_transfer = Scroll.pixels
	Scroll.percent_transfer = Scroll.percent
}

/// @function Scroll_Move_To_Percent(Scroll,percent)
/// @description 
function Scroll_Move_To_Percent(Scroll,percent) {

	/// @param {real} Scroll
	/// @param {real} percent
	var goto = percent

	if(goto > 100)
		goto = 100

	if(goto < 0)
		goto = 0

	Scroll.pixels = Scroll.move_length*Scroll.percent/100
	Scroll.percent = goto



}

/// @function Scroll_Move_To_Percent_Brute(Scroll,percent)
/// @description 
function Scroll_Move_To_Percent_Brute(Scroll, percent) {

	/// @param {real} Scroll
	/// @param {real} percent
	
	//
	Scroll_Move_To_Percent(Scroll,percent);
	
	//
	Scroll.pixels_transfer = Scroll.pixels
	Scroll.percent_transfer = Scroll.percent

	//
	with(Scroll)
	{	
		event_perform(ev_other,ev_user2)
		event_perform(ev_other,ev_user3)
	};
};

/// @function Scroll_Refresh(Scroll)
/// @description 
function Scroll_Refresh(Scroll) {

	/// @param {real} Scroll

	with(Scroll)
		event_perform(ev_other,ev_user0)
}


/////////INTERNAL FUNCTINOS /////////
#region INTERNAL
function Scroll_Parallel(ins_selected, List) {

	var ins_max = noone

	var move_lengthMAX = -1
	var a = 0
	while(true)
	{	
		var INS = List[|a]
	
		if(is_undefined(INS))
			break
	
		var move_length = INS.move_length_mine
		if(move_length > move_lengthMAX)
		{
			move_lengthMAX = move_length
			ins_max = INS
		}
	
		a++
	}


	if(ins_selected != noone)
	{
	
		ins_selected.move_length = move_lengthMAX
	
		var a = 0
		while(true)
		{
		
			var INS = List[|a]
	
			if(is_undefined(INS))
				break
		
			INS.percent				= ins_selected.percent
			INS.percent_transfer	= ins_selected.percent_transfer
			INS.pixels				= ins_selected.pixels
			INS.pixels_transfer		= ins_selected.pixels_transfer

			a++	
		}
	}


}

function Scroll_Draw_Childs(List) {

	if(!ds_exists(List,ds_type_list))
		exit

	var a = 0
	while(true)
	{

		var INS = List[|a]
	
		if(is_undefined(INS))
			break
		
		with(INS)
		{
			draw = true
			event_perform(ev_draw,0)
			draw = false
		}
	
		a++	
	}
}

function Scroll_Call_Childen_Move(List) {

	if(!ds_exists(List,ds_type_list))
		exit

	var a = 0
	while(true)
		{
			var INS = List[|a]
			//
			if(is_undefined(INS))
				break
			//
			with(INS){
				event_perform(ev_other,ev_user1)
				}
			//	
			a++	
		};
};
#endregion

function Scroll_Child_Add_Item(InstanceID)
	{
	//
	if (list == noone) { list = ds_list_create(); };
	//
	ds_list_add(list,InstanceID)
	}
