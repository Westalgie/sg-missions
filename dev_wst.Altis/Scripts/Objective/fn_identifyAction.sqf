if (hasInterface) then {
    [
        bluCom,
        "Опознать",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
        "(_this distance _target < 5) and (side _this == east) and (!alive _target) and (!(missionNamespace getVariable 'isIdentified'))",
        "(_caller distance _target < 5) and (side _caller == east) and (!alive _target)",
        {},
        {},
        {
            params ["_target", "_caller"];
            missionNamespace setVariable ["isIdentified", true, true];
            hint "Цель опознана!";
        },
        {},
        [], 
        10,
        10 ,
        false,
        false
    ] call BIS_fnc_holdActionAdd;
};