_unit addWeapon 'rhs_weap_rpk74m_npz';
_unit addPrimaryWeaponItem 'rhs_acc_1p87';
_unit addPrimaryWeaponItem 'rhs_acc_dtkrpk';
_unit addPrimaryWeaponItem 'rhs_45Rnd_545X39_7N10_AK';

_unit forceAddUniform 'mkk_kzs_gorka';

_unit addVest 'BG_Defender2SAKOa';
for '_i' from 1 to 6 do { _unit addItemToVest 'rhs_45Rnd_545X39_7N10_AK';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_45Rnd_545X39_AK_Green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};

_unit addBackpack 'rhs_rk_sht_30_emr';

_headgear = ['rhs_6b27m_green', 'YuEBalaklava4oEss'];
_unit addHeadgear _headgear # 0;
_unit addGoggles _headgear # 1;

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
