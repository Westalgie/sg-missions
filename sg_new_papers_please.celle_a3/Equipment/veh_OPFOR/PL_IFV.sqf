_veh = _this select 0;

[_veh, 8] call ace_cargo_fnc_setSpace;
['ACE_Track', _veh] call ace_cargo_fnc_addCargoItem;

_veh addItemCargoGlobal ['ACE_tourniquet', 8];
_veh addItemCargoGlobal ['ACE_fieldDressing', 10];
_veh addItemCargoGlobal ['ACE_elasticBandage', 10];
_veh addItemCargoGlobal ['ACE_packingBandage', 10];
_veh addItemCargoGlobal ['ACE_quikclot', 10];
_veh addItemCargoGlobal ['ACE_morphine', 8];
_veh addItemCargoGlobal ['ACE_epinephrine', 8];
_veh addItemCargoGlobal ['ACE_splint', 5];

_veh addItemCargoGlobal ['rhs_weap_rshg2', 1];

_veh addItemCargoGlobal ['rhs_30Rnd_545x39_7N10_AK', 15];
_veh addItemCargoGlobal ['rhs_30Rnd_545x39_AK_plum_green', 7];

_veh addItemCargoGlobal ['rhs_mag_rgd5', 10];
_veh addItemCargoGlobal ['rhs_mag_rdg2_white', 10];

_veh addItemCargoGlobal ['rhs_VOG25', 15];

_veh addItemCargoGlobal ['rhs_45Rnd_545X39_7N10_AK', 5];
_veh addItemCargoGlobal ['rhs_45Rnd_545X39_AK_Green', 5];

_veh addBackpackCargoGlobal ['rhs_rk_sht_30_emr', 1];
_veh addBackpackCargoGlobal ['tf_mr3000_emr_RETRO', 1];
_veh addItemCargoGlobal ['ToolKit', 1];

_veh addItemCargoGlobal ['ace_mag_9m111', 2];
_veh addItemCargoGlobal ['ace_mag_pg15v', 20];
_veh addItemCargoGlobal ['ace_mag_og15v', 10];
_veh addItemCargoGlobal ['rhs_100Rnd_762x54mmR', 8];