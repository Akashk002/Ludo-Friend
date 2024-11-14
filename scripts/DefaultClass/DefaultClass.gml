
#macro lastHomeTileNo 56

enum NoOfPlayer { None,One,Two, Three, Four};
enum GameType { Online, Private};
enum DailyReward {Day1, Day2, Day3, Day4, Day5, Day6, Day7};

///global variables
globalvar Music, Sound, Notification, Vibration, Chat, entryAmount, winningAmount,
		 expLevel, isPlayer, noOfPlayers,pawnColour, gameType,dsMapDailyReward,
		 requestCount,inviteCount,friendCount,userCount,lobbyWaitTime,inviteLobbyID,hostID,
		 clientID,isHost,oppoUniqueID,gameRoomName,gameRoomPath,isHost,lobbyPath,
		 friendMap ,requestMap,inviteMap,userMap,dsListLocalPlayerName,dsMapPlayerVsCompName,
		 popupAnimSpd,tokenMoveSpd,tokenMoveBackSpd,diceRollIngTime,perAdIntersitial,
		 perMobileReview,dsMapStoreCoin,dsMapStoreCash,dsMapStoreDiamond,emojiMoveSpd,
		 dialogMoveSpd,dsMapDialogPretext,dialogWaitTime,freeSpin,freeSpinTime,
		 dsMapSpinWheelData,dsMapDiceData,dsMaptokenData,diceIndex,tokenIndex;

friendMap  = ds_map_create();
requestMap = ds_map_create();
inviteMap  = ds_map_create();
userMap  = ds_map_create();

dsListLocalPlayerName = ds_list_create();
dsMapPlayerVsCompName = ds_map_create();
dsMapDiceData		  = ds_map_create();
dsMaptokenData		  = ds_map_create();


Music			= true;
Sound			= true;
Notification	= true;
Vibration		= true;
Chat			= true;
winningAmount	= 200;
expLevel		= 0;
inviteLobbyID	= noone ;
isHost			= false;
oppoUniqueID	= noone;
requestCount	= 0;
inviteCount		= 0;
friendCount		= 0;
gameType		= noone;
noOfPlayers		= NoOfPlayer.Two;
pawnColour		= PawnColour.Green;
diceIndex		= 1;
tokenIndex		= 1;

Dice_Add_Data(1,"Dice1",spr_dice_white_dot,spr_dice_white_dot_anim);
Dice_Add_Data(2,"Dice2",spr_dice_black_dot,spr_dice_black_dot_anim);
Dice_Add_Data(3,"Dice3",spr_dice_white_num,spr_dice_white_num_anim);
Dice_Add_Data(4,"Dice4",spr_dice_black_num,spr_dice_black_num_anim);

Token_Add_Data(1,"Token1",spr_token_1);
Token_Add_Data(2,"Token2",spr_token_2);
Token_Add_Data(3,"Token3",spr_token_3);

#region Remote Configration Data

popupAnimSpd	= 0.1;// speed 
entryAmount		= 100;// coin 
lobbyWaitTime	= 90; // second
tokenMoveSpd	= 10; // percentage
tokenMoveBackSpd= 50; // per frame
diceRollIngTime	= 90; // second
perAdIntersitial= 25; // second
perMobileReview = 5; // second
emojiMoveSpd	= 8; // per frame 
dialogMoveSpd	= 0.1; // per frame 
dialogWaitTime	= 1.5; // second

// coin store 
dsMapStoreCoin = ds_map_create();
Store_Add_Data(StoreType.Coin,0,0,500,5);
Store_Add_Data(StoreType.Coin,1,1,1000,10);
Store_Add_Data(StoreType.Coin,2,2,1500,10);
Store_Add_Data(StoreType.Coin,3,2,2000,15);
Store_Add_Data(StoreType.Coin,4,2,2500,25);
Store_Add_Data(StoreType.Coin,5,2,3000,30);


