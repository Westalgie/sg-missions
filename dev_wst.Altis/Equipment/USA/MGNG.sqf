_unit addWeapon "rhs_weap_m249_light_S";
_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
_unit addPrimaryWeaponItem "rhsusf_acc_grip4_bipod";
_unit addPrimaryWeaponItem "rhsusf_100Rnd_556x45_mixed_soft_pouch";

_unit forceAddUniform "rhs_uniform_acu_oefcp";

_unit addVest selectRandom (["rhsusf_spcs_ucp_saw", "rhsusf_spcs_ocp_saw"]);
for '_i' from 1 to 2 do { _unit addItemToVest 'rhsusf_100Rnd_556x45_mixed_soft_pouch';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_an_m8hc';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack (selectRandom ["rhsusf_assault_eagleaiii_ucp", "rhsusf_assault_eagleaiii_ocp"]);
for '_i' from 1 to 2 do { _unit addItemToBackpack 'rhsusf_100Rnd_556x45_mixed_soft_pouch';};

_unit addHeadgear (selectRandom ["rhsusf_ach_helmet_ocp", "rhsusf_ach_helmet_ocp_alt", "rhsusf_ach_helmet_ucp", "rhsusf_ach_helmet_ucp_alt"]);

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";