//_chair = _this select 0;
//_unit = _this select 1;
player switchMove "";
detach player;
//_unit enableCollisionWith _chair;
//_chair enableCollisionWith _unit;
player removeaction standup;
