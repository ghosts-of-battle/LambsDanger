#include "script_component.hpp"
/*
 * Author: jokoho482
 * TODO
 *
 * Arguments:
 * TODO
 *
 * Return Value:
 * TODO
 *
 * Example:
 * TODO
 *
 * Public: No
*/
params [["_mode", "", [""]], ["_input", [], [[]]]];

switch (_mode) do {
    // Default object init
    case "init": {
        if (is3DEN) exitWith {};
        _input params [["_logic", objNull, [objNull]], ["_isActivated", true, [true]], ["_isCuratorPlaced", false, [true]]];
        if !(_isActivated) exitWith {};
        if (_isCuratorPlaced) then {

        } else {
            private _units = synchronizedObjects _logic;
            _units = (_units apply {group _x});
            _units = _units arrayIntersect _units;

            private _area = _logic getVariable ["objectarea",[]];
            private _range = _area select ((_area select 0) < (_area select 1));

            {
                [_x, _range, _area] spawn FUNC(taskCamp);
            } forEach _units;
            deleteVehicle _logic;
        };
    };
    // When some attributes were changed (including position and rotation)
    case "attributesChanged3DEN": {
        params [["_logic", objNull, [objNull]]];
    };
    // When added to the world (e.g., after undoing and redoing creation)
    case "registeredToWorld3DEN": {
        params [["_logic", objNull, [objNull]]];
    };
    // When removed from the world (i.e., by deletion or undoing creation)
    case "unregisteredFromWorld3DEN": {
        params [["_logic", objNull, [objNull]]];
    };
    // When connection to object changes (i.e., new one is added or existing one removed)
    case "connectionChanged3DEN": {
        params [["_logic", objNull, [objNull]]];
    };
    // When object is being dragged
    case "dragged3DEN": {
        params [["_logic", objNull, [objNull]]];
    };
};
true
