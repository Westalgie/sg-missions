_unit addWeapon "rhs_weap_M107_d";
_unit addPrimaryWeaponItem "rhsusf_acc_M8541_d";
_unit addPrimaryWeaponItem "rhsusf_mag_10Rnd_STD_50BMG_M33";

_unit forceAddUniform "rhs_uniform_acu_ucp2";
_unit addItemToUniform "ACE_RangeCard";

_unit addVest "rhsusf_iotv_ucp_Rifleman";
for '_i' from 1 to 3 do { _unit addItemToVest 'rhsusf_mag_10Rnd_STD_50BMG_M33';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_red';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack "tf_rt1523g_big_ucp_RETRO";
(backpackContainer _unit) addWeaponWithAttachmentsCargoGlobal [["rhs_weap_m4a1_carryhandle","","","rhsusf_acc_compm4",["rhs_mag_30Rnd_556x45_M855A1_Stanag",30],[],"rhsusf_acc_kac_grip"], 1];
for '_i' from 1 to 3 do { _unit addItemToBackpack 'rhs_mag_30Rnd_556x45_M855A1_Stanag';};

_unit addHeadgear "rhs_Booniehat_ucp";
_unit addGoggles "rhsusf_shemagh2_od";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
_unit addWeapon "ACE_Vector";