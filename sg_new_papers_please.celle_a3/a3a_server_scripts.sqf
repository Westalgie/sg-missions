//Сюда вставляем скрипты, которые должны обрабатываться сервером
missionNamespace setVariable ["recorderRetreaved", false, true];
missionNamespace setVariable ["isCombatAirFrozen", true, true];

//Скрипт на завершение миссии по времени (модуль не нужен)
[] spawn { 
	waitUntil { sleep 3; a3a_var_started}; 
	_missionEndTime = diag_tickTime + 90 * 60;
	while {isNil "srv_triggerFinished"} do { 
		if (diag_tickTime > ((missionnamespace getVariable ["a3a_var_pausedtime", 0]) + _missionEndTime)) then { 
			srv_triggerFinished = true;
			["Время истекло. Ничья!", independent] call a3a_fnc_endMission;
		}; 
		sleep 1;
	};
};

//Скрипт на завершение миссии по потерям "<" - означает меньше
[] spawn {
	waitUntil {sleep 10; a3a_var_started};
	waitUntil
	{
		sleep 10;
		if (west countside playableUnits < 10) then {["Колечия понесла тяжелые потери и отступила. Слава Арстотцке!", east] call a3a_fnc_endMission;};
		if (east countside playableUnits < 10) then {["Арстотцка понесла тяжелые потери и отступила. За Колечию!", west] call a3a_fnc_endMission;};
		false
	};
};

[] spawn WST_fnc_endByObjective; // custom objective handler for mission ending