// ADClass v1.1

global.noAds = false;
global.adIntersitialPercent = 50;
//
function Watch_Interstitial_Ad(percent = global.adIntersitialPercent)
{
	if (global.noAds == false)
	{
		//
		if (AdMob_Interstitial_IsLoaded()) {
			if (irandom(100) < percent)
			{
			//
			AdMob_Interstitial_Show();
			};
		}
		else
		{
			//
			AdMob_Interstitial_Load();
			show_debug_message("Interstitial Still loading, try again soon");
		};
		
	};
};

function Watch_Reward_Video()
{
		// Check if current interstitial ad is loaded
		if(AdMob_RewardedVideo_IsLoaded())
			{
				// Loaded: show interstitial ad
			    AdMob_RewardedVideo_Show();
				show_debug_message("RewardedVideo Show");
			}	
			else
			{
				// Not Loaded: load interstitial ad
				AdMob_RewardedVideo_Load();
			    show_debug_message("RewardedVideo Still loading, try again soon");
			};
};

function Watch_Reward_Interstitial()
{
		// Check if current interstitial ad is loaded
		if(AdMob_RewardedInterstitial_IsLoaded())
			{
				// Loaded: show interstitial ad
			    AdMob_RewardedInterstitial_Show();
				show_debug_message("Rewarded Interstitial Show");
			}	
			else
			{
				// Not Loaded: load interstitial ad
				AdMob_RewardedInterstitial_Load();
			    show_debug_message("Rewarded Interstitial Still loading, try again soon");
			};
};