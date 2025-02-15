// Серверные скрипты
// Выполняются после инициализации платформы
// Отличное место чтобы разместить какие-нибудь условия победы/поражения в миссии
// Например: waitUntil { sleep 1; a3a_var_started }; ["60 minutes have passed, NATO wins", 3600] spawn a3a_fnc_endMissionTimer;
// Или: waitUntil { sleep 1; a3a_var_started }; [[["marker1", "ZONE 1 NAME", 1, 1], ["marker2", "ZONE 2 NAME", 1, 1]], 0, true, "UNKNOWN"] spawn a3a_fnc_endMissionZonesCapture;

_missionTime = 110 * 60;
missionNamespace setVariable ["a3a_endMissionTime", _missionTime, true];
missionNamespace setVariable ["isIdentified", false, true];

CrititalLosesWest = 8; // потери для синих
CrititalLosesEast = 11; // потери для красных

[_missionTime] spawn {
	params ["_missionTime"];
	waitUntil {sleep 10; a3a_var_started};
	while {isNil "srv_triggerFinished"} do { 
	sleep 10;
		if (missionNamespace getVariable ['isIdentified', false]) then {
			srv_triggerFinished = true;
			sleep 10;
			["Лидер повстанцев убит! Победа правительственных войск!", east] call a3a_fnc_endMission;
		};

		if (mkk_platform_missionTime > missionNamespace getVariable ["a3a_endMissionTime", _missionTime]) then {
			srv_triggerFinished = true;
			sleep 10;
			["Время вышло, победа сил конгресса!", east] call a3a_fnc_endMission;
		};

		if ((west countside playableUnits) < CrititalLosesEast) then {
			srv_triggerFinished = true;
			sleep 10;
			["Силы конгресса разгромлены, победа правительственных войск!", east] call a3a_fnc_endMission;
		};
		
		if ((east countside playableUnits) < CrititalLosesWest) then {
			srv_triggerFinished = true;
			sleep 10;
			["Правительственные войска понесли тяжелые потери и отступили, победа повстанцев!", west] call a3a_fnc_endMission;
		};
		
	};
};
