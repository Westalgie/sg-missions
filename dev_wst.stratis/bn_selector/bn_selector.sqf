bn_selector_groups = [];
bn_defaults_used = [];
bn_selector_messages = ["Выбери желаемые варианты (Shift+Click):"];
bn_group_selected_items = [];
bn_selector_markers = [];
BN_SELECTOR_CLICK_RANGE = 20;
bn_selector_after_commit = "";
bn_selector_message = "Выбранные варианты (" + (name player) + ", " +(str (side player)) + "): \n";
BN_SELECTABLE_MARKER = "mil_circle_noShadow"; // selector_selectable
BN_SELECTED_MARKER = "mil_objective_noShadow"; // selector_selectedMission
BN_SELECTED_MARKER_SIZE = 0.5;
BN_SELECTOR_GROUP_PARAMS = ["_title","_max_selected_items","_options","_allow_empty","_items_per_line","_extra_vspace"];

bn_selector_marker_icon = { //[name, x, y, size, icon, color, text]
	_newmarker = createMarkerLocal [_this select 0, [_this select 1, _this select 2]];
	_newmarker setMarkerSizeLocal [_this select 3, _this select 3];
	_newmarker setMarkerShapeLocal 'icon';
	_newmarker setMarkerTypeLocal (_this select 4);
	_newmarker setMarkerColorLocal (_this select 5);
	_newmarker setMarkerTextLocal (_this select 6);
	bn_selector_markers pushBack _newmarker;
	_newmarker
};

bn_selector_create_group = { //[title, maxSelected, allowEmpty, _items_per_line]
	params ["_title",["_max_selected_items",1],["_allow_empty",false],["_items_per_line",1],["_extra_vspace",0]];
	bn_selector_groups pushBack [_title, _max_selected_items, [],_allow_empty,_items_per_line,_extra_vspace];
	bn_group_selected_items pushBack [];
};

bn_selector_add_item = { //[title, "code", (position),(global id)]
	params ["_title","_script",["_item_pos",[0,0]],["_global_id",-1]];
	if (count bn_selector_groups < 1) exitWith {bn_selector_messages pushBack "Не создана группа!"};
	private _current_group = (count bn_selector_groups) - 1;
	private _target_array = (bn_selector_groups select _current_group) select 2;
	_target_array pushBack [_title,_script,_item_pos,_global_id];
	(bn_group_selected_items select _current_group) pushBack false;
	count _target_array - 1
};

bn_selector_cleanup_markers = {
	{
		deleteMarkerLocal _x;
	} forEach bn_selector_markers;
};

