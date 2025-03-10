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
            ["Civil War", "<t align = 'right' shadow = '1' size = '0.7'>%1</t><br/>"],  
            ["","<br/>"], // line break
            ["Solid Games", "<t align = 'right' shadow = '1' size = '1.0'font='PuristaBold'>%1</t>", 15] 
            ] 
        ] spawn BIS_fnc_typeText;
    };
};

[
	[
		opCom,
		[
			["lars_group_2", "Альфа 3-1 и Альфа 3-2", true, "12 разведчиков на LAV-25A2. Оранжевые зоны спавна", ["lars_1", "lars_2"], []],
			["lars_group_1", "Альфа 2-5 и Альфа 2-6", true, "12 разведчиков на LAV-25A2. Оранжевые зоны спавна", ["lars_1", "lars_2"], []],
			["battle_group_3", "Альфа 1-6, Альфа 2-2, Альфа 2-4", true, "Отделение пехоты USMC + 1x ПЗРК + Weapon Squad + Assault Section. Желтая зона спавна", ["reg_1", "reg_2"], []],
			["battle_group_2", "Альфа 1-5, Альфа 2-1, Альфа 2-3", true, "Отделение пехоты USMC + 1x ПЗРК + Weapon Squad + Assault Section. Желтая зона спавна", ["reg_1", "reg_2"], []],
			["battle_group_1", "Альфа 1-3 и Альфа 1-4", true, "2 отделения пехоты USMC. Желтые зоны спавна", ["reg_1", "reg_2"], []],
			["hq_group", "Альфа 1-1 и Альфа 1-2", true, "Отделение КСа и взводное отделение USMC c HMMWV TOW. Розовые зоны спавна", ["com_1", "com_2"], []]
		]
	]
] execVM "Scripts\Premade\fnc_kik_spawnChoice.sqf";