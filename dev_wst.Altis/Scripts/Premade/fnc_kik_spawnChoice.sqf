// Функция перемещения стороны отрядами, взводами, ротами и т.п. на брифинге КСами. Можно ТПать даже ящики/транспорт отдельно от пехов.

// Автор: kickermate. Сделано с оглядкой на релаизацию управления расстановкой в скрипте от Dimon UA.
// Модфицировано: Westalgie. Каждый отряд имеет свой массив разрешенных и запрещенных зон спавна.

// Структура teleportMap: [ключ, инфо-маркер для стороны + в нём направление дороги]

{
	if (side player != side (_x # 0)) then {
		// { _x setMarkerAlphaLocal 0; } forEach (_x # 2) + (_x # 3); // скрыть все маркеры, при несоответствии стороны
		{
			{
				_x setMarkerAlphaLocal 0;
			} forEach (_x # 4) + (_x # 5);
		} forEach _x # 1;
	} else {
		// { _x setMarkerAlphaLocal 1; } forEach (_x # 2) + (_x # 3); // показать все маркеры, при соответствии стороны
		{
			{
				_x setMarkerAlphaLocal 1;
			} forEach (_x # 4) + (_x # 5);
		} forEach _x # 1;
	};
} forEach _this;

private _isSL = false; // флаг КС ли зашедший в файл

{
	if (player == (_x # 0)) then { // если игрок имеет право расставлять
		_isSL = true;

		slVar = _x # 0; // переменная КСа
		squads = _x # 1; // отделения
		markersCanPlaceAll = [];
		{
			{
				markersCanPlaceAll pushBackUnique _x;
			} forEach _x # 4;
		} forEach squads;
		markersCantPlaceAll = [];
		{
			{
				markersCantPlaceAll pushBackUnique _x;
			} forEach _x # 5;
		} forEach squads;

		// markersCanPlace = _x # 2; // маркеры, где можно ставить
		// markersCantPlace = _x # 3; // маркеры, где ставить нельзя

		break;
	};
} forEach _this;


if (!_isSL || (missionNamespace getVariable ["choiceEndedby_" + getPlayerUID player, false])) exitWith {}; // если игрок не КС или уже завершил расстановку и перезашёл, то выйти




// Переменные для настройки
antilag_radius = 1000; // Радиус, в котором нельзя поставить ещё один взвод или отделение
radius = 30; // Радиус поиска ближайшей дороги
radiusAddition = 10; // Добавочное значение к радиусу, дабы ничего не уничтожалось о текстуры при скрытии террайна
errorWaiting = 1.4; // время, которое висит маркер ошибки
unitMarkerIcon = "mil_circle"; // маркер на месте выбора (https://community.bistudio.com/wiki/Arma_3:_CfgMarkers)
unitMarkerColor =  "ColorGreen"; // цвет текста и иконки (https://community.bistudio.com/wiki/Arma_3:_CfgMarkerColors)
hideTerrainOnSpawn = true; // скрывать объекты ландшафта под телепортируемыми. Рекомендуется не использовать, если ставите много юнитов! (false)
hideRestrictMarkersAfterChoiceEndFlag = true; // флаг убирания маркеров расстановки (зон, где можно и нельзя) после завершения сразу расстановки (телепорта отделений). true - будут убраны, false - не будут
hideSquadMarkersAfterFreezeFlag = true; // убирать ли маркера расстановки после фриза (true) - будут убраны, (false) - убраны после конца расстановки КСом. 
useCustomRoadsFlag = false; // флаг использования кастомных дорог
customRoadClasses = ["CUP_A2_Road_road_invisible"]; // массив всех классов дополнительных дорог
placedInfoPosition = [18496.1,21133.3,0]; // позиция отрисовки посталенных и не поставленных отделений
defaultMapPos = [999.086,12174.1,0]; // стандартная позиция появления маркера ошибки на карте
markerForDirection = "bluBase_marker"; // маркер, в направлении которого будут повёрнуты отделения



// Служебные переменные, не трогать.
missionNamespace setVariable ["count_SLs", count _this, true]; // общее количество КСов
placedUnits = []; // массив названий поставленных отделений
nonPlacedUnits = []; // массив названий не поставленных отделений
currentUnitsMarker = ""; // маркер, в котором содержатся юниты и техника для телепортации
teleportMap = createHashMap; // создаём Hash таблицу
customRoadNowFlag = false; // флаг проверяется ли сейчас кастомная дорога
clickPos = defaultMapPos; // позиция клика





/*
Описание:
    Функция удаляет все маркеры расставленных и нет отделений
Принимаемые значения:
    Нет
Отдаваемые значения:
    Нет
*/
fnc_kik_deleteOldPlacedMarkers = {
	deleteMarkerLocal "titlePlaced";
	deleteMarkerLocal "titleNonPlaced";

	private _maxNumber = count squads;

	for "_i" from 0 to _maxNumber do { 
		deleteMarkerLocal ("placedUnit_" + str( _i )); 
		deleteMarkerLocal ("nonPlacedUnit_" + str( _i )); 
	};
};

/*
Описание:
    Функция обновляет списки расставленных и не расставленных
Принимаемые значения:
    Нет
Отдаваемые значения:
    Нет
*/
fnc_kik_refrashLists = {	
	call fnc_kik_deleteOldPlacedMarkers;

	private _placedType = "loc_LetterV";
	private _nonPlacedType = "loc_LetterX";
	private _placedColor = unitMarkerColor;
	private _nonPlacedColor = "ColorRed";

	private _STEP_Y = -50;
	private _STEP_X = 50;

	private _pos_x = placedInfoPosition # 0;
	private _pos_y = placedInfoPosition # 1;

	private _placedTitle = createMarkerLocal ["titlePlaced", [_pos_x, _pos_y]];
	_placedTitle setMarkerTypeLocal _placedType;
	_placedTitle setMarkerTextLocal "Расставленные единицы (не забудьте ЗАВЕРШИТЬ РАССТАНОВКУ в вкладке ОБЩИЕ ДЕЙСТВИЯ): ";
	_placedTitle setMarkerColorLocal _placedColor;

	_pos_y = _pos_y + _STEP_Y;
	_pos_x = _pos_x + _STEP_X; // indent

	{
		private _placedUnitMarker = createMarkerLocal ["placedUnit_" + (str _forEachIndex), [_pos_x, _pos_y]];
		_placedUnitMarker setMarkerTypeLocal _placedType;
		_placedUnitMarker setMarkerTextLocal _x;
		_placedUnitMarker setMarkerColorLocal _placedColor;

		_pos_y = _pos_y + _STEP_Y; // next step
	} forEach placedUnits;
		
	_pos_x = _pos_x - _STEP_X; // unindent

	private _nonPlacedTitle = createMarkerLocal ["titleNonPlaced", [_pos_x, _pos_y]];
	_nonPlacedTitle setMarkerTypeLocal _nonPlacedType;
	_nonPlacedTitle setMarkerTextLocal "Не расставленные единицы: ";
	_nonPlacedTitle setMarkerColorLocal _nonPlacedColor;

	_pos_y = _pos_y + _STEP_Y;
	_pos_x = _pos_x + _STEP_X; // indent

	{
		private _nonPlacedUnitMarker = createMarkerLocal ["nonPlacedUnit_" + (str _forEachIndex), [_pos_x, _pos_y]];
		_nonPlacedUnitMarker setMarkerTypeLocal _nonPlacedType;
		_nonPlacedUnitMarker setMarkerTextLocal _x;
		_nonPlacedUnitMarker setMarkerColorLocal _nonPlacedColor;

		_pos_y = _pos_y + _STEP_Y; // next step
	} forEach nonPlacedUnits;
};

/*
Описание:
    Функция добавления названия отделения в расмещённые и удаления из не размещённых
Принимаемые значения:
    Назвыание отделения
Отдаваемые значения:
    Нет
*/
fnc_kik_addPlacedSquad = {
	params ["_name"];
	
	nonPlacedUnits deleteAt (nonPlacedUnits find _name);
	placedUnits pushBack _name;

	call fnc_kik_refrashLists;
};

/*
Описание:
    Функция спавна маркера с ошибкой на клик
Принимаемые значения:
    Текст ошибки
Отдаваемые значения:
    Нет
*/
fnc_kik_error = {
	params ["_markerText"];

	createMarkerLocal ["temp_ErrorMarker", clickPos];
	"temp_ErrorMarker" setMarkerTextLocal _markerText;
	"temp_ErrorMarker" setMarkerTypeLocal "hd_warning";
	"temp_ErrorMarker" setMarkerColorLocal "ColorRed";
	[] spawn {
		uiSleep errorWaiting;
		deleteMarkerLocal "temp_ErrorMarker";
	};
};

/*
Описание:
    Функция скрытия объектов ландшафта на позиции по некоторому радиусу вокруг.
	
	! Рекомендуется НЕ использовать, дабы уменьшить нагрузку на сервер !
Принимаемые значения:
    Позиция, Радиус
Отдаваемые значения:
    Нет
*/
fnc_kik_clearTerrain = {
   params ["_pos", "_rad"];
   private _nearTerrainObjects = nearestTerrainObjects [_pos, [], _rad + radiusAddition];
   { 
	    [_x] remoteExec ['hideObjectGlobal', 2];
   } forEach _nearTerrainObjects;
};

/*
Описание:
    Функция телепорта всех отделений после завершения расстановки
Принимаемые значения:
    Нет
Отдаваемые значения:
    Нет
*/
fnc_kik_teleportSquads = {
	private _endTeleportMarker = "";
	{
		_endTeleportMarker = teleportMap get _x;

		diag_log format ["[fnc_kik_resp_choice] [teleport] from { '%1' at %2 with dir %3 } to { '%4' at %5 with dir %6 }. Requested by: %7 (%8)", _x, markerPos _x, markerDir _x, _endTeleportMarker, markerPos _endTeleportMarker, markerDir _endTeleportMarker, name player, playerside]; // запишем в лог

		if (hideTerrainOnSpawn) then {
			[markerPos _endTeleportMarker, (markerSize _x) # 0] call fnc_kik_clearTerrain;
		};

		[_x, _endTeleportMarker] call mkk_platform_fnc_movefreeze;

		[_endTeleportMarker] spawn { // удаляем маркер на отделение
			params ["_marker"];

		   if (hideSquadMarkersAfterFreezeFlag) then {
			   deleteMarker _marker;
		   } else {
			   waitUntil { uisleep 5; a3a_var_started };
			   deleteMarker _marker;
		   };
		};
	} forEach (keys teleportMap);
};

/*
Описание:
    Функция завершения расстановки отделений.
Принимаемые значения:
    Нет
Отдаваемые значения:
    Нет
*/
fnc_kik_endSpawnChoice = {
    if (missionNamespace getVariable ["choiceEndedby_" + getPlayerUID player, false]) exitWith {};

	call fnc_kik_deleteOldPlacedMarkers;
	player removeDiarySubject "diarySpawnPage";
	player selectDiarySubject "Diary";
	player onMapSingleClick "";

	missionNamespace setVariable ["endedBy", (missionNamespace getVariable ["endedBy", 0]) + 1, true];
	missionNamespace setVariable ["choiceEndedby_" + getPlayerUID player, true, true];

	if (hideRestrictMarkersAfterChoiceEndFlag) then {
		{ _x setMarkerAlpha 0; } forEach (markersCanPlaceAll + markersCantPlaceAll);
	};
	if (hideSquadMarkersAfterFreezeFlag) then {
		[] spawn {
			waitUntil {sleep 5; a3a_var_started;};
			{ _x setMarkerAlpha 0; } forEach (markersCanPlaceAll + markersCantPlaceAll);
		};
	};

	[] call fnc_kik_teleportSquads; // телепортируем всех по нужным местам
};

/*
Описание:
    Функция получения дороги с радиусе клика
Принимаемые значения:
    Нет
Отдаваемые значения:
    Объект дороги, если она нашлась, objNull если нет.
*/
fnc_kik_findRoad = {
	private _roads = objNull;

	_roads = [clickPos, radius] call BIS_fnc_nearestRoad;
	if (isNull _roads) then {
		if (useCustomRoadsFlag) then {
			_roads = nearestObjects [clickPos, customRoadClasses, radius, true];
			if ((count _roads > 0)) then {
				customRoadNowFlag = true;
			    _roads # 0;
		    } else {
			    objNull;
		    };
		} else {
			objNull;
		};
	} else {
		_roads;
	};
};

/*
Описание:
    Функция создания маркера на отделение
Принимаемые значения:
    Позиция, Направление, Текст
Отдаваемые значения:
    Маркер (Строка)
*/
fnc_kik_createSquadMarker = {
	params ["_pos", "_dir", "_text"];

	private _marker = createMarker [currentUnitsMarker + "_spawnMarker", _pos, 1];
	_marker setMarkerDir _dir;
	_marker setMarkerType unitMarkerIcon;
	_marker setMarkerText _text;
	_marker setMarkerColor unitMarkerColor;

	_marker;
};

/*
Описание:
    Функция проверки корректности направления.
Принимаемые значения:
    Направление
Отдаваемые значения:
    Корректное направление, учитывающее направление на тригер
*/
fnc_kik_getCorrectDirection = {
	params ["_pos","_dir"];
	_dirToTrigger = (_pos) getDir (markerPos markerForDirection); 

	_angle = abs(_dir - _dirToTrigger);
	if (_angle > 180) then {_angle = 360 - _angle};
	if (_angle > 90) then {_dir = _dir - 180};
	_dir;
};

/*
Описание:
    Функция перемещения респавна
Принимаемые значения:
    Нет
Отдаваемые значения:
    Нет
*/
fnc_kik_writeToHash = {
	private _isPlacedOnRoad = false;
	private _markerText = "";

	{
		if (currentUnitsMarker == (_x # 0)) exitWith {_isPlacedOnRoad = _x # 2; _markerText = _x # 1;};
	} forEach squads;

	if (_isPlacedOnRoad) then {
		private _road = call fnc_kik_findRoad;
		if (isNull _road) exitWith {["Около места клика нет дороги!"] call fnc_kik_error;};
		private _roadPos = getPos _road;

		if (!([_roadPos] call fnc_kik_checkCircleIntercest)) exitWith {[format ["Между точками спавна должен быть промежуток минимум в %1 метров! Пожалейте сервер!", antilag_radius]] call fnc_kik_error;};
		player onMapSingleClick "";

		private _endZoneInfo = teleportMap getOrDefault [currentUnitsMarker, objNull];
		private _createdMarker = "";

		if (_endZoneInfo isEqualTo objNull) then {
			if (customRoadNowFlag) then {
				_createdMarker = [_roadPos, ([_roadpos,(getDir _road)] call fnc_kik_getCorrectDirection), _markerText] call fnc_kik_createSquadMarker;
				customRoadNowFlag = false;
			} else {
				private _roadInfo = getRoadInfo _road;
				_createdMarker = [_roadPos, ([_roadpos,((_roadInfo # 6) getDir (_roadInfo # 7))] call fnc_kik_getCorrectDirection), _markerText] call fnc_kik_createSquadMarker;
			};

			[_markerText] call fnc_kik_addPlacedSquad;
			teleportMap set [currentUnitsMarker, _createdMarker];
		} else {
			_endZoneInfo setMarkerPos _roadPos;

			if (customRoadNowFlag) then {
				_endZoneInfo setMarkerDir ([_roadpos,(getDir _road)] call fnc_kik_getCorrectDirection); 
				customRoadNowFlag = false;
			} else {
				private _roadInfo = getRoadInfo _road;
			    _endZoneInfo setMarkerDir ([_roadpos,((_roadInfo # 6) getDir (_roadInfo # 7))] call fnc_kik_getCorrectDirection);
			};
		};

		currentUnitsMarker = "";

	} else { // если мы ставим не по дорогам
		if (!([clickPos] call fnc_kik_checkCircleIntercest)) exitWith {[format ["Между точками спавна должен быть промежуток минимум в %1 метров! Пожалейте сервер!", antilag_radius]] call fnc_kik_error;}; // если клик был там же, где есть другое отделение
		player onMapSingleClick "";
		private _endZoneInfo = teleportMap getOrDefault [currentUnitsMarker, objNull];
		private _createdMarker = "";

		if (_endZoneInfo isEqualTo objNull) then {
			private _createdMarker = [clickPos, ((clickpos) getDir (markerPos markerForDirection)), _markerText] call fnc_kik_createSquadMarker;
			[_markerText] call fnc_kik_addPlacedSquad;
			teleportMap set [currentUnitsMarker, _createdMarker];
		} else {
			_endZoneInfo setMarkerPos clickPos;
			_endZoneInfo setMarkerDir ((clickpos) getDir (markerPos markerForDirection)); 
		};

		currentUnitsMarker = "";
	};
};

/*
Описание:
    Функция проверки пересечения двух маркеров-кругов. Проверяет корректно ТОЛЬКО круги.
Принимаемые значения:
    Позиция
Отдаваемые значения:
    true - есть пересечения, false - нет
*/
fnc_kik_checkCircleIntercest = {
	params ["_movingMarkerPos"];

	private _movingMarkerRadius = (markerSize currentUnitsMarker) # 0;

	private _currentAccess = ((squads select { (_x # 0) == currentUnitsMarker }) # 0) # 4;
	private _sameAccessSquads = [];
	{
		if ((count (_currentAccess arrayIntersect (_x # 4))) > 0) then {
			_sameAccessSquads pushBackUnique _x;
		};
	} forEach squads;
	private _markerCanPlace = _squad # 4;
	
	private _dontIntersect = true;
	{
		if ((_x # 0) == currentUnitsMarker) then {continue};

		private _checkingMarkerPos = [];

		if ((_x # 0) in teleportMap) then {
			_checkingMarkerPos = markerPos (teleportMap get (_x # 0));
		} else {
			_checkingMarkerPos = markerPos (_x # 0);
		};
		private _checkingMarkerRadius = (markerSize (_x # 0)) # 0;
		private _s = sqrt ((((_movingMarkerPos # 0) - (_checkingMarkerPos # 0)) * ((_movingMarkerPos # 0) - (_checkingMarkerPos # 0))) + (((_movingMarkerPos # 1) - (_checkingMarkerPos # 1)) * ((_movingMarkerPos # 1) - (_checkingMarkerPos # 1))));
		if (_s < (_movingMarkerRadius + _checkingMarkerRadius + antilag_radius)) then {
			_dontIntersect = false;
			break;
		};
	} forEach _sameAccessSquads;
	_dontIntersect;
};

/*
Описание:
    Функция проверки попадания клика в разрешённые маркера и непопадания в запрещённые
Принимаемые значения:
    Нет
Отдаваемые значения:
    true - корректая зоны, false - некорректная зона
*/
fnc_kik_checkClick = {	
	private _incorrect = true; // считаем, что сразу кликнули не туда
	private _currentMarkerRadius = (markerSize currentUnitsMarker) # 0;

	private _squad = (squads select { (_x # 0) == currentUnitsMarker }) # 0;
	private _markerCanPlace = _squad # 4;
	diag_log _markerCanPlace;
	private _markerCantPlace = _squad # 5;
	diag_log _markerCantPlace;
	{
		if (
			clickPos inArea _x && 
			[(clickPos # 0) + _currentMarkerRadius, clickPos # 1] inArea _x &&
			[(clickPos # 0) - _currentMarkerRadius, clickPos # 1] inArea _x &&
			[clickPos # 0, (clickPos # 1) + _currentMarkerRadius] inArea _x &&
			[clickPos # 0, (clickPos # 1) - _currentMarkerRadius] inArea _x
		) then {
			_incorrect = false;
		};
	} forEach _markerCanPlace;
	{
		if (
			clickPos inArea _x ||
			[(clickPos # 0) + _currentMarkerRadius, clickPos # 1] inArea _x ||
			[(clickPos # 0) - _currentMarkerRadius, clickPos # 1] inArea _x ||
			[clickPos # 0, (clickPos # 1) + _currentMarkerRadius] inArea _x ||
			[clickPos # 0, (clickPos # 1) - _currentMarkerRadius] inArea _x
		) then {
			_incorrect = true;
		}
	} forEach _markerCantPlace;
	
	!_incorrect;
};

/*
Описание:
    Функция создания события на клик мыши КСа
Принимаемые значения:
    Нет
Отдаваемые значения:
    Нет
*/
fnc_kik_makeOnMapClickEvent = {

	if (!(missionNamespace getVariable ["choiceEndedby_" + getPlayerUID player, false])) then {
		player onMapSingleClick {
			clickPos = _pos;
			if (call fnc_kik_checkClick) then {
				call fnc_kik_writeToHash;
			} else {
				["Клик был вне разрешённой или в запрещённой для расстановки зоне!"] call fnc_kik_error;
			};
		}; 
	} else {
		["Вы уже завершили расстановку!"] call fnc_kik_error;
	};
};

/*
Описание:
    Функция проверки того, все ли маркеры являются кругами
Принимаемые значения:
    Нет
Отдаваемые значения:
    true - все, false - не все
*/
fun_kik_checkAllCircles = {
	private _isAllCircles = true;
	{
		if ((!((markerShape (_x # 0)) == "ELLIPSE")) || (!(markerSize (_x # 0) # 0 == (markerSize (_x # 0) # 1)))) exitWith {_isAllCircles = false;};
	} forEach squads;

	_isAllCircles;
};

/*
Описание:
    Функция восстановления teleportMap, placedUnits, nonPlacedUnits при выходе КСа
Принимаемые значения:
    Нет
Отдаваемые значения:
    Нет
*/
fnc_kik_restoreData = {
	{
		if ((getMarkerType ((_x # 0) + "_spawnMarker")) != "") then {
			teleportMap set [_x # 0, (_x # 0) + "_spawnMarker"];
			placedUnits pushBack (_x # 1);
		} else {
			nonPlacedUnits pushBack (_x # 1);
		};
	} forEach squads;
};

if (call fun_kik_checkAllCircles) then {
	call fnc_kik_restoreData; // восстановим teleportMap, если КС перезаходил

	if (!(player diarySubjectExists "diarySpawnPage")) then {
		player createDiarySubject ["diarySpawnPage", "Меню Расстановки"];
		player createDiaryRecord ["diarySpawnPage", 
			[
				"Общие действия",
				"<br/>Действия: [<execute expression='player call fnc_kik_endSpawnChoice'>Завершить расстановку</execute>]<br/>"
			]
		];
	};
	{
		if ((_x # 2) == true) then {
			player createDiaryRecord ["diarySpawnPage",
				[
					"[ROAD] " + _x # 1,
					format [
						"<br/>Действия: [<execute expression=""call fnc_kik_makeOnMapClickEvent; currentUnitsMarker = '%1'"">Выбрать место респавна</execute>, <marker name='%1'>Показать изначальный спавн</marker>]<br/><br/>Можно ставить <font color='#f50707'>ТОЛЬКО</font color> на дорогах в разрешённых маркерах.<br/>%2<br/>",
						_x # 0,
						if ((_x # 3) != "") then {format ["<br/><br/>                                            Дополнительная информация                                            <br/><br/>%1<br/>", _x # 3]} else {""}
					]
				]
			];
		} else {
			player createDiaryRecord ["diarySpawnPage",
				[
					"[ANY] " + _x # 1,
					format [
						"<br/>Действия: [<execute expression=""call fnc_kik_makeOnMapClickEvent; currentUnitsMarker = '%1'"">Выбрать место респавна</execute>, <marker name='%1'>Показать изначальный спавн</marker>]<br/><br/>Можно ставить в <font color='#55e036'>ЛЮБОМ</font color> месте разрешённых маркеров.<br/>%2<br/>",
						_x # 0,
						if ((_x # 3) != "") then {format ["<br/><br/>                                            Дополнительная информация                                            <br/><br/>%1<br/>", _x # 3]} else {""}
					]
				]
			];	
		};
	} forEach squads;

	call fnc_kik_refrashLists;

	/*[fnc_kik_endSpawnChoice] spawn { // проверка на начало игры без завершённой расстановки (старый вариант)
	waitUntil {sleep 1; time > 0};
	[] call fnc_kik_endSpawnChoice;
	};*/
	
	[fnc_kik_endSpawnChoice] spawn { // проверка на начало игры без завершённой расстановки (новый вариант)
	waitUntil {time > 0};
	[] call fnc_kik_endSpawnChoice;
	};
} else {
	["Не все переданные маркеры являются кругами!"] remoteExec ["fnc_kik_error", 0];
};