private ["_addGPS", "_termianlclass", "_marker", "_object", "_marker_distance", "_has_terminal"];

_addGPS = false;
_termianlclass = "";
_object = _this select 0;
_marker = createMarkerLocal ["uav_control",position _object];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "EMPTY";
_marker_distance = player distance (getMarkerPos _marker);
_has_terminal = false;



switch (side player) do {
case WEST: {_termianlclass = "B_UavTerminal";};
case EAST: {_termianlclass = "O_UavTerminal";};
case INDEPENDENT: {_termianlclass = "I_UavTerminal";};
};

If("ItemGPS" in assignedItems player OR "ItemGPS" in items player) then
{
_addGPS = true;
};

If(_termianlclass in assignedItems player) then
{
_has_terminal = true;
};



player addItem _termianlclass;
player assignItem _termianlclass;
player action ["UAVTerminalOpen", player];

If ((_addGPS) && !("ItemGPS" in items player)) then
{
player addItem "ItemGPS";
};

WaitUntil {player distance getMarkerPos _marker != _marker_distance};
If !(_has_terminal) then
{
player unassignitem _termianlclass;
player removeItem _termianlclass;
};
