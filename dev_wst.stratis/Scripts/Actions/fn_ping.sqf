if (hasInterface) then {
    [
        terminal,
        "ping 19.0.3.1",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
        "(_this distance _target < 2.5) and !(missionNamespace getVariable 'objectiveComplete') and (missionNamespace getVariable 'pingAvailable')",
        "(_caller distance _target < 2.5) and !(missionNamespace getVariable 'objectiveComplete')",
        {
            terminal setObjectTextureGlobal [1, "Images\ping\pingInit_co.paa"];
        },
        {},
        {
            missionNamespace setVariable ['pingAvailable', false, true];
            isFail = selectedButtons # 0 # 0 getVariable 'turnedOff';
            [1, isFail] call WST_fnc_updateTerminalScreen;
        },
        {
            missionNamespace setVariable ['pingAvailable', true, true];
        },
        [], 
        2,
        2,
        false,
        false
    ] call BIS_fnc_holdActionAdd;
    [
        terminal,
        "ping 19.0.3.2",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
        "(_this distance _target < 2.5) and !(missionNamespace getVariable 'objectiveComplete') and (missionNamespace getVariable 'pingAvailable')",
        "(_caller distance _target < 2.5) and !(missionNamespace getVariable 'objectiveComplete')",
        {
            terminal setObjectTextureGlobal [3, "Images\ping\pingInit_co.paa"];
        },
        {},
        {
            missionNamespace setVariable ['pingAvailable', false, true];
            isFail = selectedButtons # 1 # 0 getVariable 'turnedOff';
            [3, isFail] call WST_fnc_updateTerminalScreen;
        },
        {
            missionNamespace setVariable ['pingAvailable', true, true];
        },
        [], 
        2,
        1,
        false,
        false
    ] call BIS_fnc_holdActionAdd;
};