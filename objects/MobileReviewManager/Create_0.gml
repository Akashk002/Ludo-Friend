// 
function percent_chance(percent)
{
	return (irandom(100) < percent)
}

// Show the mobile review
if (percent_chance(perMobileReview)) 
{
	// Show Mobile Review
	MobileReview_Show();
}
