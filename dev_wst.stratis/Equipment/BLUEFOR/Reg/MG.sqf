_unit addWeapon 'rhs_weap_minimi_para_railed';
_unit addPrimaryWeaponItem 'rhsusf_acc_saw_bipod';
_unit addPrimaryWeaponItem 'rhsusf_acc_su230';
_unit addPrimaryWeaponItem 'rhsusf_200Rnd_556x45_box';

_unit forceAddUniform (selectRandom ['BWA3_Uniform2_sleeves_Multi', 'BWA3_Uniform2_Multi']);

_unit addVest 'BWA3_Vest_MachineGunner_Multi';
_unit addItemToVest 'rhsusf_200Rnd_556x45_box';
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhssaf_mag_brd_m83_white';};

_unit addBackpack 'BWA3_Kitbag_Multi';
for '_i' from 1 to 2 do { _unit addItemToBackpack 'rhsusf_200Rnd_556x45_box';};

_unit addHeadgear 'BWA3_M92_Multi';

_unit addGoggles (selectRandom ['armst_band_balaclava_3', 'armst_band_balaclava2_3']);

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
