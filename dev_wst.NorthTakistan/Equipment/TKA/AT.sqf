_unit addWeapon "rhs_weap_ak74";
_unit addPrimaryWeaponItem "mkk_30Rnd_545x39_7N10_AK_bak";

_unit addWeapon "vtn_rpg7v2_pg7v";
_unit addSecondaryWeaponItem "vtn_optic_pgo7v3";
_unit addSecondaryWeaponItem "vtn_pg7vl";

_unit forceAddUniform "LOP_U_TKA_Fatigue_02";

_unit addVest "LOP_V_6B23_6Sh92_OLV";
for '_i' from 1 to 6 do { _unit addItemToVest 'mkk_30Rnd_545x39_7N10_AK_bak';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_30Rnd_545x39_AK_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};

_unit addBackpack "rhs_rpg_6b2";
for '_i' from 1 to 2 do { _unit addItemToBackpack 'vtn_pg7vm';};
for '_i' from 1 to 2 do { _unit addItemToBackpack 'vtn_pg7vl';};

_unit addHeadgear "rhs_ssh68_2";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";