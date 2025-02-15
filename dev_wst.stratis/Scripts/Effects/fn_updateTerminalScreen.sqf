params ["_target", "_isFail"];

[_target, _isFail] spawn {
    params ["_target", "_isFail"];
    _root = "Images\ping";
    _status = if (_isFail) then { "\fail"; } else { "\success"; };
    {
        url = _root + _status + "\ping" + (str _target) + _x + "_co.paa";
        diag_log url;
        if (_isFail) then { sleep 1.5 } else { sleep 0.5 };
        terminal setObjectTextureGlobal [_target, url];
    } forEach ["1", "2", "3", "4"];
    missionNamespace setVariable ['pingAvailable', true, true];
};