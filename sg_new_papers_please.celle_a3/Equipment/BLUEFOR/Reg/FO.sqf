_unit addWeapon 'rhs_weap_m21a_pr';
_unit addPrimaryWeaponItem 'rhsusf_acc_ACOG';
_unit addPrimaryWeaponItem 'rhsgref_30rnd_556x45_m21_t';

_unit forceAddUniform 'LOP_U_IRA_Fatigue_DPM_BSW';

_unit addVest 'LOP_V_CarrierRig_OLV';
for '_i' from 1 to 6 do { _unit addItemToVest 'rhsgref_30rnd_556x45_m21_t';};
for '_i' from 1 to 2 do { _unit addItemToVest 'mkk_30rnd_556x45_m856_m21';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhssaf_mag_brd_m83_white';};

_unit addBackpack 'UK3CB_BAF_B_Bergen_OLI_Rifleman_A';

_unit addHeadgear 'rhsusf_mich_bare_norotos_arc';
_goggles = ['armst_band_balaclava', 0.8, 'armst_band_balaclava2', 0,3];
_unit addGoggles selectRandomWeighted _goggles;

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
_unit addWeapon 'Binocular';
