_unit addWeapon "rhs_weap_m240B";
_unit addPrimaryWeaponItem "rhsusf_acc_ELCAN";
_unit addPrimaryWeaponItem "rhsusf_100Rnd_762x51_m80a1epr";

_unit forceAddUniform "rhs_uniform_acu_oefcp";

_unit addVest "rhsusf_spcs_ocp_machinegunner";
for '_i' from 1 to 1 do { _unit addItemToVest 'rhsusf_100Rnd_762x51_m80a1epr';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_an_m8hc';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
for '_i' from 1 to 2 do { _unit addItemToBackpack 'rhsusf_100Rnd_762x51_m80a1epr';};

_unit addHeadgear (selectRandom ["rhsusf_ach_helmet_ocp", "rhsusf_ach_helmet_ocp_alt", "rhsusf_ach_helmet_headset_ocp", "rhsusf_ach_helmet_headset_ocp_alt"]);
_unit addGoggles (selectRandom ["rhsusf_shemagh_tan", "rhsusf_shemagh2_tan", "rhsusf_shemagh_gogg_tan", "mkk_ess_blackclear"]);

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";