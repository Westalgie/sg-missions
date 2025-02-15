_unit addWeapon "mkk_VTN_PKMN_1974";
_unit addPrimaryWeaponItem "mkk_VTN_MUZZLE_FLASHSUPRESSOR_PKM2";
_unit addPrimaryWeaponItem "rhs_acc_1p78";
_unit addPrimaryWeaponItem "rhs_100Rnd_762x54mmR_7N13";

_unit forceAddUniform "LOP_U_TKA_Fatigue_02";

_unit addVest "LOP_V_6B23_Rifleman_OLV";
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_100Rnd_762x54mmR_7N13';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};

_unit addBackpack "rhs_sidor";
for '_i' from 1 to 2 do { _unit addItemToBackpack 'rhs_100Rnd_762x54mmR_7N13';};

_unit addHeadgear "rhs_ssh68_2";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";