_unit addWeapon "rhs_weap_m27iar_grip";
_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552_d";
_unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan";

_unit addWeapon "rhs_weap_smaw_green";
_Unit addSecondaryWeaponItem "rhs_weap_optic_smaw";
_unit addSecondaryWeaponItem "rhs_mag_smaw_HEDP";

_unit forceAddUniform "FROG_USMC_KyleGloves_6_w";

_unit addVest "JCA_MCRP_V_CarrierRigKBT_01_CQB_coyote_F";
for '_i' from 1 to 6 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_red';};
for '_i' from 1 to 1 do { _unit addItemToVest 'rhs_mag_m18_green';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};

_unit addBackpack "B_Kitbag_rgr";
for '_i' from 1 to 4 do { _unit addItemToBackpack "rhs_mag_smaw_SR"; };
for '_i' from 1 to 4 do { _unit addItemToBackpack "rhs_mag_smaw_HEDP"; };

_unit addHeadgear "LWH_Bowman_USMC_Preset_1_1";
if (selectRandom [true, false]) then {
    _unit addGoggles (selectRandom ["armst_band_balaclava2", "armst_band_balaclava"]);
};

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";