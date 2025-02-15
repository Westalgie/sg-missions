_unit addWeapon "rhs_weap_m4a1_carryhandle_m203S";
_unit addPrimaryWeaponItem "rhsusf_acc_RX01";
_unit addPrimaryWeaponItem "rhsusf_acc_grip_m203_blk";
_unit addPrimaryWeaponItem "rhs_mag_M441_HE";
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull";

_unit forceAddUniform "LOP_U_ISTS_Fatigue_05";

_unit addVest "tfa_cpc_tlbelt_coy_US1";
for '_i' from 1 to 6 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_Stanag_Pull';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_Stanag_Ranger_Tracer_Red';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_red';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack "rhsusf_assault_eagleaiii_coy";
for '_i' from 1 to 10 do { _unit addItemToBackpack 'rhs_mag_M441_HE';};

_unit addHeadgear "rhsusf_ach_bare_tan_headset_ess";

_unit addGoggles "rhsusf_shemagh2_tan";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";