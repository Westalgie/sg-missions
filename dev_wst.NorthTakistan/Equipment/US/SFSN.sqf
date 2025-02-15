_unit addWeapon "rhs_weap_sr25_d";
_unit addPrimaryWeaponItem "rhsusf_acc_M8541_d";
_unit addPrimaryWeaponItem "rhsusf_acc_SR25S_d";
_unit addPrimaryWeaponItem "BWA3_bipod_Harris_tan";
_unit addPrimaryWeaponItem "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";

_unit forceAddUniform "LOP_U_ISTS_Fatigue_05";
_unit addItemToUniform "ACE_RangeCard";
_unit addItemToUniform "ACE_Kestrel4500";

_unit addVest "tfa_cpc_communicationsbelt_coy_empty";
for '_i' from 1 to 4 do { _unit addItemToVest 'rhsusf_20Rnd_762x51_SR25_m118_special_Mag';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhsusf_20Rnd_762x51_SR25_m62_Mag';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_red';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack "rhsusf_falconii_coy";

_unit addHeadgear "tfa_booniehat_coy";

_unit addGoggles "rhsusf_shemagh2_tan";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";

_unit addWeapon "ACE_Vector";