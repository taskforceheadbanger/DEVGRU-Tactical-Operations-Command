/*
Reverse Fix
[[_unit, "Crew"], "devgru_fnc_switchMove"] spawn BIS_fnc_MP;
*/
_chair = _this select 0;
_unit = _this select 1;
// [[_unit, "Acts_HeliCargoTalking_loop"], "devgru_fnc_switchMove"] spawn BIS_fnc_MP;
// _unit disableCollisionWith _chair;
// _chair disableCollisionWith _unit;
_// unit setPosATL [((getPosATL _chair select 0) 0), ((getPosATL _chair select 1) 0), ((getPosATL _chair select 2) -1 )];
// Fixing with Attachment ??
//_chair setPosATL [((getPosATL _unit select 0) +0), ((getPosATL _unit select 1) +0.0), ((getPosATL _unit select 2) +0.0)];
//_unit attachTo [_chair, [0, 0, 0], "wtf they still float on turn motion "];
// _unit setDir ((getDir _chair) - 180);
standup = _unit addaction ["<t color='#0099FF'>Stand Up</t>","scripts\standup.sqf"];
//_unit setpos [getpos _unit select 0, getpos _unit select 1,((getpos _unit select 2) +1)];
