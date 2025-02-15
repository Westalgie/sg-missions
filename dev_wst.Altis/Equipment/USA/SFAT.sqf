_unit addWeapon "rhs_weap_mk18_d";
_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552_d";
_unit addPrimaryWeaponItem "mkk_hlc_muzzle_556NATO_rotexiiic_tan";
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_Mk262_PMAG_Tan";

_unit addWeapon "rhs_weap_M136";

_unit forceAddUniform 'tfa_uniforms_g2_mc1_0';

_unit addVest "tfa_cpc_Fastbelt_mc_US1";
for '_i' from 1 to 6 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_Mk262_PMAG_Tan';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_an_m8hc';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack "B_AssaultPack_mcamo";

_unit addGoggles (selectRandom ['PBW_shemagh_beige', 'rhsusf_shemagh_gogg_tan', 'rhsusf_shemagh2_gogg_tan']);
_unit addHeadgear (selectRandom ['rhsusf_opscore_ut_pelt', 'rhsusf_opscore_ut_pelt_nsw_cam']);

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";