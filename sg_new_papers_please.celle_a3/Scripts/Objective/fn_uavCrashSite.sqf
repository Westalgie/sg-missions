/*
 * Author: Westalgie
 * Makes sure that target position is clean from trees. Teleports wreck in it's place and handles cooling step of mission logic.
 *
 * Arguments: 
 * 0: Position to teleport wrecks <Array format Position2D or PositionATL (PositionAGL if watercraft or amphibious)>
 *
 * Return Value:
 * None
*/

params ["_pos"];

[earthPile,[(_pos select 0),(_pos select 1),0]] remoteExecCall ['setpos', 0, true];

sleep 0.5;

private _nearTerrainObjects = nearestTerrainObjects [getposATL earthPile, [], 20, false, true];
{ 
	[_x] remoteExec ['hideObject', 0, true];
} forEach _nearTerrainObjects;

private _nearTrees = nearestTerrainObjects [getposATL earthPile, ["Tree"], 40, false, true]; 
{  
	[_x,[1,true,earthPile]] remoteExec ['setdamage', 0, true];
} forEach _nearTrees;

sleep 0.5;
coolingTime = diag_tickTime + ([35 * 60, 40 * 60] call BIS_fnc_randomInt);
[] spawn {
	waitUntil {
		sleep 10;
		(diag_tickTime > ((missionnamespace getVariable ["a3a_var_pausedtime", 0]) + coolingTime));
	};

	missionNamespace setVariable ["objectiveState", 2, true];
};