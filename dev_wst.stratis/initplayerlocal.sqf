if (!isDedicated) then {	
    waitUntil {!(isNull player)};
    player addEventHandler ["inventoryOpened","_nul=execVM 'script.sqf'"];
};

if (side player == east && a3a_var_started) then {
    _markerNames = ['Узел 19.0.3.1', 'Узел 19.0.3.2'];
    {
        _marker = _x # 1;
        _marker setMarkerColorLocal "ColorGreen";
        _marker setMarkerTextLocal (_markerNames # _foreachIndex);
    } forEach selectedButtons;
};

/*mkk_decoration_disable_insignia = true; // для кастомных "патчей" на форму
mkk_decoration_available_patches = [];
{
    if (side _x == west) then { // тут проверка на сторону, выдаст всем кто причислен к этой стороне
        [_x,"patch\xxx.paa"] call mkk_decoration_fnc_set_insignia; // путь к папке patch внутри папке с миссией, патчи делать в формате .paa
    };
} forEach playableUnits;*/