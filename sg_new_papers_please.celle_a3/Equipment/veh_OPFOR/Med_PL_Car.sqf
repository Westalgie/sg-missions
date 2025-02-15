_veh = _this select 0;

[_veh, 5] call ace_cargo_fnc_setSpace;
['ACE_Wheel', _veh] call ace_cargo_fnc_addCargoItem;

_veh addItemcargoGlobal ['ACE_morphine', 20];
_veh addItemcargoGlobal ['ACE_epinephrine', 20];
_veh addItemcargoGlobal ['ACE_fieldDressing', 30];
_veh addItemcargoGlobal ['ACE_tourniquet', 10];
_veh addItemcargoGlobal ['ACE_quikclot', 30];
_veh addItemcargoGlobal ['ACE_elasticBandage', 30];
_veh addItemcargoGlobal ['ACE_packingBandage', 30];
_veh addItemCargoGlobal ['ACE_salineIV_500', 15];
_veh addItemcargoGlobal ['ACE_personalAidKit', 10];
_veh addItemcargoGlobal ['ACE_surgicalKit', 5];
_veh additemcargoGlobal ['ACE_suture', 20];
_veh addItemCargoGlobal ['ACE_splint', 10];

_veh addItemCargoGlobal ['rhs_30Rnd_545x39_7N10_AK', 15];
_veh addItemCargoGlobal ['rhs_30Rnd_545x39_AK_plum_green', 7];

_veh addItemCargoGlobal ['rhs_mag_rgd5', 6];
_veh addItemCargoGlobal ['rhs_mag_rdg2_white', 6];

_veh addItemCargoGlobal ['rhs_100Rnd_762x54mmR_7N13', 5];

_veh addItemCargoGlobal ['rhs_10Rnd_762x54mmR_7N14', 10];

_veh addBackpackCargoGlobal ['rhs_rk_sht_30_emr', 1];