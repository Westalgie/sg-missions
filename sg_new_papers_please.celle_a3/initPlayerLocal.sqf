player createDiaryRecord ["diary", ["Форма сторон", loadFile "A3A_BRIEFING\briefing_UNIFORMS.html"]];

enableSaving [false, false]; // отключение сохранение
setTerrainGrid 3.125; // отрисовка ландшафта, читайте - https://community.bistudio.com/wiki/setTerrainGrid

sleep 0.1;
enableEnvironment [false, true]; // удаление всей окружающей фауны, звуки остаются

if (!isDedicated) then {
	if (a3a_var_started) then {
		_markers = ['opAccessSpn', 'blAccessSpn', 'opAccessReg', 'blAccessReg'];
		{
			_x setMarkerAlphaLocal 0;
		} forEach _markers;
	};
	[] spawn { 
		if ((missionNamespace getVariable 'objectiveState') == 1) then {
			[getPosATL earthPile] call WST_fnc_uavCrashSiteLocal;
		};	
	};
};
