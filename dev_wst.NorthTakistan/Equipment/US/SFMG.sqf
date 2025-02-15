_unit addWeapon "mkk_M249_light_S_Desert";
_unit addPrimaryWeaponItem "rhsusf_acc_saw_lw_bipod";
_unit addPrimaryWeaponItem "BWA3_muzzle_snds_QDSS_tan";
_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552_d";
_unit addPrimaryWeaponItem "rhsusf_100Rnd_556x45_soft_pouch_coyote";

_unit forceAddUniform "LOP_U_ISTS_Fatigue_09";

_unit addVest "rhsusf_mbav_mg";
for '_i' from 1 to 1 do { _unit addItemToVest 'rhsusf_100Rnd_556x45_soft_pouch_coyote';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_red';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack "rhsusf_assault_eagleaiii_coy";
for '_i' from 1 to 2 do { _unit addItemToBackpack 'rhsusf_100Rnd_556x45_soft_pouch_coyote';};

_selected = selectRandom [["rhsusf_ach_bare_des_headset", "mkk_ess_blackclear"], ["rhsusf_ach_bare_semi_headset", "mkk_ess_blackclear"], ["rhsusf_ach_bare_des_headset_ess", "rhsusf_shemagh2_tan"], ["rhsusf_ach_bare_semi_headset_ess", "rhsusf_shemagh2_tan"]];
_unit addHeadgear (_selected # 0);

_unit addGoggles (_selected # 1);

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";