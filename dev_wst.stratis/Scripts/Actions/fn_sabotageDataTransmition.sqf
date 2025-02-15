if (hasInterface && (side player == west)) then {
	[
		terminal,                                                                                   		// Объект, к которому привязано действие
		"Взломать систему управления",                              										// Название действия
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                                  	// Значок действия, отображаемый на экране
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                                  	// Значок прогресса, отображаемый на экране
		"(_this distance _target < 2.5) and ((selectedButtons # 0 # 0 getVariable 'turnedOff') and (selectedButtons # 1 # 0 getVariable 'turnedOff') and !(missionNamespace getVariable 'objectiveComplete'))",  // Условие для отображения действия
		"(_caller distance _target < 2.5) and ((selectedButtons # 0 # 0 getVariable 'turnedOff') and (selectedButtons # 1 # 0 getVariable 'turnedOff') and !(missionNamespace getVariable 'objectiveComplete'))",// Условие для прогресса
		{},                                                                                             	// Код, выполняемый при запуске действия
		{},                                                              									// Код, выполняемый при каждом тике прогресса
		{
			terminal setObjectTextureGlobal [1, "#(rgb,8,8,3)color(0,0,0,1)"];
			terminal setObjectTextureGlobal [2, "#(rgb,8,8,3)color(0,0,0,1)"];
			terminal setObjectTextureGlobal [3, "#(rgb,8,8,3)color(0,0,0,1)"];
			missionNamespace setVariable ["objectiveComplete", true, true];
		},     																								// Код, выполняемый по завершении
		{},                                                                                            		// Код, выполняемый при прерывании
		[],                                                                                             	// Аргументы, передаваемые скриптам как _this select 3
		10,																									// Продолжительность действия [с]
		3,                                                                                              	// Приоритет
		false,                                                                                          	// Remove on completion
		false                                                                                           	// Показывать действие в бессознательном состоянии 
	] call BIS_fnc_holdActionAdd;                                                                       	// Реализация, совместимая с MP
};