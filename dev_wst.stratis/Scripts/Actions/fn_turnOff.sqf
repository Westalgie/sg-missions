if (hasInterface && (side player == west)) then {
    {
        [
            _x # 0,
            "Выключить ретранслятор",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
            "(_this distance _target < 3) and (!(_target getVariable 'turnedOff'))",
            "(_caller distance _target < 3) and (!(_target getVariable 'turnedOff'))",
            {},
            {},
            {
                _target setVariable ["turnedOff", true, true];
                [_target, ["switchposition", 0]] remoteExec ["animateSource", [0, -2] select isDedicated, true];  
                [_target, ["power_1", 0]] remoteExec ["animateSource", [0, -2] select isDedicated, true];  
                [_target, ["power_2", 0]] remoteExec ["animateSource", [0, -2] select isDedicated, true];  
                [_target, ["light", 0]] remoteExec ["animateSource", [0, -2] select isDedicated, true];   
                hint str "Ретранслятор отключен";
            },
            {},
            [], 
            2,
            1,
            false,
            false
        ] call BIS_fnc_holdActionAdd;
    } forEach selectedButtons;
};