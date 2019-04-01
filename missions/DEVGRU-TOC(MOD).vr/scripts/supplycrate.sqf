// Supply Crate Smoke and Chemlight
_supplybox = _this select 0;
for "_x" from 1 to 10 do
{
_supplyLight = "Chemlight_green" createVehicle (position _supplybox);
_supplyLight attachTo [_supplybox, [0,0,0]];
_supplySmoke = "SmokeShellGreen" createVehicle (position _supplybox);
_supplySmoke attachTo [_supplybox, [0,0,0]];
sleep 60;
};