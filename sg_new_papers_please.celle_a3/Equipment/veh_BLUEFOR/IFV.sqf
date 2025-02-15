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

_veh addItemCargoGlobal ['rhs_weap_M136_hp', 1];

_veh addItemCargoGlobal ['rhs_weap_maaws', 1];
_veh addItemCargoGlobal ['rhs_optic_maaws', 1];
_veh addItemCargoGlobal ['rhs_mag_maaws_HEAT', 3];

_veh addItemCargoGlobal ['mkk_30Rnd_556x45_m855_AUG', 15];
_veh addItemCargoGlobal ['mkk_30Rnd_556x45_m856a1_AUG', 7];

_veh addItemCargoGlobal ['rhs_mag_m67', 10];
_veh addItemCargoGlobal ['rhssaf_mag_brd_m83_white', 10];

_veh addItemCargoGlobal ['rhs_mag_M441_HE', 15];

_veh addItemCargoGlobal ['mkk_42Rnd_556x45_mk262_AUG', 5];
_veh addItemCargoGlobal ['mkk_42Rnd_556x45_m855a1_AUG', 5];

_veh addItemCargoGlobal ['rhsusf_20Rnd_762x51_SR25_m993_Mag', 10];

_veh addBackpackCargoGlobal ['UK3CB_BAF_B_Bergen_OLI_Rifleman_A', 1];
_veh addBackpackCargoGlobal ['mkk_mr3000_bwmod_blue', 1];
_veh addItemCargoGlobal ['ToolKit', 1];

_veh addItemCargoGlobal ['ace_mag_9m111', 2];
_veh addItemCargoGlobal ['ace_mag_pg15v', 20];
_veh addItemCargoGlobal ['ace_mag_og15v', 10];
_veh addItemCargoGlobal ['rhs_100Rnd_762x54mmR', 8];