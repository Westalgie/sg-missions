_veh = _this select 0;

[_veh, 8] call ace_cargo_fnc_setSpace;

_veh addItemCargoGlobal ['ACE_tourniquet', 10];
_veh addItemCargoGlobal ['ACE_fieldDressing', 15];
_veh addItemCargoGlobal ['ACE_elasticBandage', 15];
_veh addItemCargoGlobal ['ACE_packingBandage', 15];
_veh addItemCargoGlobal ['ACE_quikclot', 15];
_veh addItemCargoGlobal ['ACE_morphine', 8];
_veh addItemCargoGlobal ['ACE_epinephrine', 8];
_veh addItemCargoGlobal ['ACE_splint', 10];

_veh addItemCargoGlobal ['rhs_mag_30Rnd_556x45_Mk262_PMAG_Tan', 15];
_veh addItemCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red', 7];

_veh addItemCargoGlobal ['hlc_mag_50rnd_556x45_Mk262_X15', 6];

_veh addItemCargoGlobal ['rhsusf_20Rnd_762x51_m993_Mag', 6];
_veh addItemCargoGlobal ['rhsusf_20Rnd_762x51_m62_Mag', 4];

_veh addItemCargoGlobal ['rhs_mag_m67', 10];
_veh addItemCargoGlobal ['rhs_mag_an_m8hc', 6];

_veh addBackpackCargoGlobal ['B_AssaultPack_mcamo', 1];

_veh addBackpackCargoGlobal ['SatchelCharge_Remote_Mag', 4];
