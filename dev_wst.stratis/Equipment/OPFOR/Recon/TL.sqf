_unit addWeapon 'rhs_weap_ak105_zenitco01_b33';
_unit addPrimaryWeaponItem 'rhs_acc_tgpa';
_unit addPrimaryWeaponItem 'mkc_optic_1p86';
_unit addPrimaryWeaponItem 'rhs_acc_grip_rk6';
_unit addPrimaryWeaponItem 'rhs_30Rnd_545x39_7N22_AK';

_unit forceAddUniform 'LOP_U_PMC_Fatigue_01';

_unit addVest 'AGE_TV110_AK_MultiCam';
for '_i' from 1 to 8 do { _unit addItemToVest 'rhs_30Rnd_545x39_7N22_AK';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};

_unit addBackpack 'tfa_Fatpack_mc';
for '_i' from 1 to 8 do { _unit addItemToBackpack 'rhs_30Rnd_545x39_7N22_AK';};

_unit addHeadgear 'rhsusf_opscore_fg_pelt';

if (selectRandom [true, false]) then {
    _unit addGoggles 'rhsusf_shemagh2_od';
};

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
_unit addWeapon 'mkk_B8_Binocular';
