_unit addWeapon 'rhsusf_weap_MP7A2';
_unit addPrimaryWeaponItem 'rhsusf_mag_40Rnd_46x30_FMJ';
_unit addPrimaryWeaponItem 'rhsusf_acc_mrds';

_unit forceAddUniform 'U_I_pilotCoveralls';
_unit addItemToUniform 'BWA3_M92_Multi';

_unit addVest 'VJ_Holster';
_unit addItemToVest 'rhsusf_mich_bare_norotos_arc';
for '_i' from 1 to 4 do { _unit addItemToVest 'rhsusf_mag_40Rnd_46x30_FMJ';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhssaf_mag_brd_m83_white';};

_unit addBackpack 'ACE_NonSteerableParachute';

_unit addHeadgear 'rhsusf_hgu56p_visor_mask_pink';

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
