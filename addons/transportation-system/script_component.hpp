#define COMPONENT transport
#define COMPONENT_PRETTY Transport

#include "\x\dtoc\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE

#include "\x\dtoc\addons\main\script_macros.hpp"

#define TR_STR_EXFIL "Open your map and select a proper LZ on a relatively flat surface for extraction."
#define TR_STR_INFIL "Please select an LZ for insertaion."
#define TR_STR_CLOSE "Insertion LZ is so close to the extraction LZ that it is a waste of gas. You are a Tier One operator team. Traverse terrain on foot."
#define TR_STR_NOTLAND "We cannot land in water! Please designate a LZ on a relatively flat surface on land."
#define TR_STR_BADTERRAIN "We cannot land there, select another LZ on a relatively flat surface."
#define TR_STR_CANCEL "Transportation requester has called off the bird."
#define TR_STR_GETIN "Signal for takeoff when all operators are secured in aircraft and ready."
#define TR_STR_KILLED "Transportation vehicle was destroyed enroute to LZ! Survivor and casualty status unknown. Please issue a search party."
#define TR_STR_ENROUTE "Transportation request sucessful, we are dispatching your aircraft transportation now."

#define MRK_INFIL(VAR) ([VAR,"infil"] joinString "_")
#define MRK_EXFIL(VAR) ([VAR,"exfil"] joinString "_")

#define TR_SPAWN_DIST 4000
#define TR_IDLE_TIME 300
#define TR_CHECKDIST 15

#define TR_STATE_WAITING "WAITING"
#define TR_STATE_READY "READY"
#define TR_STATE_NOTREADY "NOT READY"

#define TR_COOLDOWN(REQUESTOR) \
    [ \
        { \
            {GVAR(status) = TR_STATE_READY} remoteExecCall [QUOTE(BIS_fnc_call),_this,false]; \
            GVAR(count) = GVAR(count) - 1; \
            publicVariable QGVAR(count); \
        }, \
        (REQUESTOR), \
        GVAR(cooldown) \
    ] call CBA_fnc_waitAndExecute
#define TR_EXFIL(TRANSPORT) \
    [ \
        TRANSPORT, \
        TRANSPORT getVariable QGVAR(exfil), \
        "GET IN", \
        { \
            [ \
                { \
                    if !(_this getVariable [QGVAR(signal),-1] isEqualTo 1) then { \
                        {if !(_x isEqualTo (driver _this)) then {moveOut _x}} forEach (crew _this); \
                        [QEGVAR(main,cleanup),_this] call CBA_fnc_serverEvent; \
                        _this doMove [0,0,0]; \
                        _this setVariable [QGVAR(status),TR_STATE_WAITING,false]; \
                    }; \
                }, \
                _this select 0, \
                TR_IDLE_TIME \
            ] call CBA_fnc_waitAndExecute; \
        } \
    ] call EFUNC(main,landAt)
#define TR_INFIL(TRANSPORT) \
    [ \
        {_this getVariable [QGVAR(signal),-1] isEqualTo 1}, \
        { \
            _this removeAllEventHandlers "GetIn"; \
            [ \
                _this, \
                _this getVariable QGVAR(infil), \
                "GET OUT", \
                { \
                    [ \
                        { \
                            {if !(_x isEqualTo (driver _this)) then {moveOut _x}} forEach (crew _this); \
                            [QEGVAR(main,cleanup),_this] call CBA_fnc_serverEvent; \
                            _this doMove [0,0,0]; \
                            _this setVariable [QGVAR(status),TR_STATE_WAITING,false]; \
                            _this animateDoor ["door_R", 0]; \
                            _this animateDoor ["door_L", 0]; \
                            _this animateDoor ["CargoRamp_Open", 0]; \
                            _this animateDoor ["Door_rear_source", 0]; \
                            _this animateDoor ["Door_6_source", 0]; \
                            _this animate ["dvere1_posunZ", 0]; \
                            _this animate ["dvere2_posunZ", 0]; \
                        }, \
                        _this select 0, \
                        10 \
                    ] call CBA_fnc_waitAndExecute; \
                }] call EFUNC(main,landAt); \
        }, \
        TRANSPORT \
    ] call CBA_fnc_waitUntilAndExecute

#define TR_REQUEST_NAME "Request Transport"
#define TR_REQUEST_CHILD call FUNC(getChildren)
#define TR_REQUEST_COND call FUNC(canCallTransport)

#define TR_SIGNAL_NAME "Signal Take Off"
#define TR_SIGNAL_STATEMENT (objectParent player) setVariable [QGVAR(signal),1,true]
#define TR_SIGNAL_COND !(isNull objectParent player) && {((objectParent player) getVariable [QGVAR(signal),-1]) isEqualTo 0}
