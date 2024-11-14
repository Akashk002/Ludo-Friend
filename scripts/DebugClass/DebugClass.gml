// Script contains debug helper scripts
#macro Debug false
#macro MobileDebug false

#macro DEBUG:Debug true
#macro DEBUG:MobileDebug true
#macro DEBUG:live_enabled true

#macro ANDROID:Debug false
#macro ANDROID:MobileDebug false
#macro ANDROID:live_enabled false

#macro IOS:Debug false
#macro IOS:MobileDebug false
#macro IOS:live_enabled false


#macro DEBUG_ANDROID:Debug true
#macro DEBUG_ANDROID:MobileDebug true
#macro DEBUG_ANDROID:live_enabled (os_type == os_windows)

#macro DEBUG_IOS:Debug true
#macro DEBUG_IOS:MobileDebug true
#macro DEBUG_IOS:live_enabled (os_type == os_windows)



function debug_var(NormalValue,DebugValue)
{
    return (Debug)? DebugValue : NormalValue;
}


function debug_local(DebugLocal)
{
    if (Debug) && (DebugLocal)
    {
        var _r = string(argument[1]);
        for (var _i = 1; _i < argument_count; _i++) {
            _r += ", " + string(argument[_i])
            };
        //
        show_debug_message(_r);
    };
};

function debug_log(){

    if (Debug)
        {
        var _r = string(argument[0]);
        for (var _i = 1; _i < argument_count; _i++) {
            _r += ", " + string(argument[_i])
            }
        show_debug_message(_r);
        }
}

function debug_map(dsMap)
{
debug_log(json_encode(dsMap));
};