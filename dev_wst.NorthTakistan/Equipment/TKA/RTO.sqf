_unit addWeapon "rhs_weap_ak74m";
_unit addPrimaryWeaponItem "rhs_30Rnd_545x39_7N10_AK";

_unit forceAddUniform "LOP_U_TKA_Fatigue_02";

_unit addVest "LOP_V_6B23_6Sh92_OLV";
for '_i' from 1 to 6 do { _unit addItemToVest 'rhs_30Rnd_545x39_7N10_AK';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_30Rnd_545x39_AK_plum_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};

_unit addBackpack "mkk_anarc164_red";

_unit addHeadgear "rhs_ssh68_2";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";