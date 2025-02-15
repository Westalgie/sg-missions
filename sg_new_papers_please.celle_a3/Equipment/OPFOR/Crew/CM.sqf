_unit addWeapon 'rhs_weap_aks74u';
_unit addPrimaryWeaponItem 'rhs_acc_pgs64_74un';
_unit addPrimaryWeaponItem 'mkk_30Rnd_545x39_7N10_AK_bak';

_unit forceAddUniform 'mkk_kzs_gorka_rukav';

_unit addVest 'rhs_6b2_chicom';
for '_i' from 1 to 4 do { _unit addItemToVest 'mkk_30Rnd_545x39_7N10_AK_bak';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};

_unit addBackpack 'rhs_rk_sht_30_emr';
_unit addItemToBackpack 'rhs_6b27m_green';

_headgear = selectRandomWeighted ['rhs_tsh4_ess_bala', 0.5, 'rhs_tsh4_bala', 0.5];
_unit addHeadgear _headgear;

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
