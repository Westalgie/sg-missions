[] call WST_fnc_attachExplosive;
if (!isDedicated) then {	
    waitUntil {!(isNull player)};
    player addEventHandler ["inventoryOpened","_nul=execVM 'script.sqf'"];
    0 spawn {
        sleep 5;
        setAperture 3;
    };
    player createDiaryRecord ["diary", ["Формы сторон", loadFile "A3A_BRIEFING\briefing_UNIFORMS.html"]];
    player createDiaryRecord ["diary", ["Технические особенности", loadFile "A3A_BRIEFING\briefing_TECH.html"]];
    if (side player == independent) then {
        player createDiaryRecord ["diary", ["Задачи", loadFile "A3A_BRIEFING\briefing_INDEP_TASKS.html"]];
        player createDiaryRecord ["diary", ["Противник", loadFile "A3A_BRIEFING\briefing_OPFOR_ENEMY.html"]];
    };
};