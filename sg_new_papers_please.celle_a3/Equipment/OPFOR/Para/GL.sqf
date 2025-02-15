_unit addWeapon 'rhs_weap_ak74m_gp25_npz';
_unit addPrimaryWeaponItem 'rhs_acc_1p87';
_unit addPrimaryWeaponItem 'rhs_acc_dtk1';
_unit addPrimaryWeaponItem 'rhs_30Rnd_545x39_7N10_AK';
_unit addPrimaryWeaponItem 'rhs_VOG25';

_unit forceAddUniform 'mkk_kzs_gorka';

_unit addVest 'BG_Defender2SAKVOa';
for '_i' from 1 to 6 do { _unit addItemToVest 'rhs_30Rnd_545x39_7N10_AK';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_30Rnd_545x39_AK_plum_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};

_unit addBackpack 'rhs_rk_sht_30_emr';
for '_i' from 1 to 10 do { _unit addItemToBackpack 'rhs_VOG25';};

_headgear = ['rhs_6b27m_green', 'YuEBalaklava4oEss'];
_unit addHeadgear _headgear # 0;
_unit addGoggles _headgear # 1;

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
