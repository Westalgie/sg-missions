_veh = _this select 0;

_veh addItemCargoGlobal ['ACE_tourniquet', 10];
_veh addItemCargoGlobal ['ACE_fieldDressing', 15];
_veh addItemCargoGlobal ['ACE_elasticBandage', 15];
_veh addItemCargoGlobal ['ACE_packingBandage', 15];
_veh addItemCargoGlobal ['ACE_quikclot', 15];
_veh addItemCargoGlobal ['ACE_morphine', 8];
_veh addItemCargoGlobal ['ACE_epinephrine', 8];
_veh addItemCargoGlobal ['ACE_splint', 10];

_veh addItemCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag', 15];
_veh addItemCargoGlobal ['rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red', 7];

_veh addItemCargoGlobal ['rhs_mag_m67', 10];
_veh addItemCargoGlobal ['rhs_mag_an_m8hc', 6];

_veh addBackpackCargoGlobal ['csog_p53', 1];

_veh removeMagazineTurret ["rhs_mag_30x113mm_M789_HEDP_1200", [0]];
_veh addMagazineTurret ["rhs_mag_30x113mm_M789_HEDP_1200", [0], 600];
_veh removeMagazineTurret ["240Rnd_CMFlare_Chaff_Magazine", [-1]];
_veh addMagazineTurret ["240Rnd_CMFlare_Chaff_Magazine", [-1], 480];
