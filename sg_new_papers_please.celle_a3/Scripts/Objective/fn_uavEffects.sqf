/*
 * Author: Westalgie
 * Handles visual effects of falling phase of mission logic
 *
 * Arguments: 
 * None
 *
 * Return Value:
 * None
*/

params ["_time", "_targetObj"];

private _posATL = _targetObj modelToWorld [0,0,0];

private _ps = "#particlesource" createVehicleLocal _posATL;
// _ps setParticleCircle [0, [0, 0, 0]];  
// _ps setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];  
// _ps setParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d", 8, 3, 1], "", "Billboard", 
// 1, 10, [0, 0, 0], [0, 0, 3.5], 0, 0.05, 0.4, 0.066, [6, 18, 26], 
// [[0.1, 0.1, 0.1, 0.4], [0.2, 0.2, 0.2, 0.2], [0.3, 0.3, 0.3, 0]], 
// [0.125], 1, 0, "", "", _ps];  
// _ps setDropInterval 0.05;
_ps setParticleParams [ 
	["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 7, 16, 1],
	"", "Billboard", 1, 20,
	[0, 0, 0],
	[0, 0, 3.5],
	0, 10, 7.9, 0.066, [6, 18, 26], 
	[[0.1, 0.1, 0.1, 0.4], [0.2, 0.2, 0.2, 0.2], [0.3, 0.3, 0.3, 0]],
	[0.125],
	1, 0,
	"", "", _ps]; 
_ps setParticleRandom [0, [0.25, 0.25, 0], [0.2, 0.2, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0]; 
_ps setDropInterval 0.05;

_ps attachTo [_targetObj, [0, 0, 1]];

sleep (_time + 3);

deleteVehicle _ps;