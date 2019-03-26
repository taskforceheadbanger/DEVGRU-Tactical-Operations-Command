#include "script_component.hpp"

if !(isServer) exitWith {};

params [
    ["_grp",grpNull,[grpNull]]
];

_grp setVariable [QGVAR(disableGroup),true];

_grp enableDynamicSimulation false;
TRACE_1("disable dynamic simulation",_grp);

nil
