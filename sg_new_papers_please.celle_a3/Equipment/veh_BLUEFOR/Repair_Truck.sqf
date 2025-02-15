_veh = _this select 0;

[_veh, 30] call ace_cargo_fnc_setSpace;

_veh addItemCargoGlobal ['ACE_tourniquet', 8];
_veh addItemCargoGlobal ['ACE_fieldDressing', 10];
_veh addItemCargoGlobal ['ACE_elasticBandage', 10];
_veh addItemCargoGlobal ['ACE_packingBandage', 10];
_veh addItemCargoGlobal ['ACE_quikclot', 10];
_veh addItemCargoGlobal ['ACE_morphine', 8];
_veh addItemCargoGlobal ['ACE_epinephrine', 8];
_veh addItemCargoGlobal ['ACE_splint', 5];

_veh addItemCargoGlobal ['rhsgref_30rnd_556x45_m21_t', 10];
_veh addItemCargoGlobal ['mkk_30rnd_556x45_m856_m21', 5];
_veh addItemCargoGlobal ['ToolKit', 3];

_veh addBackpackCargoGlobal ['UK3CB_BAF_B_Bergen_OLI_Rifleman_A', 3];