bn_selector_paint = { // [start_coords, step_y, "actions after commit"]
	params ["_start_coords",["_STEP_Y",-25],["_after_commit",""],["_auto_commit_after_briefing",true]];
	private _STEP_X = 25;
	private _STEP_X2 = _STEP_X * 4;
	private _start_coods = _this select 0;
	bn_selector_after_commit = _after_commit;
	private _pos_x = _start_coods select 0;
	private _pos_y = _start_coods select 1;
	{
		private _marker = ["bn_selector_message_" + (str (count bn_selector_markers)),_pos_x,_pos_y,0.5,"mil_dot_noShadow","ColorBlue",_x] call bn_selector_marker_icon;
		_pos_y = _pos_y + _STEP_Y;
	} forEach bn_selector_messages;
	{
		_x params BN_SELECTOR_GROUP_PARAMS;
		_pos_y = _pos_y + _STEP_Y * _extra_vspace;
		private _group_index = _forEachIndex;
		private _marker = ["bn_selector_group_" + (str _group_index),_pos_x,_pos_y,0.5,"mil_dot_noShadow","ColorBlue",_title] call bn_selector_marker_icon;
		_pos_y = _pos_y + _STEP_Y;
		_pos_x = _pos_x + _STEP_X; // indent
		{
			private _item_title = _x select 0;
			private _marker_pos = [_pos_x + (_forEachIndex mod _items_per_line) * _STEP_X2,_pos_y];
			private _make_step = true;
			if ((_x select 2 select 0) != 0) then {
				_marker_pos = _x select 2;
				_make_step = false;
			} else {
				_x set [2, _marker_pos];
			};
			private _marker = ["bn_selector_item_" + (str _group_index) + "_" + (str _forEachIndex),_marker_pos select 0,_marker_pos select 1,BN_SELECTED_MARKER_SIZE,BN_SELECTABLE_MARKER,"ColorBlue",_item_title] call bn_selector_marker_icon;
			if (_make_step && ((((_forEachIndex+1) mod _items_per_line) == 0) || ((_forEachIndex+1) == count _options) )) then {
				_pos_y = _pos_y + _STEP_Y;
			};
		} forEach _options;
		_pos_x = _pos_x - _STEP_X; // unindent
	} forEach bn_selector_groups;
	
	_pos_y = _pos_y + _STEP_Y;
	private _commit_marker = ["bn_commit_marker",_pos_x,_pos_y,BN_SELECTED_MARKER_SIZE,BN_SELECTABLE_MARKER,"ColorRed","Завершить выбор"] call bn_selector_marker_icon;
	
	["bn_selector", "onMapSingleClick", {
		if (_shift) then {
			[_pos] call bn_selector_receive_click;
		};
	}] call BIS_fnc_addStackedEventHandler;

	bn_defaults_used = bn_selector_groups apply {false};

	bn_selector_last_pos = [_pos_x, _pos_y];
	
	if (isMultiplayer && _auto_commit_after_briefing) then {
		sleep 1; // delay past briefing
		if (isNil "bn_commit_started") then {
			{
				private _group_index = _forEachIndex;
				_x params BN_SELECTOR_GROUP_PARAMS;
				private _none_selected = ({_x} count (bn_group_selected_items select _forEachIndex)) < 1;
				if (_none_selected && !_allow_empty) then { // select default options for groups with nothing selected
					(bn_group_selected_items select _forEachIndex) set [0, true];
					"bn_selector_item_" + (str _group_index) + "_0" setMarkerTypeLocal BN_SELECTABLE_MARKER;
					bn_defaults_used set [_group_index, true];
				};
			} forEach bn_selector_groups;
			[] call bn_selector_commit;
		};
		[] call bn_selector_cleanup_markers;
		[bn_selector_message] remoteExec ['bn_selector_record_message',2];
	};

	
};

/*
*/
bn_selector_deselect_conflicting_options = {
	params ["_conflicting_id","_group"];
	diag_log "bn_selector_deselect_conflicting_options";
	diag_log _this;
	{
		_x params BN_SELECTOR_GROUP_PARAMS;
		private _group_id = _forEachIndex;
		if (_group_id != _group) then {
			{
				_x params ["_title","_script","_item_pos","_global_id"];
				if ((_global_id == _conflicting_id) && (_global_id != -1)) then {
					[_group_id, _forEachIndex] call bn_selector_fnc_deselect;
				};
			} forEach _options;
		};
	} forEach bn_selector_groups;
};

bn_selector_fnc_select = {
	params ["_group_index","_item_id"];
	(bn_group_selected_items select _group_index) set [_item_id, true];
	"bn_selector_item_" + (str _group_index) + "_" + (str _item_id) setMarkerTypeLocal BN_SELECTED_MARKER;
	private _options_array = (bn_selector_groups select _group_index) select 2;
	[(_options_array select _item_id) select 3,_group_index] call bn_selector_deselect_conflicting_options;
};

bn_selector_fnc_deselect = {
	params ["_group_index","_item_id"];
	(bn_group_selected_items select _group_index) set [_item_id, false];
	"bn_selector_item_" + (str _group_index) + "_" + (str _item_id) setMarkerTypeLocal BN_SELECTABLE_MARKER;
};

