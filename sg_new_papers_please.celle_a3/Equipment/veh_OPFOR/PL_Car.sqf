_veh = _this select 0;

[_veh, 5] call ace_cargo_fnc_setSpace;
['ACE_Wheel', _veh] call ace_cargo_fnc_addCargoItem;

_veh addItemCargoGlobal ['ACE_tourniquet', 8];
_veh addItemCargoGlobal ['ACE_fieldDressing', 10];
_veh addItemCargoGlobal ['ACE_elasticBandage', 10];
_veh addItemCargoGlobal ['ACE_packingBandage', 10];
_veh addItemCargoGlobal ['ACE_quikclot', 10];
_veh addItemCargoGlobal ['ACE_morphine', 8];
_veh addItemCargoGlobal ['ACE_epinephrine', 8];
_veh addItemCargoGlobal ['ACE_splint', 5];

_veh addItemCargoGlobal ['rhs_30Rnd_545x39_7N10_AK', 15];
_veh addItemCargoGlobal ['rhs_30Rnd_545x39_AK_plum_green', 7];

_veh addItemCargoGlobal ['rhs_mag_rgd5', 6];
_veh addItemCargoGlobal ['rhs_mag_rdg2_white', 6];

_veh addItemCargoGlobal ['rhs_100Rnd_762x54mmR_7N13', 5];

_veh addItemCargoGlobal ['rhs_10Rnd_762x54mmR_7N14', 10];

_veh addBackpackCargoGlobal ['rhs_rk_sht_30_emr', 1];
