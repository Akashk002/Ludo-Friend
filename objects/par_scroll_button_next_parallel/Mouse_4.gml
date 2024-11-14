
var owner = list[|0]

var nextPos = Scroll_Get_Pos(owner) + Scroll_Get_Step(owner)

Scroll_Move_To_Pixels(owner,nextPos)

Scroll_Parallel(owner,list)
