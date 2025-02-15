_unit addWeapon "mkk_M110k1";
_unit addPrimaryWeaponItem "rhsusf_acc_M8541_d";
_unit addPrimaryWeaponItem "rhsgref_sdn6_suppressor";
_unit addPrimaryWeaponItem "BWA3_bipod_Harris_tan";
_unit addPrimaryWeaponItem "rhsusf_20Rnd_762x51_m993_Mag";

_unit forceAddUniform 'tfa_uniforms_g2_mc1_0';
_unit addItemToUniform 'ACE_RangeCard';
_unit addItemToUniform 'ACE_Kestrel4500';

_unit addVest "tfa_cpc_communicationsbelt_mc_empty";
for '_i' from 1 to 6 do { _unit addItemToVest 'rhsusf_20Rnd_762x51_m993_Mag';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhsusf_20Rnd_762x51_m62_Mag';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_an_m8hc';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack "B_AssaultPack_mcamo";

_unit addGoggles (selectRandom ['PBW_shemagh_beige', 'rhsusf_shemagh_gogg_tan', 'rhsusf_shemagh2_gogg_tan']);
_unit addHeadgear (selectRandom ['rhsusf_opscore_ut_pelt', 'rhsusf_opscore_ut_pelt_nsw_cam']);

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";

_unit addWeapon "ACE_Vector";