_veh = _this select 0;

[_veh, 5] call ace_cargo_fnc_setSpace;
['ACE_Wheel', _veh] call ace_cargo_fnc_addCargoItem;

_veh addItemCargoGlobal ['ace_mag_VOG30_30', 8];
