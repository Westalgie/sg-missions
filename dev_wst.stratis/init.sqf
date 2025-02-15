// ARMA3.RU Mission Template
enableSaving [false, false]; // Не надо ничего сейвить, мы ж не в сингл играем
0 = execVM "Scripts\Premade\add_med.sqf"; // Дадим немножко медицины и беруши
setTerrainGrid 3.125; // Красивая отрисовка земли вдали

// Init modules
#include "a3a_modules.hpp"
{
	[] execVM "A3A_MODULES\" + _x + "\init.sqf";
} forEach A3A_MODULES;

if (isServer) then
{
	[] execVM "Scripts\Premade\time.sqf"; // таймер не модулем, а скриптом
    [] call WST_fnc_createObjective;
    [] call WST_fnc_initPylonsManager;
};

[] call compile preprocessFileLineNumbers "bn_selector\init_selector.sqf";

if (!isDedicated) then
{
    [] spawn {
	    waitUntil {sleep 10; a3a_var_started};
        [[ 
            ["Impor Strikes Back, ", "<t align = 'right' shadow = '1' size = '0.7' >%1</t>"], 
            ["Остров Чисашима", "<t align = 'right' shadow = '1' size = '0.7'>%1</t><br/>"],
            [[dayTime, "HH:MM"] call BIS_fnc_timeToString, "<t align = 'right' shadow = '1' size = '0.7'>%1</t><br/>"],  
            ["","<br/>"], // line break
            ["Solid Games", "<t align = 'right' shadow = '1' size = '1.0'font='PuristaBold'>%1</t>", 15] 
        ]] spawn BIS_fnc_typeText;
        _markerNames = ['19.0.3.1', '19.0.3.2'];
        {
            _marker = _x # 1;
            [_marker, "ColorGreen"] remoteExec ["setMarkerColorLocal", east, true];
            [_marker, (_markerNames # _foreachIndex)] remoteExec ["setMarkerTextLocal", east, true];
        } forEach selectedButtons;
    };
};

