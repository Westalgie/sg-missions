_unit addWeapon "mkk_m16a2_gl";
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_unit addPrimaryWeaponItem "rhs_mag_M441_HE";

// _unit forceAddUniform (selectRandom ["LOP_U_AM_Fatigue_02_3", "LOP_U_AM_Fatigue_02_4", "LOP_U_AM_Fatigue_04_6", "LOP_U_AM_Fatigue_04_4", "LOP_U_AM_Fatigue_04_3"]);
_unit forceAddUniform (selectRandom ["LOP_U_AM_Fatigue_03_6", "LOP_U_AM_Fatigue_03_4", "LOP_U_AM_Fatigue_03_2", "LOP_U_AM_Fatigue_03_5"]);

_unit addVest "rhs_belt_sks";
for '_i' from 1 to 6 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_Stanag';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_f1';};

_unit addBackpack "mkk_RD54_mr3000_old";

_unit addGoggles (selectRandom ["TRYK_Beard_BW", "TRYK_Beard_BK", "TRYK_Beard_BW2", "TRYK_Beard_BK2", "TRYK_Beard_BW3", "TRYK_Beard_BK3", "TRYK_Beard_BW4", "TRYK_Beard_BK4"]);
_unit addHeadgear "LOP_H_Turban_mask";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";