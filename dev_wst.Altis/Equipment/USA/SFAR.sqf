_unit addWeapon "mkk_M249_light_S_Desert";
_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds_c";
_unit addPrimaryWeaponItem "mkk_hlc_muzzle_556NATO_rotexiiic_tan";
_unit addPrimaryWeaponItem "rhsusf_100Rnd_556x45_M995_soft_pouch_coyote";

_unit forceAddUniform 'tfa_uniforms_g2_mc1_0';

_unit addVest "tfa_cpc_weapons_mc_US1";
for '_i' from 1 to 1 do { _unit addItemToVest 'rhsusf_100Rnd_556x45_M995_soft_pouch_coyote';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_an_m8hc';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack "B_AssaultPack_mcamo";
for '_i' from 1 to 2 do { _unit addItemToBackpack 'rhsusf_100Rnd_556x45_M995_soft_pouch_coyote';};

_unit addGoggles (selectRandom ['PBW_shemagh_beige', 'rhsusf_shemagh_gogg_tan', 'rhsusf_shemagh2_gogg_tan']);
_unit addHeadgear (selectRandom ['rhsusf_opscore_ut_pelt', 'rhsusf_opscore_ut_pelt_nsw_cam']);

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";