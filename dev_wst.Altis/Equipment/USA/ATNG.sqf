_unit addWeapon "rhs_weap_m4a1_carryhandle";
_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
_unit addPrimaryWeaponItem "rhsusf_acc_kac_grip";
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";

_unit addWeapon "rhs_weap_maaws";
_Unit addSecondaryWeaponItem "rhs_optic_maaws";
_unit addSecondaryWeaponItem "rhs_mag_maaws_HEAT";

_unit forceAddUniform "rhs_uniform_acu_oefcp";

_unit addVest (selectRandom ["rhsusf_spcs_ucp_rifleman_alt", "rhsusf_spcs_ocp_rifleman_alt"]);
for '_i' from 1 to 6 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_Stanag';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_an_m8hc';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack (selectRandom ["rhsusf_assault_eagleaiii_ucp", "rhsusf_assault_eagleaiii_ocp"]);
_unit addItemToBackpack "rhs_mag_maaws_HEAT";
_unit addItemToBackpack "rhs_mag_maaws_HEDP";

_unit addHeadgear (selectRandom ["rhsusf_ach_helmet_ocp", "rhsusf_ach_helmet_ocp_alt", "rhsusf_ach_helmet_ucp", "rhsusf_ach_helmet_ucp_alt"]);

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";