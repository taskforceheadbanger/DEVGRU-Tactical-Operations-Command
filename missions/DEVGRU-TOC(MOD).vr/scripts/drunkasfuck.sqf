"chromAberration" ppEffectEnable true;
"chromAberration" ppEffectAdjust [0.01,0.01,true];
"chromAberration" ppEffectCommit 1;
"radialBlur" ppEffectEnable true;
"radialBlur" ppEffectAdjust [0.02,0.02,0.15,0.15];
"radialBlur" ppEffectCommit 1;
setAccTime 0.8;

waitUntil {time > 0};
disableSerialization;
_ehDrunk = ([] call BIS_fnc_displayMission) displayAddEventHandler [
"KeyDown",
"
	_actionKeys = (actionKeys 'MoveBack') + (actionKeys 'MoveFastForward') + (actionKeys 'MoveForward') + (actionKeys 'MoveSlowForward');
	if ((_this select 1) in _actionKeys) then {
		_anims = ['amovpercmsprslowwrfldf_amovppnemstpsraswrfldnon', 'amovpercmsprslowwpstdf_amovppnemstpsraswpstdnon_2', 'amovpercmsprsnonwnondf_amovppnemstpsnonwnondnon'];
		_animState = animationState player;
		_animStateChars = toArray _animState;
		_animP = toUpper(toString [_animStateChars select 5, _animStateChars select 6, _aniMStateChars select 7]);

		if	(((random 1) > 0.99) && {!(_animState in _anims) && (_animP != 'PNE')}) then {
			_i = if (primaryWeapon player != '') then {
				0
			} else {
				if (handgunWeapon player != '') then {
					1
				} else {
					2
				};
			};

			_anim = _anims select _i;
			player playMoveNow _anim;
			true
		};
	};
"
];

uiNamespace setVariable ["IP_DisplayEH_DrunkMode", _ehDrunk];
