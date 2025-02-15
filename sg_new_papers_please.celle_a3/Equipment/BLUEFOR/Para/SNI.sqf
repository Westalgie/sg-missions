_unit addWeapon 'rhs_weap_sr25_ec';
_unit addPrimaryWeaponItem 'rhsusf_acc_LEUPOLDMK4';
_unit addPrimaryWeaponItem 'rhsusf_acc_harris_bipod';
_unit addPrimaryWeaponItem 'rhsusf_20Rnd_762x51_SR25_m993_Mag';

_unit forceAddUniform 'LOP_U_IRA_Fatigue_DPM_BSW';
_unit addItemToUniform 'ACE_RangeCard';

_unit addVest 'LOP_V_CarrierRig_OLV';
for '_i' from 1 to 8 do { _unit addItemToVest 'rhsusf_20Rnd_762x51_SR25_m993_Mag';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhssaf_mag_brd_m83_white';};

_unit addBackpack 'UK3CB_BAF_B_Bergen_OLI_Rifleman_A';

_unit addHeadgear 'rhsusf_mich_bare_norotos_arc';
_unit addGoggles 'YuEBalaklava4blEss';

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
_unit addWeapon 'ACE_Vector';