// cash store
dsMapStoreCash = ds_map_create();
Store_Add_Data(StoreType.Cash,0,0,500,5);
Store_Add_Data(StoreType.Cash,1,1,1000,10);
Store_Add_Data(StoreType.Cash,2,2,1500,10);
Store_Add_Data(StoreType.Cash,3,2,2000,15);
Store_Add_Data(StoreType.Cash,4,2,2500,25);
Store_Add_Data(StoreType.Cash,5,2,3000,30);

// diamond store
dsMapStoreDiamond = ds_map_create(); 
Store_Add_Data(StoreType.Diamond,0,0,500,5);
Store_Add_Data(StoreType.Diamond,1,1,1000,10);
Store_Add_Data(StoreType.Diamond,2,2,1500,10);
Store_Add_Data(StoreType.Diamond,3,2,2000,15);
Store_Add_Data(StoreType.Diamond,4,2,2500,25);
Store_Add_Data(StoreType.Diamond,5,2,3000,30);

#endregion

#region dialogs

dsMapDialogPretext = ds_map_create();

// add dialogs in dialog map 
ds_map_add(dsMapDialogPretext,string(0),"Hurry Up!");
ds_map_add(dsMapDialogPretext,string(1),"Hi!");
ds_map_add(dsMapDialogPretext,string(2),"Hello!");
ds_map_add(dsMapDialogPretext,string(3),"PlayFast!");
ds_map_add(dsMapDialogPretext,string(4),"Okay!");
ds_map_add(dsMapDialogPretext,string(5),"Hahahaha!");
ds_map_add(dsMapDialogPretext,string(6),"Catch me!");
ds_map_add(dsMapDialogPretext,string(7),"Bye! Bye!");
ds_map_add(dsMapDialogPretext,string(8),"Hit Me!");
ds_map_add(dsMapDialogPretext,string(9),"I quit!");
ds_map_add(dsMapDialogPretext,string(10),"Sorry!");
ds_map_add(dsMapDialogPretext,string(11),"Yeah!");
ds_map_add(dsMapDialogPretext,string(12),"Oops!");
ds_map_add(dsMapDialogPretext,string(13),"OMG!");
ds_map_add(dsMapDialogPretext,string(14),"LOL!");
ds_map_add(dsMapDialogPretext,string(15),"Dont Run away!");
ds_map_add(dsMapDialogPretext,string(16),"Dont kill me!");
ds_map_add(dsMapDialogPretext,string(17),"Lucky roll!");
ds_map_add(dsMapDialogPretext,string(18),"All the best!");
ds_map_add(dsMapDialogPretext,string(19),"I am Ludo King!");

#endregion

#region name here

dsMapSpinWheelData = ds_map_create();

// free spin time difference 
var _freeSpinTimeDiff= 3600 * 8;// second

// Spinning wheel speed
var _spinWheelSpd	= 5; // percentage 

//  No Of Rotation 
var _noOfRoundRotate = 40; // rotation count

var _dsMapSpinWheelReward = ds_map_create();

// add spin wheel reward data 
ds_map_add(_dsMapSpinWheelReward,string(0),50);
ds_map_add(_dsMapSpinWheelReward,string(1),600);
ds_map_add(_dsMapSpinWheelReward,string(2),750);
ds_map_add(_dsMapSpinWheelReward,string(3),300);
ds_map_add(_dsMapSpinWheelReward,string(4),100);
ds_map_add(_dsMapSpinWheelReward,string(5),1000);
ds_map_add(_dsMapSpinWheelReward,string(6),650);
ds_map_add(_dsMapSpinWheelReward,string(7),500);
ds_map_add(_dsMapSpinWheelReward,string(8),250);
ds_map_add(_dsMapSpinWheelReward,string(9),800);
ds_map_add(_dsMapSpinWheelReward,string(10),500);

