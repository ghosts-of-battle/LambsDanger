#include "script_component.hpp"
/*
 * Author: jokoho482
 * Event Callback Wrapper
 *
 * Arguments:
 * 0: Event name <STRING>
 * 1: Event parameters <ARRAY>
 *
 * Return Value:
 * none
 *
 * Example:
 * ["MyAwesomeEventname", "MyAwsomeEventParameter110011"] call lambs_danger_fnc_eventCallback;
 *
 * Public: No
*/
params ["_eventName", "_eventParameter"];

[_eventName, _eventParameter] spawn { // TODO: Check if we realy need this.
    [{
         _this call CBA_fnc_localEvent;
    }, _this] call CBA_fnc_directCall;
};
