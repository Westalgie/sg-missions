_unit addWeapon 'mkk_hlc_rifle_auga2lsw';
_unit addPrimaryWeaponItem 'rhsusf_acc_eotech_552';
_unit addPrimaryWeaponItem 'mkk_42Rnd_556x45_mk262_AUG';

_unit forceAddUniform 'LOP_U_IRA_Fatigue_DPM_BSW';

_unit addVest 'LOP_V_CarrierRig_OLV';
for '_i' from 1 to 6 do { _unit addItemToVest 'mkk_42Rnd_556x45_mk262_AUG';};
for '_i' from 1 to 2 do { _unit addItemToVest 'mkk_42Rnd_556x45_m855a1_AUG';};
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
