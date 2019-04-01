null = [[Monitor1,Monitor2,Monitor3,Monitor4,Monitor5,Monitor6,Monitor7,Monitor8],["drone1","drone2","drone3","drone4","drone5","drone6","drone7","drone8","drone9","drone10","drone11","drone12","drone13","specialactivies","callsignisachilles","jtac","s1","s2","s3","p1","p2","p3","p4","p5","p6","p7","p8","p9","p10","p11","p12","p13","p14","p15","p16","p17","p18","p19","p20","p21","p22"]] execVM "LFC\Feedinit.sqf";
basedoctor addAction ["<t color='#0099FF'>Hey Doc, Full Heal Me</t>", {{if (_x distance basedoctor < 5) then {[_x, _x] remoteExecCall ["ACE_medical_fnc_treatmentAdvanced_fullHeal", 0];};} forEach allplayers;},[], 1.5, false, true, "","true", 3];
basedoctor_1 addAction ["<t color='#0099FF'>Hey Doc, Full Heal Me</t>", {{if (_x distance basedoctor_1 < 5) then {[_x, _x] remoteExecCall ["ACE_medical_fnc_treatmentAdvanced_fullHeal", 0];};} forEach allplayers;},[], 1.5, false, true, "","true", 3];
basedoctor_2 addAction ["<t color='#0099FF'>Hey Doc, Full Heal Me</t>", {{if (_x distance basedoctor_2 < 5) then {[_x, _x] remoteExecCall ["ACE_medical_fnc_treatmentAdvanced_fullHeal", 0];};} forEach allplayers;},[], 1.5, false, true, "","true", 3];
basedoctor_3 addAction ["<t color='#0099FF'>Hey Doc, Full Heal Me</t>", {{if (_x distance basedoctor_3 < 5) then {[_x, _x] remoteExecCall ["ACE_medical_fnc_treatmentAdvanced_fullHeal", 0];};} forEach allplayers;},[], 1.5, false, true, "","true", 3];

/* Sitting Code */
devgru_fnc_switchMove = {
    // Make sure only the activated player
    private["_object","_anim"];
    // Define some selections for mouse wheel
    _object = _this select 0; _anim = _this select 1;
    // SWITCH!
    _object switchMove _anim;
    // Finish the final get up animation later
  };
/* Spawnglitch Fix and Safezone Code for Safe Keeping 
0 = [] spawn { while{true} do {{if(_x distance (getMarkerPos "mrk_safe_zone") < 800) then {_x allowDamage false} else {_x allowDamage true}; } forEach allUnits + vehicles; sleep 1; }; };
_EndSplashScreen = { for "_x" from 1 to 4 do { endLoadingScreen; sleep 3; }; }; [] spawn _EndSplashScreen; */

