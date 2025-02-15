_unit addWeapon 'mkk_hlc_rifle_ACR68_full_tan';
_unit addPrimaryWeaponItem 'BWA3_optic_PMII_ShortdotCC';
_unit addPrimaryWeaponItem 'rhsusf_acc_aac_762sdn6_silencer';
_unit addPrimaryWeaponItem 'BWA3_bipod_Harris_tan';
_unit addPrimaryWeaponItem 'mkk_hlc_30rnd_68x43_FMJ';

_unit forceAddUniform 'LOP_U_ISTS_Fatigue_14';
_unit addItemToUniform 'ACE_Kestrel4500';
_unit addItemToUniform 'ACE_RangeCard';

_unit addVest 'tfa_cpc_Fastbelt_mc_empty';
for '_i' from 1 to 6 do { _unit addItemToVest 'mkk_hlc_30rnd_68x43_FMJ';};
for '_i' from 1 to 2 do { _unit addItemToVest 'mkk_hlc_30rnd_68x43_Tracer';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhssaf_mag_brd_m83_white';};

_unit addBackpack 'tfa_Fatpack_mc';

_unit addHeadgear 'rhsusf_mich_bare_norotos_arc_alt_tan';

_unit addGoggles 'rhsusf_shemagh2_gogg_tan';

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
_unit addWeapon 'ACE_Vector';
