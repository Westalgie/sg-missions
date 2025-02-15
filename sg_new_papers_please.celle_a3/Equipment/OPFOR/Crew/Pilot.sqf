_unit addWeapon 'rhs_weap_aks74u';
_unit addPrimaryWeaponItem 'rhs_acc_pgs64_74un';
_unit addPrimaryWeaponItem 'mkk_30Rnd_545x39_7N10_AK_bak';

_unit addWeapon 'rhs_weap_makarov_pm';
_unit addHandgunItem 'rhs_mag_9x18_8_57N181S';

_unit forceAddUniform 'mkk_kzs_gorka_rukav';
for '_i' from 1 to 3 do { _unit addItemToUniform 'rhs_mag_9x18_8_57N181S';};

_unit addVest 'rhs_6b2_chicom';
_unit addItemToVest 'rhs_6b27m_green';
for '_i' from 1 to 4 do { _unit addItemToVest 'mkk_30Rnd_545x39_7N10_AK_bak';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};

_unit addBackpack 'B_Parachute';

_unit addHeadgear 'rhs_zsh7a_mike_green_alt';

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
