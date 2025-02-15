_veh = _this select 0;

[_veh, 30] call ace_cargo_fnc_setSpace;

_veh addItemCargoGlobal ['ToolKit', 3];

_veh addBackpackCargoGlobal ['BWA3_Kitbag_Multi', 3];