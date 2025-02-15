/*
 * Author: Westalgie
 * Create marker with given name and color at given position.
 *
 * Arguments:
 * 0: Position where marker will be created <Array format Position3D>
 * 1: Marker color name <String format Marker Color Classes>
 * 2: Marker name unique for mission scope <String or Number>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[0, 0, 0], "ColorGreen", "marker name"] call "WST_fnc_diag_displayPoint";
*/

params ["_pos", "_color", "_name"];

marker = createMarker [str _name, _pos];
marker setMarkerColor _color;
marker setMarkerType "hd_dot";