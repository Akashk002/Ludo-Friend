
enum StoreType { Coin,Cash,Diamond};
enum StoreDataType { PannelIndex,Earn,Price};

function Store_Add_Data(Storetype,PannelNo,Pannelindex,Earn,Price)
{
	var _dsMapPannel = ds_map_create();
	
	ds_map_add(_dsMapPannel,string(StoreDataType.PannelIndex),Pannelindex);
	ds_map_add(_dsMapPannel,string(StoreDataType.Earn),Earn);
	ds_map_add(_dsMapPannel,string(StoreDataType.Price),Price);
	
	var _dsMapStore = noone;
	
	switch (Storetype) 
	{
	    case StoreType.Coin:
	        _dsMapStore = dsMapStoreCoin;
	        break;
	    case StoreType.Cash:
	        _dsMapStore = dsMapStoreCash;
	        break;
	    case StoreType.Diamond:
	        _dsMapStore = dsMapStoreDiamond;
	        break;
	}
	
	ds_map_add_map(_dsMapStore,string(PannelNo),_dsMapPannel)
}

function Store_Get_Data(Storetype,PannelNo,StoreDatatype)
{
	var _dsMapStore = noone;
	
	switch (Storetype) 
	{
	    case StoreType.Coin:
	        _dsMapStore = dsMapStoreCoin;
	        break;
	    case StoreType.Cash:
	        _dsMapStore = dsMapStoreCash;
	        break;
	    case StoreType.Diamond:
	        _dsMapStore = dsMapStoreDiamond;
	        break;
	}
	
	var _dsMapPannel = ds_map_find_value(_dsMapStore,string(PannelNo));
	
	var _data = ds_map_find_value(_dsMapPannel,string(StoreDatatype));
	
	return _data;
}

function Store_Get_Pannel_Count(Storetype)
{
	var _dsMapStore = noone;
	
	switch (Storetype) 
	{
	    case StoreType.Coin:
	        _dsMapStore = dsMapStoreCoin;
	        break;
	    case StoreType.Cash:
	        _dsMapStore = dsMapStoreCash;
	        break;
	    case StoreType.Diamond:
	        _dsMapStore = dsMapStoreDiamond;
	        break;
	}
	
	var _noOfPannel = ds_map_size(_dsMapStore);

	return _noOfPannel;
}


