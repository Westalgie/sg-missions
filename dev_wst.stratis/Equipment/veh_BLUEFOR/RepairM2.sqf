_veh = _this select 0;

['ACE_Wheel', _veh] call ace_cargo_fnc_addCargoItem;

_veh addItemCargoGlobal ['ACE_tourniquet', 8];
_veh addItemCargoGlobal ['ACE_fieldDressing', 10];
_veh addItemCargoGlobal ['ACE_elasticBandage', 10];
_veh addItemCargoGlobal ['ACE_packingBandage', 10];
_veh addItemCargoGlobal ['ACE_quikclot', 10];
_veh addItemCargoGlobal ['ACE_morphine', 8];
_veh addItemCargoGlobal ['ACE_epinephrine', 8];
_veh addItemCargoGlobal ['ACE_splint', 5];

_veh addItemCargoGlobal ['mkk_hlc_30rnd_556x45_EPR_HK33', 10];
_veh addItemCargoGlobal ['mkk_hlc_30rnd_556x45_t_HK33', 5];

_veh addItemCargoGlobal ['ToolKit', 3];
_veh addBackpackCargoGlobal ['BWA3_Kitbag_Multi', 3];

_veh addItemCargoGlobal ["ace_mag_100rnd_127x99_mag_Tracer_Red", 8];