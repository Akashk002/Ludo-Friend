
show_debug_message("ASYNC SOCIAL EVENT: " + json_encode(async_load))

if(async_load[?"type"] == "MobileReview_Show")
if(async_load[?"success"])
	{
		debug_log("Review Success");
		FirebaseAnalyticsManager.user_review(true);
	}
	else
	{
		debug_log("Review Failed");
		FirebaseAnalyticsManager.user_review(true)
	};
