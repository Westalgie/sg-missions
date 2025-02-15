_veh = _this select 0;

_veh addItemcargoGlobal ['ACE_morphine', 20];
_veh addItemcargoGlobal ['ACE_epinephrine', 20];
_veh addItemcargoGlobal ['ACE_fieldDressing', 30];
_veh addItemcargoGlobal ['ACE_tourniquet', 10];
_veh addItemcargoGlobal ['ACE_quikclot', 30];
_veh addItemcargoGlobal ['ACE_elasticBandage', 30];
_veh addItemcargoGlobal ['ACE_packingBandage', 30];
_veh addItemCargoGlobal ['ACE_salineIV_500', 15];
_veh addItemcargoGlobal ['ACE_personalAidKit', 20];
_veh addItemcargoGlobal ['ACE_surgicalKit', 5];
_veh additemcargoGlobal ['ACE_suture', 20];
_veh addItemCargoGlobal ['ACE_splint', 10];

_veh addItemCargoGlobal ['rhs_weap_M136_hedp', 1];
_veh addItemCargoGlobal ['rhs_weap_M136', 1];

_veh addItemCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan', 20];
_veh addItemCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red', 10];

_veh addItemCargoGlobal ['rhs_mag_M441_HE', 10];

_veh addItemCargoGlobal ['rhs_mag_m67', 10];
_veh addItemCargoGlobal ['rhs_mag_m18_red', 3];
_veh addItemCargoGlobal ['rhs_mag_m18_green', 3];

_veh addBackpackCargoGlobal ['B_Kitbag_rgr', 1];
_veh addItemCargoGlobal ['ToolKit', 1];

_veh addItemCargoGlobal ["rhsusf_100Rnd_762x51_m80a1epr", 4];
for '_i' from 1 to 3 do { _veh addMagazineTurret ["rhs_mag_70Rnd_25mm_M242_APFSDS", [0], 70]; };