bn_selector_receive_click = { // [coords]
	private _coords = _this select 0;
	{
		private _options = _x select 2;
		private _group_index = _forEachIndex;
		private _current_group = _x;
		{
			private _target_coords = _x select 2;
			private _item_index = _forEachIndex;
			if (_coords distance _target_coords < BN_SELECTOR_CLICK_RANGE) exitWith {
				private _max_selected_items = (_current_group select 1);
				if (_max_selected_items == 1) then {
					// radio button style
					for "_i" from 0 to ((count (bn_group_selected_items select _group_index)) - 1) do {
						if (_i != _item_index) then {	// deselect all
							[_group_index, _i] call bn_selector_fnc_deselect;
						} else {	// select one
							[_group_index, _i] call bn_selector_fnc_select;
						};
					};
				} else {
					// multiple selection
					for "_i" from 0 to ((count (bn_group_selected_items select _group_index)) - 1) do {
						if (_i == _item_index) then {	// found the clicked item
							private _selected_items = (bn_group_selected_items select _group_index);
							private _selected_item_on = _selected_items select _i;
							if (!_selected_item_on && (({_x} count _selected_items) < _max_selected_items)) then {
								[_group_index, _i] call bn_selector_fnc_select;
							} else {
								// deselect maybe
								if (_selected_item_on) then {
									[_group_index, _i] call bn_selector_fnc_deselect;
								};
							};
							("bn_selector_group_" + (str _group_index)) setMarkerTextLocal ((_current_group select 0) + (format [" (выбрано %1, максимум %2)",{_x} count _selected_items,_max_selected_items]));
						};
					};
				};
			};
		} forEach _options;
	} forEach bn_selector_groups;
	if (_coords distance (markerPos "bn_commit_marker") < BN_SELECTOR_CLICK_RANGE) then {
		private _have_empty_groups = false;
		{
			_x params BN_SELECTOR_GROUP_PARAMS;
			private _selected_options = bn_group_selected_items select _forEachIndex;
			diag_log (format ["Group %1, empty: %2, allowed empty: %3", _forEachIndex, ({_x} count _selected_options < 1), _allow_empty]);
			if (({_x} count _selected_options < 1) && !_allow_empty) then {
				_have_empty_groups = true;
			};
		} forEach bn_selector_groups;
		
		if (_have_empty_groups) exitWith {
			"bn_commit_marker" setMarkerTextLocal "Завершить выбор (НЕ СДЕЛАН ОБЯЗАТЕЛЬНЫЙ ВЫБОР)";
		};

		if (isNil "bn_commit_started") then {
			[] call bn_selector_commit;
		};
	};
};

bn_selector_record_message = {
	params ["_message"];
	if !(isNil 'tu_log_mission_message') then {
		tu_log_mission_message pushBack _message;
	};
};

bn_selector_commit = {
	if (!isNil "bn_commit_started") exitWith {
		hint "Что-то пошло не так. Код ошибки: трусы на голове.";
	};
	["bn_selector", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	bn_commit_started = true;
	{
		_x params BN_SELECTOR_GROUP_PARAMS;
		private _group_index = _forEachIndex;
		{
			if ((bn_group_selected_items select _group_index) select _forEachIndex) then {
				diag_log ("bn_selector: Executing item " + (str _forEachIndex) + " of group " + (str _group_index));
				diag_log (_x select 1);
				private _def_option = "";
				if (bn_defaults_used select _group_index) then {
					_def_option = "private _bn_default = true; ";
				} else {
					_def_option = "private _bn_default = false; ";
				};
				[] call compile (_def_option + (_x select 1));
				bn_selector_message = bn_selector_message + (_x select 0) + "\n";
			};
		} forEach _options;
	} forEach bn_selector_groups;
	{
		_x setMarkerAlphaLocal 0.2;
	} forEach bn_selector_markers;
	if (bn_selector_after_commit != "") then {
		[] call compile bn_selector_after_commit;
	};
	"bn_commit_marker" setMarkerTextLocal "Выбор сделан.";
	"bn_commit_marker" setMarkerTypeLocal "hd_flag";
};