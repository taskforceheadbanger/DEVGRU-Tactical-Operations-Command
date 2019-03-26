#include "script_component.hpp"

COMPARE_STR(GVAR(status),TR_STATE_READY) && {GVAR(count) <= ceil GVAR(limit)} && {cameraOn isEqualTo player}
