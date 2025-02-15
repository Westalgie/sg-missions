_unit forceAddUniform "rhs_uniform_acu_ucp2";

_unit addVest "rhsusf_iotv_ucp";

_unit addBackpack "rhsusf_assault_eagleaiii_ucp";

_selected = selectRandom [["rhsusf_cvc_alt_helmet", "mkk_ess_blackclear"], ["rhsusf_cvc_ess", ""]];
_unit addHeadgear (_selected # 0);

if ((_selected # 1) != "") then {
    _unit addGoggles _selected # 1;
};