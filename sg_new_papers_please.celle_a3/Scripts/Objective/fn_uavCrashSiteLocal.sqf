/*
 * Author: Westalgie
 * Handles visual effects of cooling phase of mission logic.
 *
 * Arguments: 
 * 0: Position where particles will be created
 *
 * Return Value:
 * None
*/

params ["_pos"];

private _posATL = [(_pos select 0),(_pos select 1),0];
 
private _ps = "#particlesource" createVehicleLocal _posATL;
_ps setParticleParams [ 
	["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 7, 16, 1],
	"", "Billboard", 1, 64,
	[0, 0, 0],
	[0, 0, 2.5],
	0, 10, 7.9, 0.066, [4, 12, 20], 
	[[0.1, 0.1, 0.1, 0.4], [0.05, 0.05, 0.05, 0.7], [0.05, 0.05, 0.05, 0.9], [0.05, 0.05, 0.05, 0.8], [0.1, 0.1, 0.1, 0.5], [0.125, 0.125, 0.125, 0]],
	[0.25],
	1, 0,
	"", "", _ps]; 
_ps setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0]; 
_ps setDropInterval 0.2;

waitUntil {
	sleep 1; 
	((missionNamespace getVariable 'objectiveState') == 2);
};

deleteVehicle _ps;