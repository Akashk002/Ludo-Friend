
var owner = list[|0]

var nextPos = Scroll_getPos(owner) - Scroll_getStep(owner)

Scroll_moveToPixels(owner,nextPos)

Script_Scroll_parallel(owner,list)
