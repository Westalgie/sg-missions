_unit addWeapon 'rhs_weap_svdp';
_unit addPrimaryWeaponItem 'rhs_acc_pso1m2';
_unit addPrimaryWeaponItem 'rhs_10Rnd_762x54mmR_7N14';

_unit forceAddUniform 'LOP_U_US_Fatigue_05';

_unit addItemToUniform 'ACE_Kestrel4500';
_unit addItemToUniform 'ACE_RangeCard';

_unit addVest (selectRandom ['gsb_rhs_22_6b45_rifleman', 'gsb_rhs_22_6b45_rifleman_2']);
for '_i' from 1 to 8 do { _unit addItemToVest 'rhs_10Rnd_762x54mmR_7N14';};
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
_unit linkItem 'ItemGPS';
_unit addItem 'rhs_pdu4';
