_unit addWeapon 'rhs_weap_hk416d145';
_unit addPrimaryWeaponItem 'rhsusf_acc_eotech_552';
_unit addPrimaryWeaponItem 'BWA3_muzzle_snds_QDSS';
_unit addPrimaryWeaponItem 'rhsusf_acc_grip2';
_unit addPrimaryWeaponItem 'rhs_mag_30Rnd_556x45_M855A1_PMAG';

_unit addWeapon 'rhsusf_weap_glock17g4';
_unit addHandgunItem 'rhsusf_mag_17Rnd_9x19_FMJ';

_unit forceAddUniform 'LOP_U_IRA_Fatigue_DPM';
for '_i' from 1 to 3 do { _unit addItemToUniform 'rhsusf_mag_17Rnd_9x19_FMJ';};

_unit addVest 'tfa_cpc_tlbelt_rngr_empty';
for '_i' from 1 to 6 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_PMAG';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhssaf_mag_brd_m83_white';};

_unit addBackpack 'tf_rt1523g_bwmod';

_unit addHeadgear 'rhsusf_mich_bare_norotos_arc_alt';
_goggles = ['PBW_Balaclava_schwarz', 0.5, 'PBW_Balaclava_schwarzR', 0.5];
_unit addGoggles selectRandomWeighted _goggles;

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
_unit addWeapon 'ACE_Vector';
