_unit addWeapon 'mkk_VTN_PKM_2';
_unit addPrimaryWeaponItem 'mkk_VTN_MUZZLE_FLASHSUPRESSOR_PKM1';
_unit addPrimaryWeaponItem 'rhs_100Rnd_762x54mmR_7N13';

_unit forceAddUniform 'LOP_U_US_Fatigue_05';

_unit addVest 'gsb_rhs_22_6b45_mg';
_unit addItemToVest 'rhs_100Rnd_762x54mmR_7N13';
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};

_unit addBackpack 'gsb_rhs_22_bp_carryall';
for '_i' from 1 to 2 do { _unit addItemToBackpack 'rhs_100Rnd_762x54mmR_7N13';};

_unit addHeadgear 'gsb_rhs_22_kaska_k93';

if (selectRandom [true, false]) then {
    _unit addGoggles 'mkk_ess_blackclear';
};

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
