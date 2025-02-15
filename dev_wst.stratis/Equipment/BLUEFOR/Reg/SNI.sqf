_unit addWeapon 'rhs_weap_m24sws';
_unit addPrimaryWeaponItem 'rhsusf_acc_m24_muzzlehider_black';
_unit addPrimaryWeaponItem 'rhsusf_acc_harris_swivel';
_unit addPrimaryWeaponItem 'rhsusf_acc_M8541_low';
_unit addPrimaryWeaponItem 'rhsusf_5Rnd_762x51_m118_special_Mag';

_unit addWeapon 'rhsusf_weap_MP7A2_folded';
_unit addHandgunItem 'rhsusf_mag_40Rnd_46x30_FMJ';
_unit addHandgunItem 'rhsusf_acc_mrds';

_unit forceAddUniform (selectRandom ['BWA3_Uniform2_sleeves_Multi', 'BWA3_Uniform2_Multi']);
_unit addItemToUniform 'ACE_Kestrel4500';
_unit addItemToUniform 'ACE_RangeCard';

_unit addVest 'BWA3_Vest_Marksman_Multi';
for '_i' from 1 to 8 do { _unit addItemToVest 'rhsusf_5Rnd_762x51_m118_special_Mag';};
for '_i' from 1 to 4 do { _unit addItemToVest 'rhsusf_mag_40Rnd_46x30_FMJ';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhssaf_mag_brd_m83_white';};

_unit addBackpack 'BWA3_Kitbag_Multi';

_unit addHeadgear 'BWA3_M92_Multi';

_unit addGoggles (selectRandom ['armst_band_balaclava_3', 'armst_band_balaclava2_3']);

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
_unit addWeapon 'ACE_Vector';
