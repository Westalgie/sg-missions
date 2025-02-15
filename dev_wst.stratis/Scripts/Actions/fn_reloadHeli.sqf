if (hasInterface) then {
    [
        blHeli,
        "Перезарядить НАРы",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa",
        "(_this distance _target < 6) and (_target distance airRepair < 20) and (_target getVariable 'reloadAvailable')",
        "(_caller distance _target < 6) and (_target distance airRepair < 20) and (_target getVariable 'reloadAvailable')",
        {
            availableAmmo = rocketsPylon # 4;
            if (availableAmmo < 1) then {
                hint "Зарядка невозможна: не осталось боеприпасов";
                [_target] spawn {
                    params ["_target"];
                    _target setVariable ['reloadAvailable', false, true];
                    sleep 0.5;
                    _target setVariable ['reloadAvailable', true, true];
                };
            };
            pylonDmg = blHeli getHitPointDamage (rocketsPylon # 2);
            if (pylonDmg >= 0.8) then {
                hint "Зарядка невозможна: пилон сильно поврежден или уничтожен";
                [_target] spawn {
                    params ["_target"];
                    _target setVariable ['reloadAvailable', false, true];
                    sleep 0.5;
                    _target setVariable ['reloadAvailable', true, true];
                };
            };
            currentAmmo = blHeli ammoOnPylon (rocketsPylon # 0);
            if (currentAmmo == (rocketsPylon # 3)) then {
                hint "Зарядка невозможна: полностью заряжено";
                [_target] spawn {
                    params ["_target"];
                    _target setVariable ['reloadAvailable', false, true];
                    sleep 0.5;
                    _target setVariable ['reloadAvailable', true, true];
                };
            };
        },
        {},
        {
            pylonName = rocketsPylon # 0;
            hitpointName = rocketsPylon # 0;
            maxAmmo = rocketsPylon # 3;
            availableAmmo = rocketsPylon # 4;
            currentAmmo = blHeli ammoOnPylon (rocketsPylon # 0);
            ammoDelta = maxAmmo - currentAmmo;
            ammoLeft = availableAmmo - ammoDelta;
            ammoToLoad = if (ammoLeft < 0) then { currentAmmo + availableAmmo; } else { currentAmmo + ammoDelta; };
            [blHeli, [pylonName, ammoToLoad]] remoteExec ["setAmmoOnPylon", blHeli];
            rocketsPylon set [4, ammoLeft max 0];
            missionNamespace setVariable ['rocketsPylon', rocketsPylon, true];
            hint format["Зарядка завершена: Осталось %1 шт.", ammoLeft max 0];
        },
        {},
        [], 
        2,
        10,
        false,
        false
    ] call BIS_fnc_holdActionAdd;
};