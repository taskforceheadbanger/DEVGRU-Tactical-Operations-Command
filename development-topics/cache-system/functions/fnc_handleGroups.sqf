#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_obj"];

if (_obj in allUnits && {!(dynamicSimulationEnabled (group _obj))} && {!(_obj getVariable [QGVAR(disableGroup),false])}) then {
    [QGVAR(enableGroup),group _obj] call CBA_fnc_localEvent;
};

nil
