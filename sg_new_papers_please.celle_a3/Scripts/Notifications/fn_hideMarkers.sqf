/*
 * Author: Westalgie
 * Hide markers from specified layer for specified side.
 *
 * Arguments:
 * 0: Side that will see effect of function running <Sides>
 * 1: Name of layer in mission.sqf that containes markers to be hidden <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [west, "myLayerName"] call "WST_fnc_hideMarkers";
*/

params [
	"_side",
	"_layerName"
];

_markers = getMissionLayerEntities _layerName select 1;
if (count _markers > 0) then {
	{
		[_x,0] remoteExec ["setMarkerAlphaLocal", _side, true];
	} forEach _markers;
};