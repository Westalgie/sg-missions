params ["_veh", "_type"];

_veh setVariable ["airType", _type];

_veh addEventHandler ["Engine", {
	params ["_vehicle", "_engineState"];
	_type = _vehicle getVariable "airType";
	_frozen = missionNamespace getVariable [_type, true];

	if (_frozen) then {
		hint "Приказа взлетать не было";
		_vehicle engineOn false;
	};
}];
