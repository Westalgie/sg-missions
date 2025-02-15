0 = execVM "Scripts\Premade\add_med.sqf"; //подключение скрипта выдачи медицины

if (!isDedicated) then {	
	waitUntil {!(isNull player)};
	player addEventHandler ["inventoryOpened","_nul=execVM 'Scripts\Premade\script.sqf'"];
};
if (!isDedicated) then {
	[] spawn {
		waitUntil {sleep 10; a3a_var_started};
		sleep 10;
		[[ 
			[[dayTime, "HH:MM"] call BIS_fnc_timeToString, "<t align = 'right' shadow = '1' size = '0.7' >%1</t><br/>"], 
			["Где-то к юго-западу от Грештина", "<t align = 'right' shadow = '1' size = '0.7'>%1</t><br/>"],
			["Papers, please", "<t align = 'right' shadow = '1' size = '0.7'>%1</t><br/>"],  
			["","<br/>"],
			["Solid Games", "<t align = 'right' shadow = '1' size = '1.0'font='PuristaBold'>%1</t>", 15]
		]] spawn BIS_fnc_typeText;
	};
};

[
	[
		opCom,
		[
			["opSpn1", "Альфа 3-2", false, "3 разведчика с подрывными зарядами. Розовая зона спавна", ["opAccessSpn"], []],
			["opSpn2", "Альфа 3-3", false, "3 разведчика с подрывными зарядами. Розовая зона спавна", ["opAccessSpn"], []],
			["opReg1", "Альфа 1-6", true, "Отделение управления на УАЗ-3151 (медицинский). Желтая зона спавна", ["opAccessReg"], []],
			["opReg2", "Альфа 2-1", true, "8 пехотинцев при поддержке БТР-80. Желтая зона спавна", ["opAccessReg"], []],
			["opReg3", "Альфа 2-2", true, "8 пехотинцев при поддержке БТР-80. Желтая зона спавна", ["opAccessReg"], []],
			["opReg4", "Альфа 2-3", true, "8 пехотинцев при поддержке БТР-80. Желтая зона спавна", ["opAccessReg"], []]
		]
	],
	[
		blCom,
		[
			["blSpn1", "Альфа 3-2", false, "3 разведчика с подрывными зарядами. Розовая зона спавна", ["blAccessSpn"], []],
			["blSpn2", "Альфа 3-3", false, "3 разведчика с подрывными зарядами. Розовая зона спавна", ["blAccessSpn"], []],
			["blReg1", "Альфа 1-6", true, "Отделение управления на Hilux (медицинский). Желтая зона спавна", ["blAccessReg"], []],
			["blReg2", "Альфа 2-1", true, "8 пехотинцев на M1220. Желтая зона спавна", ["blAccessReg"], []],
			["blReg3", "Альфа 2-2", true, "8 пехотинцев на M1220. Желтая зона спавна", ["blAccessReg"], []],
			["blReg3", "Альфа 2-3", true, "8 пехотинцев на M1220. Желтая зона спавна", ["blAccessReg"], []]
		]
	]
] execVM "Scripts\Premade\fnc_kik_spawnChoice.sqf";

if (isServer) then {
	waitUntil {sleep 1; a3a_var_started};
	[] call WST_fnc_uavCrash;
};

if (isServer) then {
    ["ace_cargoLoaded", {
        params ["_item", "_vehicle"];
        if (_item getVariable ["isObjective", false]) then {
			_vehicle setVariable ["vehicleWithObjective", true, true];
            _vehicle setVariable ["objectivesCount", (_vehicle getVariable ["objectivesCount", 0]) + 1, true];
        };
    }] call CBA_fnc_addEventHandler;
    ["ace_cargoUnloaded", {
        params ["_item", "_vehicle"];
        if (_item getVariable ["isObjective", false]) then {
            _vehicle setVariable ["objectivesCount", (_vehicle getVariable ["objectivesCount", 0]) - 1, true];
			if ((_vehicle getVariable "objectivesCount") == 0) then {
			_vehicle setVariable ["vehicleWithObjective", false, true];
			};
        };
    }] call CBA_fnc_addEventHandler;
}; // Ace load/unload event handler for objective state. Taken from project astra by Fighter, script author BepTyxau?, adapted

if (isServer) then {
	waitUntil {sleep 100; a3a_var_started};
	{_x addMPEventHandler ["MPKilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		if (isServer) then {
			if ((_unit getVariable ["vehicleWithObjective", false]) == true) then {
				for "_i" from 1 to (_unit getVariable "objectivesCount") do {
					[getPos _unit] call WST_fnc_createFlightRecorder;
				};
			};
		};
	}]} forEach vehicles;
}; // Handling vehicle with objective destruction event. Taken from project astra by Fighter, script author BepTyxau?, adapted