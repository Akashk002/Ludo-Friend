/// @description ????


if(room != room_last)
	room_goto(room_next(room))
else
	room_goto(room_first)
