_unit addWeapon "rhs_weap_sr25_d";
_unit addPrimaryWeaponItem "rhsusf_acc_SR25S_d";
_unit addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4_d";
_unit addPrimaryWeaponItem "BWA3_bipod_Harris_tan";
_unit addPrimaryWeaponItem "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";

_unit forceAddUniform "rhs_uniform_acu_ucp2";
_unit addItemToUniform "ACE_RangeCard";

_unit addVest "rhsusf_iotv_ucp_Rifleman";
for '_i' from 1 to 5 do { _unit addItemToVest 'rhsusf_20Rnd_762x51_SR25_m118_special_Mag';};
for '_i' from 1 to 3 do { _unit addItemToVest 'rhsusf_20Rnd_762x51_SR25_m62_Mag';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_red';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack "rhsusf_assault_eagleaiii_ucp";

_unit addHeadgear "rhs_Booniehat_ucp";
_unit addGoggles "rhsusf_shemagh2_od";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
_unit addWeapon "ACE_Vector";