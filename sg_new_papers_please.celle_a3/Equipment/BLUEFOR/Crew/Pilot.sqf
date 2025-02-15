_unit addWeapon 'mkk_hlc_smg_MP5N';
_unit addPrimaryWeaponItem 'mkk_hlc_30Rnd_9x19_B_MP5';

_unit addWeapon 'rhsusf_weap_m9';
_unit addHandgunItem 'rhsusf_mag_15Rnd_9x19_FMJ';

_unit forceAddUniform 'U_I_pilotCoveralls';
for '_i' from 1 to 3 do { _unit addItemToUniform 'rhsusf_mag_15Rnd_9x19_FMJ';};

_unit addVest 'VJ_Holster';
_unit addItemToVest 'rhsusf_mich_bare_norotos_arc';
for '_i' from 1 to 4 do { _unit addItemToVest 'mkk_hlc_30Rnd_9x19_B_MP5';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhssaf_mag_brd_m83_white';};

_unit addBackpack 'B_Parachute';

_unit addHeadgear 'rhsusf_hgu56p_visor_mask_green';

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
