/// @description
//GMLiveSet
//

if !is_active() exit;

if(instance_exists(PlayerGetData) == false)
{
	instance_create_depth(0,0,0,PlayerGetData);
}

// Destroy the PopUp
get_popup_id().close();


