if (hasInterface) then {
    [
        tank,
        "Заложить взрывчатку",
        "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
        "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",
        "(_this distance (getPosATL _target) < 5) and (side _this != west) and ('IEDUrbanBig_Remote_Mag' in (magazines _this)) and (alive _target) and (!(missionNamespace getVariable 'isChargePlanted'))",
        "(_caller distance (getPosATL _target) < 5) and (side _caller != west) and ('IEDUrbanBig_Remote_Mag' in (magazines _caller)) and (alive _target)",
        {},
        {},
        {
            params ["_target", "_caller"];
            missionNamespace setVariable ["isChargePlanted", true, true];
            hint "Взрывчатка установлена, в укрытие!";
            player removeMagazine "IEDUrbanBig_Remote_Mag";
            [_target, _caller] spawn {
                params ['_targetTank', '_attacker'];
                sleep ([6, 12] call BIS_fnc_randomInt);
                [tank, ["CustomAlarmSound", 500, 1, 0, 0, true]] remoteExec ["say3D", [0, -2] select isDedicated];
                sleep 6;
                _bomb = ("rhs_ammo_fab100" createVehicle getPosATL _targetTank);
                _bomb setdamage 1;
                sleep 0.1;
                [_targetTank, [1, true, _attacker, _attacker]] remoteExec ["setDamage", 2];
            };
        },
        {},
        [], 
        15,
        10 ,
        false,
        false
    ] call BIS_fnc_holdActionAdd;
};