// add data in main map
ds_map_add(dsMapSpinWheelData,"FreeSpinTimeDiff",_freeSpinTimeDiff);
ds_map_add(dsMapSpinWheelData,"SpinWheelSpd",_spinWheelSpd);
ds_map_add(dsMapSpinWheelData,"NoOfRoundRotate",_noOfRoundRotate);
ds_map_add_map(dsMapSpinWheelData,"DsMapSpinWheelReward",_dsMapSpinWheelReward);

#endregion

#region Add Daily Rewards Data

globalvar dailyRewardDay;

dailyRewardDay = DailyReward.Day1;
dsMapDailyReward = ds_map_create();

ds_map_add(dsMapDailyReward,string(DailyReward.Day1), 50);
ds_map_add(dsMapDailyReward,string(DailyReward.Day2), 300);
ds_map_add(dsMapDailyReward,string(DailyReward.Day3), 500);
ds_map_add(dsMapDailyReward,string(DailyReward.Day4), 600);
ds_map_add(dsMapDailyReward,string(DailyReward.Day5), 700);
ds_map_add(dsMapDailyReward,string(DailyReward.Day6), 800);
ds_map_add(dsMapDailyReward,string(DailyReward.Day7), 1000);

#endregion

#region Pop Ups Data and map 

globalvar dsMapPopUpLocal, dsMapPopUpOnline, dsMapPopUpChooseEntry, dsMapPopUpSelectPawn,
		dsMapPopUpPlayWithFriends, dsMapPopUpSettings, dsMapPopUpStore, dsMapPopUpComputer, 
		dsMapPopUpDailyRewards,dsMapPopUpAddFriend;
	
//Pop up Local
dsMapPopUpLocal = ds_map_create();
ds_map_add(dsMapPopUpLocal,"title","Local");
ds_map_add(dsMapPopUpLocal, "maxNoOfString", 10);

//Pop up Online
dsMapPopUpOnline = ds_map_create();
ds_map_add(dsMapPopUpOnline, "title", "Select Players");

//Pop up Choose Entry
dsMapPopUpChooseEntry = ds_map_create();
ds_map_add(dsMapPopUpChooseEntry, "title", "Choose Entry");

//Pop Up Select pawn
dsMapPopUpSelectPawn = ds_map_create();
ds_map_add(dsMapPopUpSelectPawn, "title", "Select Pawn");

//Pop up play with friends
dsMapPopUpPlayWithFriends = ds_map_create();
ds_map_add(dsMapPopUpPlayWithFriends, "title", "Play With Friends");

//Pop Up Store
dsMapPopUpStore = ds_map_create();
ds_map_add(dsMapPopUpStore, "title", "Store");


//pop Up Computer
dsMapPopUpComputer = ds_map_create();
ds_map_add(dsMapPopUpComputer, "title", "Computer");

//Pop up Daily Rewards	
dsMapPopUpDailyRewards = ds_map_create();
ds_map_add(dsMapPopUpDailyRewards, "title", "Daily Rewards");
	
// Pop Up Add Friend
dsMapPopUpAddFriend = ds_map_create();	
ds_map_add(dsMapPopUpAddFriend, "maxNoOfString", 10);
ds_map_add(dsMapPopUpAddFriend, "title", "Add Friend");

//Pop up Settings
dsMapPopUpSettings = ds_map_create();
ds_map_add(dsMapPopUpSettings, "title", "Settings");
ds_map_add(dsMapPopUpSettings, "urlCredits", "https://www.google.com/");
ds_map_add(dsMapPopUpSettings, "urlMoreGame", "https://gamepatty.com");
ds_map_add(dsMapPopUpSettings, "urlFacebook", "https://www.facebook.com/gamepatty/");
ds_map_add(dsMapPopUpSettings, "urlFeedback", "https://www.google.com/");
ds_map_add(dsMapPopUpSettings, "urlSupport", "https://www.google.com/");
ds_map_add(dsMapPopUpSettings, "urlPolicy", "https://www.google.com/");

#endregion