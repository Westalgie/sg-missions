_unit addWeapon 'rhs_weap_svdp';
_unit addPrimaryWeaponItem 'rhs_acc_pso1m2';
_unit addPrimaryWeaponItem 'rhs_10Rnd_762x54mmR_7N14';

_unit forceAddUniform 'mkk_kzs_gorka_rukav';

_unit addVest 'BG_Defender2SSVDOa';
for '_i' from 1 to 8 do { _unit addItemToVest 'rhs_10Rnd_762x54mmR_7N14';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};

_unit addBackpack 'rhs_rk_sht_30_emr';

_headgear = selectRandomWeighted [['rhs_6b27m_green', 'YuEBalaklava4oEss'], 0.5, ['rhs_6b27m_green_ess', 'YuEBalaklava4o'], 0.3, ['rhs_6b27m_green_ess', 'YuEBalaklava1o'], 0.2];
_unit addHeadgear _headgear # 0;
_unit addGoggles _headgear # 1;

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
_unit addItem 'rhs_pdu4';
