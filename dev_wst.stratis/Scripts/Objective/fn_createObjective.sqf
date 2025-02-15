_buttons = [[btn_1, 'lever_1'], [btn_2, 'lever_2'], [btn_3, 'lever_3'], [btn_4, 'lever_4']];
_markerNames = ['19.0.3.1', '19.0.3.2'];
_firstBtn = selectRandom _buttons;
_secondBtn = selectRandom (_buttons - [_firstBtn]);
selectedButtons = [_firstBtn, _secondBtn];
_buttonsToDelete = _buttons - selectedButtons;
{
    _btn = _x # 0;
    _marker = _x # 1;
    [_btn, ["switchposition", 1]] remoteExec ["animateSource", [0, -2] select isDedicated, true];  
    [_btn, ["power_1", 1]] remoteExec ["animateSource", [0, -2] select isDedicated, true];  
    [_btn, ["power_2", 1]] remoteExec ["animateSource", [0, -2] select isDedicated, true];  
    [_btn, ["light", 1]] remoteExec ["animateSource", [0, -2] select isDedicated, true];   
    _btn setVariable ["turnedOff", false, true];
    [_marker,"ColorGreen"] remoteExec ["setMarkerColorLocal", opCom, true];
    [_marker, (_markerNames # _foreachIndex)] remoteExec ["setMarkerTextLocal", opCom, true];
} forEach selectedButtons;
{
    deleteVehicle (_x # 0);    
} forEach _buttonsToDelete;
publicVariable "selectedButtons";