[] call WST_fnc_identifyAction;

if (!isDedicated) then {	
    waitUntil {!(isNull player)};
    player addEventHandler ["inventoryOpened","_nul=execVM 'script.sqf'"];
    player createDiaryRecord ["diary", ["Формы сторон", loadFile "A3A_BRIEFING\briefing_UNIFORMS.html"]];
};

0 spawn {
    waitUntil { sleep 10; a3a_var_started; };
    {
        _x setMarkerAlphaLocal 0;
    } forEach ["reg_1", "reg_2", "lars_1", "lars_2", "heavy_1", "heavy_2"];
};