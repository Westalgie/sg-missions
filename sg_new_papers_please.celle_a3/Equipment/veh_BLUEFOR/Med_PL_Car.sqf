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

_veh addItemCargoGlobal ['rhsgref_30rnd_556x45_m21_t', 15];
_veh addItemCargoGlobal ['mkk_30rnd_556x45_m856_m21', 7];

_veh addItemCargoGlobal ['rhs_mag_m67', 6];
_veh addItemCargoGlobal ['rhssaf_mag_brd_m83_white', 6];

_veh addBackpackCargoGlobal ['UK3CB_BAF_B_Bergen_OLI_Rifleman_A', 1];
