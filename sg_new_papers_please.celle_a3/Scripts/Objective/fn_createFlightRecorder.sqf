// Create new flight recorder. Taken from project astra by Fighter, adapted
/*
 * Author: Fighter (Project Astra)
 * Adapted by Westalgie
 * Create flight recorder objective at given position and initialize variables for game logic.
 *
 * Arguments:
 * 0: Spawn position of a new object <Array format Position2D or PositionATL (PositionAGL if watercraft or amphibious)>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[0, 0, 0]] call "WST_fnc_createFlightRecorder";
*/

params [ "_pos" ];

private _recorder = createVehicle ["Land_BatteryPack_01_closed_sand_F", (_pos), [], 0, "NONE"];
_recorder setObjectTextureGlobal [0, "Images\flightRecorder_co.paa"];
_recorder setVehicleVarName "flightRecorder";
_recorder setVariable ["isObjective", true, true];
_recorder allowDamage false;
[_recorder, true, [0,1,1], 0] remoteExec ["ace_dragging_fnc_setCarryable", 0, true];
[_recorder, 3] remoteExec ["ace_cargo_fnc_setSize", 0, true];