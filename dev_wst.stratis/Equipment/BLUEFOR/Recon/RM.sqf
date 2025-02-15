_unit addWeapon 'mkk_hlc_rifle_ACR_SBR_tan';
_unit addPrimaryWeaponItem 'rhsusf_acc_eotech_552_d';
_unit addPrimaryWeaponItem 'mkk_hlc_muzzle_556NATO_rotexiiic_tan';
_unit addPrimaryWeaponItem 'mkk_hlc_grip_AFG2';
_unit addPrimaryWeaponItem 'rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan';

_unit forceAddUniform 'LOP_U_ISTS_Fatigue_14';

_unit addVest 'tfa_cpc_weaponsbelt_mc_empty';
for '_i' from 1 to 6 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhssaf_mag_brd_m83_white';};

_unit addBackpack 'tfa_Fatpack_mc';

_unit addHeadgear 'rhsusf_mich_bare_norotos_arc_alt_tan';

_unit addGoggles 'rhsusf_shemagh2_gogg_tan';

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
_unit addWeapon 'Binocular';
