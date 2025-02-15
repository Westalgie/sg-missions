_unit addWeapon "rhs_weap_m4a1_carryhandle";
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";

_unit forceAddUniform "rhs_uniform_acu_ucp2";

_unit addVest "rhsusf_iotv_ucp";
for '_i' from 1 to 4 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_Stanag';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_red';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack "tf_rt1523g_big_ucp_RETRO";

_unit addHeadgear (selectRandom [
    "rhsusf_hgu56p_black",
    "rhsusf_hgu56p_mask_black",
    "rhsusf_hgu56p_visor_black",
    "rhsusf_hgu56p_green",
    "rhsusf_hgu56p_mask_green",
    "rhsusf_hgu56p_visor_green",
    "rhsusf_hgu56p_visor_mask_green",
    "rhsusf_hgu56p",
    "rhsusf_hgu56p_mask",
    "rhsusf_hgu56p_tan",
    "rhsusf_hgu56p_visor_tan"
]);

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";