// Клиентские скрпты, выполняются после инициализации платформы
[] call WST_fnc_reloadHeli;
[] spawn {
    waitUntil {
        sleep 1;
        !(isNil "selectedButtons");
    };
    [] call WST_fnc_turnOff;
    [] call WST_fnc_ping;
    [] call WST_fnc_sabotageDataTransmition;
};