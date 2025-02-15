enableSaving [false, false];
0 = execVM "Scripts\Premade\add_med.sqf";
setTerrainGrid 3.125;

#include "a3a_modules.hpp"
{
	[] execVM "A3A_MODULES\" + _x + "\init.sqf";
} forEach A3A_MODULES;

if (!isDedicated) then {
	[] spawn {
        waitUntil {sleep 10; a3a_var_started};
        [ 
            [ 
            [[dayTime, "HH:MM"] call BIS_fnc_timeToString, "<t align = 'right' shadow = '1' size = '0.7' >%1</t>"], 
            ["Северный Такистан", "<t align = 'right' shadow = '1' size = '0.7'>%1</t><br/>"],
            ["Raid", "<t align = 'right' shadow = '1' size = '0.7'>%1</t><br/>"],  
            ["","<br/>"], // line break
            ["Solid Games", "<t align = 'right' shadow = '1' size = '1.0'font='PuristaBold'>%1</t>", 15] 
            ] 
        ] spawn BIS_fnc_typeText;
    };
};

if (isServer) then {
    gnr setDir 5;
    0 spawn {
        sleep 1;
        gnr setDamage [1, false];
    };
    {
        tank setHitPointDamage [_x, 1, true];
    } forEach ["hitltrack", "hitrtrack"];
};