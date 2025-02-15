if (hasInterface) then {
	[
		uavWreck,                                                                                   	// Объект, к которому привязано действие
		"Извлечь бортовой самописец",                              										// Название действия
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa",                            // Значок действия, отображаемый на экране
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa",                            // Значок прогресса, отображаемый на экране
		"(_this distance _target < 6) and (!(missionNamespace getVariable 'recorderRetreaved'))",      // Условие для отображения действия
		"(_caller distance _target < 6) and (missionNamespace getVariable 'objectiveState' == 2)",      // Условие для прогресса
		{
			if (missionNamespace getVariable "objectiveState" == 1) then {
				hint str "Горячо! Придется подождать...";
			};
		},                                                                                             // Код, выполняемый при запуске действия
		{
			hint "Извлекаем бортовой самописец...";
		},                                                              								// Код, выполняемый при каждом тике прогресса
		{
			hint str "Готово! Доставьте самописец на базу!";
			[getPos player] call WST_fnc_createFlightRecorder;
			missionNamespace setVariable ["recorderRetreaved", true, true];
		},     																							// Код, выполняемый по завершении
		{},                                                                                            	// Код, выполняемый при прерывании
		[],                                                                                             // Аргументы, передаваемые скриптам как _this select 3
		15,																								// Продолжительность действия [с]
		1,                                                                                              // Приоритет
		false,                                                                                          // Remove on completion
		false                                                                                           // Показывать действие в бессознательном состоянии 
	] call BIS_fnc_holdActionAdd;                                                                       // Реализация, совместимая с MP
};