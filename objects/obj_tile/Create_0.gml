/// @description

// Set GMLive
GMLiveSet

dsListTokenID = ds_list_create();

enum TileType {Normal,Home,Star,Finish}

gameObject = noone;

switch (room) {
    case rm_game:
        gameObject = GameManager;
        break;
    case rm_game_offline:
        gameObject = GameManagerOffine;
        break;
    case rm_game_computer:
        gameObject = GameManagerVsComp;
        break;
    default:
        // code here
        break;
}

alarm[0] = 1;


function add_token(TokenID)
{
   ds_list_add(dsListTokenID,TokenID); 
   var _noOfToken = ds_list_size(dsListTokenID)
   
   if(_noOfToken > 1)
   {
		adjust_token(_noOfToken);
   }
   
}

function get_token(Pos = 0)
{
   var _tokenData = (ds_list_empty(dsListTokenID) == false)? ds_list_find_value(dsListTokenID,Pos) : noone;
   
   return _tokenData;
}

function remove_token(TokenID)
{
	var _pos = ds_list_find_index(dsListTokenID,TokenID);
	
	ds_list_delete(dsListTokenID,_pos);
}

function adjust_token(NoOfToken)
{
	for (var _tokenIndex = 0; _tokenIndex < NoOfToken; ++_tokenIndex) 
	{
	     var _tokenID = ds_list_find_value(dsListTokenID,_tokenIndex);
		 
		 var _len = sprite_height/8;
		 var _dir = (360/NoOfToken) * _tokenIndex;
		 _tokenID.x = x + lengthdir_x(_len,_dir);
		 _tokenID.y = y + lengthdir_y(_len,_dir);	
		 _tokenID.depth = -_tokenID.y;	
	}
}




