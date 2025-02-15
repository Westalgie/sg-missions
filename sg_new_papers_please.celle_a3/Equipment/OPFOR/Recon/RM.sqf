_unit addWeapon 'rhs_weap_ak74m_zenitco01_b33';
_unit addPrimaryWeaponItem 'vtn_optic_eotech_exps3_0b';
_unit addPrimaryWeaponItem 'nmg_silence_dtk_gexagonak';
_unit addPrimaryWeaponItem 'rhs_acc_grip_rk6';
_unit addPrimaryWeaponItem 'nmg_30Rnd_545x39_7N10_AK12';

_unit addWeapon 'rhs_weap_pya';
_unit addHandgunItem 'rhs_mag_9x19_7n31_17';

_unit forceAddUniform 'AGE_Fatigues_Short_BrownATACSFG';
for '_i' from 1 to 3 do { _unit addItemToUniform 'rhs_mag_9x19_7n31_17';};

_unit addVest 'AGE_TV110_AK_MultiCam';
for '_i' from 1 to 6 do { _unit addItemToVest 'nmg_30Rnd_545x39_7N10_AK12';};
for '_i' from 1 to 2 do { _unit addItemToVest 'nmg_30Rnd_545x39_7T3M_AK12';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_m67';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhssaf_mag_brd_m83_white';};

_unit addBackpack 'B_AssaultPack_rgr';

_headgear = selectRandomWeighted [['ACM_szavb_R_6B47_6B50', 'YuEBalaklava4a'], 0.5, ['ACM_szavb_R_6B47_Patchless', 'YuEBalaklava4aEss'], 0.5];
_unit addHeadgear _headgear # 0;
_unit addGoggles _headgear # 1;

_unit linkItem 'ItemMap';
_unit linkItem 'ItemCompass';
_unit linkItem 'ItemWatch';
_unit linkItem 'ItemRadio';
_unit linkItem 'ItemGPS';
_unit addWeapon 'mkk_B8_Binocular';
