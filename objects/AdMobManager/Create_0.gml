/// @description Initialize variables

// Debug variables (used in draw event)
status	= "UNKNOWN";
type	= "UNKNOWN";
debug	= true || MobileDebug;
/*
	The first step to configure AdMob with your application/game is to get the
	unique string ad block ids from the admob development console for you app.
	In this example we are using all the bellow ad types:
	
		- Banners
		- Interstitial
		- RewardedVideo
		- RewardedInterstitial
		
	In your case you just need the ones you are using, these ids also change from
	Android to iOS so we also provide a code sample that acounts for that.
	You can set them inside the extension using the new extension options features
	these will be used and set by default or optionaly you can use the old method of
	initialization if you need to change them at runtime (see end of the page).
	
*/

// ###############################################
//                 UTILITY METHODS
// ###############################################

// This function is here for debug purposes and uses 'AdMob_Consent_GetType' and
// 'AdMob_Consent_GetStatus' to print the current consent Status/Type to the console.
function showDebugInfo()
{
	var consent_type = AdMob_Consent_GetType();
	switch(consent_type)//https://developers.google.com/admob/ump/android/api/reference/com/google/android/ump/ConsentInformation.ConsentType
	{
		// The user gave permission for data to be collected in order to provide personalized ads.
		case AdMob_Consent_Type_PERSONALIZED:
			show_debug_message("GoogleMobilesAds ConsentType: PERSONALIZED")
		break
			
		// The user refused to share data for personalized ads. Ads will be NON PERSONALIZED
		case AdMob_Consent_Type_NON_PERSONALIZED:
			show_debug_message("GoogleMobilesAds ConsentType: NON_PERSONALIZED")
		break			

		// Unable to get the current type of consent provided by the use
		// Note that for EEA users, the type will always be UNKNOWN (known issue) 
		case AdMob_Consent_Type_UNKNOWN:
			show_debug_message("GoogleMobilesAds ConsentType: UNKNOWN")
		break
	}
}


// This function is an helper function used for loading all ads
function loadAllAds() {
	
	var _os_is_android = (os_type == os_android);
	
	// Check Banner ID
	var _bannerID = (_os_is_android)? "Android_BANNER" : "iOS_BANNER";
	var _bannerValue = extension_get_option_value("AdMob", _bannerID);
	if (_bannerValue != ""){
	AdMob_Banner_Create(AdMob_Banner_ADAPTIVE,true);
	debug_log("AdMob", "Got Banner AD ID, Loading AD...")	
	};
	
	
	// Check Interstitial ID
	var _interstitialID = (_os_is_android)? "Android_INTERSTITIAL" : "iOS_INTERSTITIAL";	
	var _interstitialValue = extension_get_option_value("AdMob", _interstitialID);
	if (_interstitialValue != ""){
		// Load the Ad
		AdMob_Interstitial_Load();
		// 
		debug_log("AdMob", "GOT Intersitial AD ID, Loading AD...")
		};
	
	
	// Check Reward Video ID
	var _rewardedID = (_os_is_android)? "Android_REWARDED" : "iOS_REWARDED";	
	var _rewardedValue = extension_get_option_value("AdMob", _rewardedID);
	if (_rewardedValue != ""){
		// Load the Ad
		AdMob_RewardedVideo_Load();
		// 
		debug_log("AdMob", "GOT Rewarded Video AD ID, Loading AD...")
		};
		
	// Check Rewarded Interstitial ID
	var _rewardedID = (_os_is_android)? "Android_REWARDED_INTERSTITIAL" : "iOS_REWARDED_INTERSTITIAL";	
	var _rewardedValue = extension_get_option_value("AdMob", _rewardedID);
	if (_rewardedValue != ""){
		// Load the Ad
		AdMob_RewardedInterstitial_Load();
		// 
		debug_log("AdMob", "GOT Rewarded Intersitial AD ID, Loading AD...")
		};
}

// This function updates both consent Status and Type strings
// To avoid calling the logic every frame
function updateConsentStrings() {

	// The function 'AdMob_Consent_GetStatus' allows the developer to know if the
	// GDPR consent request is required or not or if the user already answered to the
	// consent request (OBTAINED).
	switch(AdMob_Consent_GetStatus())
	{
		case AdMob_Consent_Status_UNKNOWN: status = "UNKNOWN"; break;
		case AdMob_Consent_Status_NOT_REQUIRED: status = "NOT_REQUIRED"; break;
		case AdMob_Consent_Status_REQUIRED: status = "REQUIRED"; break;
		case AdMob_Consent_Status_OBTAINED: status = "OBTAINED"; break;
	}

	// The function 'AdMob_Consent_GetType' allows the developer to know what was the
	// type of consent given by the user. Can the ads be personalized (allowed) or not (rejected).
	switch(AdMob_Consent_GetType())
	{
		case AdMob_Consent_Type_UNKNOWN: type = "UNKNOWN"; break;
		case AdMob_Consent_Type_NON_PERSONALIZED: type = "NON_PERSONALIZED"; break;
		case AdMob_Consent_Type_PERSONALIZED: type = "PERSONALIZED"; break;
		case AdMob_Consent_Type_DECLINED: type = "DECLINED"; break;
	}
}

function banner_hide()
{

	switch (room) 
	{
	    case rm_menu_android:
		  case rm_menu_ios:	   
				AdMob_Banner_Hide();
				show_debug_message("Hide banner ")
		        break;
	    default:
	        show_debug_message("show banner ")
			AdMob_Banner_Show();
		
	        break;
	}


}
// ###############################################
//                  CONFIGURATION
// ###############################################

// Sets this device as a test device (should be called before AdMob_Initialize)
// NOTE: This is for development only and should not be used when your game enters production.
// ** On iOS devices to use test device you need to include the App Tracking Transparency extension. **
if (debug)
	{
	debug_log("AdMob", "SET AS TEST DEVICE");
	AdMob_SetTestDeviceId();
	};

// On the new version of this extension you are also able to control the max rating of the
// content displayed on the ads, bellow there is an example with all the possible options available.
AdMob_Targeting_MaxAdContentRating(AdMob_ContentRating_GENERAL);
//AdMob_Targeting_MaxAdContentRating(AdMob_ContentRating_PARENTAL_GUIDANCE);
//AdMob_Targeting_MaxAdContentRating(AdMob_ContentRating_TEEN);
//AdMob_Targeting_MaxAdContentRating(AdMob_ContentRating_MATURE_AUDIENCE);

// Now you can configure targeting, the functions bellow will allow you to enable and disable
// special ad filtering for children and under age users (respectively)
AdMob_Targeting_COPPA(true);
AdMob_Targeting_UnderAge(true);

// ###############################################
//                  INITIALIZATION
// ###############################################

// The first function to be called is Initialize, this is demanding that it is called in first
// place to initialize the AdMob Extension API and allow for everything to work properly.
AdMob_Initialize();
