/// @description

// Set GMLive
GMLiveSet
// Inherit the parent event
event_inherited();

var _gameComplete = GameManager.token_reach_home();
			
if(_gameComplete == false)
{
	rechance();
}
else
{
	GameManager.next_player_chance();
}
			
