_unit addWeapon 'rhs_weap_m21s';
_unit addPrimaryWeaponItem 'rhsgref_30rnd_556x45_m21_t';

_unit forceAddUniform 'LOP_U_IRA_Fatigue_DPM_BSW';

_unit addVest 'LOP_V_CarrierLite_OLV';
for '_i' from 1 to 4 do { _unit addItemToVest 'rhsgref_30rnd_556x45_m21_t';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhssaf_mag_brd_m83_white';};

_unit addBackpack 'UK3CB_BAF_B_Bergen_OLI_Rifleman_A';
_unit addItemToBackpack 'rhsusf_mich_bare_norotos_arc';

_headgear = selectRandomWeighted [['YuEBalaklava4blEss', 'rhsusf_cvc_green_alt_helmet'], 0.5, ['YuEBalaklava4bl', 'rhsusf_cvc_green_ess'], 0.5];
_unit addHeadgear (_headgear # 1);
_unit addGoggles (_headgear # 0);

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
_unit addWeapon 'Binocular';
