_unit addWeapon "rhs_weap_m240B";
_unit addPrimaryWeaponItem "rhsusf_acc_ELCAN";
_unit addPrimaryWeaponItem "rhsusf_100Rnd_762x51";

_unit forceAddUniform "rhs_uniform_acu_ucp2";

_unit addVest "rhsusf_iotv_ucp_SAW";
for '_i' from 1 to 1 do { _unit addItemToVest 'rhsusf_100Rnd_762x51';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_red';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack "rhsusf_assault_eagleaiii_ucp";
for '_i' from 1 to 2 do { _unit addItemToBackpack 'rhsusf_100Rnd_762x51';};

_selected = selectRandom [["rhsusf_ach_helmet_ucp", "mkk_ess_blackclear"], ["rhsusf_ach_helmet_ESS_ucp", ""]];
_unit addHeadgear (_selected # 0);

if ((_selected # 1) != "") then {
    _unit addGoggles _selected # 1;
};

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";