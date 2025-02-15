_unit addWeapon 'mkk_VTN_SVD_TUNED';
_unit addPrimaryWeaponItem 'rhs_acc_dh520x56';
_unit addPrimaryWeaponItem 'rhs_acc_harris_swivel';
_unit addPrimaryWeaponItem 'rhs_10Rnd_762x54mmR_7N14';

_unit forceAddUniform 'mkk_kzs_gorka';
_unit addItemToUniform 'ACE_RangeCard';

_unit addVest 'BG_Defender2SAKVOa';
for '_i' from 1 to 8 do { _unit addItemToVest 'rhs_10Rnd_762x54mmR_7N14';};
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
_unit addWeapon 'rhs_pdu4';
