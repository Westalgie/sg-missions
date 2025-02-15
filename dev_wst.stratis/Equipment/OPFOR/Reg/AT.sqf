_unit addWeapon (selectRandom ['rhs_weap_ak74', 'rhs_weap_aks74']);
_unit addPrimaryWeaponItem 'rhs_acc_dtk1983';
_unit addPrimaryWeaponItem 'mkk_30Rnd_545x39_7N10_AK_bak';

_unit addWeapon 'vtn_rpg7v2_pg7v';
_unit addSecondaryWeaponItem 'vtn_optic_pgo7v3';
_unit addSecondaryWeaponItem 'vtn_pg7vl';

_unit forceAddUniform 'LOP_U_US_Fatigue_05';

_unit addVest (selectRandom ['gsb_rhs_22_6b45_rifleman', 'gsb_rhs_22_6b45_rifleman_2']);
for '_i' from 1 to 6 do { _unit addItemToVest 'mkk_30Rnd_545x39_7N10_AK_bak';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_30Rnd_545x39_AK_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};

_unit addBackpack 'rhs_rpg_6b3';
for '_i' from 1 to 1 do { _unit addItemToBackpack 'vtn_pg7vl';};
for '_i' from 1 to 2 do { _unit addItemToBackpack 'vtn_pg7vm';};
for '_i' from 1 to 2 do { _unit addItemToBackpack 'vtn_og7v';};

_unit addHeadgear 'gsb_rhs_22_kaska_k93';

if (selectRandom [true, false]) then {
    _unit addGoggles 'mkk_ess_blackclear';
};

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
