_unit addWeapon (selectRandom ['rhs_weap_ak74n', 'rhs_weap_aks74n']);
_unit addPrimaryWeaponItem 'rhs_acc_pkas';
_unit addPrimaryWeaponItem 'rhs_acc_dtk1983';
_unit addPrimaryWeaponItem 'mkk_30Rnd_545x39_7N10_AK_bak';

_unit forceAddUniform 'LOP_U_US_Fatigue_05';

_unit addVest (selectRandom ['gsb_rhs_22_6b45_rifleman', 'gsb_rhs_22_6b45_rifleman_2']);
for '_i' from 1 to 6 do { _unit addItemToVest 'mkk_30Rnd_545x39_7N10_AK_bak';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_30Rnd_545x39_AK_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};

_unit addBackpack 'gsb_rhs_22_bp_carryall';

_unit addHeadgear 'gsb_rhs_22_kaska_k93';

if (selectRandom [true, false]) then {
    _unit addGoggles 'rhsusf_shemagh2_od';
};

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit addWeapon 'mkk_B8_Binocular';
