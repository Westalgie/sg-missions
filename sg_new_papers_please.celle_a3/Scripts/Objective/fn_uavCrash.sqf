/*
 * Author: Westalgie
 * Generates objective position and actor and sends it there. Handles impact and first phase of mission logic.
 *
 * Arguments: 
 * None
 *
 * Return Value:
 * None
*/

params [];

[] spawn {
	waitUntil {
		sleep 5;
		((missionNamespace getVariable ["objectiveState", 0]) == 1)
	};
	[] remoteExec ["WST_fnc_alarmSound", -2];
};

startTime = diag_tickTime + ([4 * 60, 6 * 60] call BIS_fnc_randomInt);
// startTime = diag_tickTime + 1;
waitUntil {
	sleep 10;
	// sleep 1;
	(diag_tickTime > ((missionnamespace getVariable ["a3a_var_pausedtime", 0]) + startTime));
};
missionNamespace setVariable ["objectiveState", 0, true];
_potentialZone = missionNamespace getVariable ["potentialZone" , objNull];
_generateTargetPos = {
	_posCandidate = [0,0,0];
	_approvedTargetPos = false;
	while {!_approvedTargetPos} do {
		_posCandidate = _potentialZone call BIS_fnc_randomPosTrigger;
		_approvedTargetPos = (!(_posCandidate inArea (missionNamespace getVariable ["restrictedArea1" , objNull])) && !(_posCandidate inArea (missionNamespace getVariable ["restrictedArea2" , objNull])));
	};
	[_posCandidate # 0, _posCandidate # 1, getTerrainHeightASL _posCandidate];
};

// for "_i" from 0 to 1000 do {
// 	_candidatePos = [] call _generateTargetPos;
// 	[_candidatePos, "ColorGreen", _i] call WST_fnc_diag_displayPoint;
// }; // Draw 1000 green candidate target points

_targetPos = [] call _generateTargetPos;

// [_targetPos, "ColorYellow", "targetPos"] call WST_fnc_diag_displayPoint; // Draw yellow target point on map

_initSpeed = 100;
_initHeight = (_targetPos select 2) + 2500;
_time = sqrt(2 * _initHeight / 9.8);
_offsetY = _time * _initSpeed;

// [[_targetPos select 0, (_targetPos select 1) + _offsetY, _initHeight], "ColorOrange", "spawnPos"] call WST_fnc_diag_displayPoint; // Draw orange init uav spawn point
_dummy = createVehicle ["C_Quadbike_01_F", [_targetPos select 0, (_targetPos select 1) + _offsetY, _initHeight], [], 0, "NONE"];
_uav = createVehicle ["I_UAV_02_dynamicLoadout_F", [_targetPos select 0, (_targetPos select 1) + _offsetY, _initHeight + 50], [], 0, "NONE"];
for "_i" from 1 to 4 do {
	_uav setPylonLoadOut [_i, ""];
};
_uav attachTo [_dummy, [0, 0, 0]];
_dummySelections = selectionNames _dummy;
{_dummy setObjectTextureGlobal [_x,""]} forEach _dummySelections;
_vectorDown = [0, 0, -1];
_vectorForward = [0, -1, 0];
_vectorUp = [0, 0, 1];

_dummy setVectorDirAndUp [_vectorForward, _vectorUp];

_initVelocity = velocity _dummy;
_dummy setVelocity (_vectorForward vectorMultiply _initSpeed);

[_time, _uav] remoteExec ["WST_fnc_uavEffects", [0, -2] select isDedicated];

waitUntil {
	sleep 0.3;
	_velocity = velocity _dummy;
	_vectorDir = vectorDir _dummy;
	_vectorUp = vectorUp _dummy;
	_newVectorDirAndUp = [[_vectorDir, _vectorUp], 0, 0.9, 0] call BIS_fnc_transformVectorDirAndUp;
	_dummy setVectorDirAndUp _newVectorDirAndUp;
	_dummy setVelocity _velocity;
	((getPosATL _dummy select 2) < 30)
};
_positionLocal = getPosATL _dummy;

_bomb ="rhs_ammo_9k38" createVehicle [(_positionLocal select 0),(_positionLocal select 1),0];

deleteVehicle _dummy;
deleteVehicle _uav;

missionNamespace setVariable ["objectiveState", 1, true];
[] spawn {
	[east, "opforMarkers"] call WST_fnc_hideMarkers;
	[west, "blueforMarkers"] call WST_fnc_hideMarkers;
};

sleep 0.3;

[_positionLocal] remoteExec ["WST_fnc_uavCrashSite", 2];
[_positionLocal] remoteExec ["WST_fnc_uavCrashSiteLocal", [0, -2] select isDedicated];

combatAirFreeze = diag_tickTime + 60 * 5;
borderOpenDelay = diag_tickTime + 60 * 15;

[] spawn {
	waitUntil {
		sleep 10;
		(diag_tickTime > ((missionnamespace getVariable ["a3a_var_pausedtime", 0]) + combatAirFreeze));
	};
	missionNamespace setVariable ["isCombatAirFrozen", false, true];
};

[] spawn {
	waitUntil {
		sleep 10;
		(diag_tickTime > ((missionnamespace getVariable ["a3a_var_pausedtime", 0]) + borderOpenDelay));
	};
	[east, "blueforMarkers"] call WST_fnc_hideMarkers;
	[west, "opforMarkers"] call WST_fnc_hideMarkers;
};
