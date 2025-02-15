// Серверные скрипты
// Выполняются после инициализации платформы
// Отличное место чтобы разместить какие-нибудь условия победы/поражения в миссии
// Например: waitUntil { sleep 1; a3a_var_started }; ["60 minutes have passed, NATO wins", 3600] spawn a3a_fnc_endMissionTimer;
// Или: waitUntil { sleep 1; a3a_var_started }; [[["marker1", "ZONE 1 NAME", 1, 1], ["marker2", "ZONE 2 NAME", 1, 1]], 0, true, "UNKNOWN"] spawn a3a_fnc_endMissionZonesCapture;

CrititalLosesWest = 10; // потери для синих
CrititalLosesEast = 6; // потери для красных
missionNamespace setVariable ["objectiveComplete", false, true];
missionNamespace setVariable ['pingAvailable', true, true];

[] spawn {
	waitUntil {sleep 10; a3a_var_started};
	while {isNil "srv_triggerFinished"} do { 
	sleep 10;
		if (missionNamespace getVariable "objectiveComplete") then {
			srv_triggerFinished = true;
			sleep 10;
			["Все задачи выполнены. Banko ten'nō o aogu!", west] call a3a_fnc_endMission;
		};
		
		if ((east countside playableUnits) < CrititalLosesEast) then {
		srv_triggerFinished = true;
		sleep 10;
		["Арстотцка понесла тяжёлые потери. Banko ten'nō o aogu!", west] call a3a_fnc_endMission;};
		
		if ((west countside playableUnits) < CrititalLosesWest) then {
		srv_triggerFinished = true;
		sleep 10;
		["Импор понес тяжёлые потери. Слава Арстотцке!", east] call a3a_fnc_endMission;};
	};
};
