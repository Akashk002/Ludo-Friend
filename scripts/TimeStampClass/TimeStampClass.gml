// Script

function TimeStamp_To_Date(_timeStamp)
{
    // Change the timestamp to UTC
    date_set_timezone(timezone_utc);

    // Create the starting Date
    var _date = date_create_datetime(1970,1,1,0,0,0);

    // Add the time in the starting date
    var _newDate = (_timeStamp/86400) + _date;

    // Return the Date
    return _newDate;
};


function TimeStamp_To_Date_ms(_timeStamp)
{
    // Change the timestamp to UTC
    date_set_timezone(timezone_utc);

    // Create the starting Date
    var _date = date_create_datetime(1970,1,1,0,0,0);

    // Add the time in the starting date
    var _newDate = (_timeStamp/(86400 * 1000)) + _date;

    // Return the Date
    return _newDate;
};


function Date_To_TimeStamp(Date)
{
    // Change the timestamp to UTC
    date_set_timezone(timezone_utc);

    // Create the starting Date
    var _date = date_create_datetime(1970,1,1,0,0,0);

    // Add the time in the starting date
    var _timeStamp = (Date - _date) * 86400; 

    // Return the Date
    return _timeStamp;
};


function Date_To_TimeStamp_ms(Date)
{

    // Add the time in the starting date
    var _timeStamp = Date_To_TimeStamp(Date) * 1000; 

    // Return the Date
    return _timeStamp;
};