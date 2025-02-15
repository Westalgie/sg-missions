// Серверные скрипты
// Выполняются после инициализации платформы
// Отличное место чтобы разместить какие-нибудь условия победы/поражения в миссии
// Например: waitUntil { sleep 1; a3a_var_started }; ["60 minutes have passed, NATO wins", 3600] spawn a3a_fnc_endMissionTimer;
// Или: waitUntil { sleep 1; a3a_var_started }; [[["marker1", "ZONE 1 NAME", 1, 1], ["marker2", "ZONE 2 NAME", 1, 1]], 0, true, "UNKNOWN"] spawn a3a_fnc_endMissionZonesCapture;

_missionTime = 110 * 60;

missionNamespace setVariable ["a3a_endMissionTime", _missionTime, true];
missionNamespace setVariable ['isChargePlanted', false, true];

CrititalLosesWest = 11; // потери для синих
CrititalLosesEast = 8; // потери для красных

_triggers = [trg_0, trg_1, trg_2];

[_missionTime, _triggers] spawn {
	params ["_missionTime", "_triggers"];
	waitUntil {sleep 10; a3a_var_started};
	while {isNil "srv_triggerFinished"} do { 
	sleep 10;
		if (mkk_platform_missionTime > missionNamespace getVariable ["a3a_endMissionTime", _missionTime]) then {
			srv_triggerFinished = true;
			sleep 10;
			["Время вышло, победа ТКА!", east] call a3a_fnc_endMission;
		};

		_opforUnitsInTrigger = count ([_triggers, east] call WST_fnc_countTriggerUnits);
		_bluforUnitsInTrigger = count ([_triggers, west] call WST_fnc_countTriggerUnits);
		_indepUnitsInTrigger = count ([_triggers, independent] call WST_fnc_countTriggerUnits);

		if ((_bluforUnitsInTrigger > 0) && ((_opforUnitsInTrigger + _indepUnitsInTrigger) < 2)) then {
			srv_triggerFinished = true;
			sleep 10;
			["Цель рейда достигнута, победа США!", west] call a3a_fnc_endMission;
		};

		if (((east countside playableUnits) + (independent countside playableUnits)) < CrititalLosesEast) then {
			srv_triggerFinished = true;
			sleep 10;
			["Силы ТКА в регионе разгромлены, победа США!!", west] call a3a_fnc_endMission;
		};
		
		if ((west countside playableUnits) < CrititalLosesWest) then {
			srv_triggerFinished = true;
			sleep 10;
			["США понесли тяжелые потери и отступили, победа ТКА!", east] call a3a_fnc_endMission;
		};
		
	};
};
