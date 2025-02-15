_unit addWeapon 'mkk_hlc_rifle_hk33a2RIS';
_unit addPrimaryWeaponItem 'rhsusf_acc_SF3P556';
_unit addPrimaryWeaponItem 'rhsusf_acc_su230';
_unit addPrimaryWeaponItem 'mkk_hlc_30rnd_556x45_EPR_HK33';

_unit forceAddUniform (selectRandom ['BWA3_Uniform2_sleeves_Multi', 'BWA3_Uniform2_Multi']);

_unit addVest 'BWA3_Vest_Leader_Multi';
for '_i' from 1 to 6 do { _unit addItemToVest 'mkk_hlc_30rnd_556x45_EPR_HK33';};
for '_i' from 1 to 2 do { _unit addItemToVest 'mkk_hlc_30rnd_556x45_t_HK33';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhssaf_mag_brd_m83_white';};

_unit addBackpack 'mkk_mr3000_bwmod_blue';

_unit addHeadgear 'BWA3_M92_Multi';

_unit addGoggles (selectRandom ['armst_band_balaclava_3', 'armst_band_balaclava2_3']);

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
_unit addWeapon 'Binocular';
