_unit addWeapon 'rhs_weap_ak74m_npz';
_unit addPrimaryWeaponItem 'mkc_optic_1p86';
_unit addPrimaryWeaponItem 'rhs_acc_dtk1983';
_unit addPrimaryWeaponItem 'rhs_30Rnd_545x39_7N10_AK';

_unit addWeapon 'rhs_weap_makarov_pm';
_unit addHandgunItem 'rhs_mag_9x18_8_57N181S';

_unit forceAddUniform 'mkk_kzs_gorka_rukav';
for '_i' from 1 to 3 do { _unit addItemToUniform 'rhs_mag_9x18_8_57N181S';};

_unit addVest 'BG_Defender2SAKOa';
for '_i' from 1 to 6 do { _unit addItemToVest 'rhs_30Rnd_545x39_7N10_AK';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_30Rnd_545x39_AK_plum_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};

_unit addBackpack 'tf_mr6000l_emr_RETRO';

_headgear = selectRandomWeighted [['rhs_6b27m_green', 'YuEBalaklava4oEss'], 0.5, ['rhs_6b27m_green_ess', 'YuEBalaklava4o'], 0.3, ['rhs_6b27m_green_ess', 'YuEBalaklava1o'], 0.2];
_unit addHeadgear _headgear # 0;
_unit addGoggles _headgear # 1;

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
_unit addWeapon 'mkk_B8_Binocular';
