/// @description Draw debug information
if !MobileDebug exit;
// This is for demo purposes and only draws debug information to the screen
draw_set_font(-1);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

var _yy = camera_get_view_height(view_camera[0])/2;
draw_text(70, _yy, "Consent Status: " + status);
draw_text(70, _yy + 35, "Consent Type: " + type);

// The function 'AdMob_Consent_IsFormAvailable()' will return either true or false depending
// on whether there is a consent form available or not on this device.
draw_text(70, _yy + 70, AdMob_Consent_IsFormAvailable() ? "Consent available" : "Consent unavailable");


// This function checks if the current interstitial ad is loaded. This function
// needs to return true before we can correctly show the interstitial ad.
var interstitial_isLoaded = AdMob_Interstitial_IsLoaded();
draw_text(70, _yy + 105, "Interstitial_isLoaded: " + string(interstitial_isLoaded));

// This function checks if the current rewarded video ad is loaded. This function
// needs to return true before we can correctly show the rewarded video ad.
var rewardedVideoAd_isLoaded = AdMob_RewardedVideo_IsLoaded();
draw_text(70, _yy + 140, "RewardedVideoAd_isLoaded: " + string(rewardedVideoAd_isLoaded));

var rewardedInterstitialAd_isLoaded = AdMob_RewardedInterstitial_IsLoaded();
draw_text(70, _yy + 175, "RewardedInterstitialAd_isLoaded: " + string(rewardedInterstitialAd_isLoaded));

// These set of function also allow to get the dimensions of the banner being displayed.
// If no banner is being displayed the functions return 0
// Note that the returned value is in display pixels and needs to be converted by the user
// according to the rendering target.
var room_pixels_w = AdMob_Banner_GetWidth()*room_width/display_get_width();
var room_pixels_h = AdMob_Banner_GetHeight()*room_height/display_get_height();
draw_text(70, _yy + 210, "Banner size: W=" + string(room_pixels_w) + ", H=" + string(room_pixels_h));
