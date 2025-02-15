if (player == blCom) then {
	[] call compile preprocessFileLineNumbers "bn_selector\bn_selector.sqf";

	["Транспорт СПН:"] call bn_selector_create_group;

		["Машина (по умолчанию)", "[false] call compile preprocessFileLineNumbers 'Scripts\initRecon.sqf';"] call bn_selector_add_item;

		["Лодка", "[true] call compile preprocessFileLineNumbers 'Scripts\initRecon.sqf';"] call bn_selector_add_item;
	
	[[1000,3600]] call bn_selector_paint;
};