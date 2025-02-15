class WST {
    class Actions {
        file = "Scripts\Actions";

        class ping {};
        class reloadHeli {};
        class sabotageDataTransmition {};
        class turnOff {};
    };

    class Effects {
        file = "Scripts\Effects";

        class updateTerminalScreen {};
    };

    class Objective {
        file = "Scripts\Objective";

        class createObjective {};
    };

    class Pylons {
        file = "Scripts\Pylons";

        class initPylonsManager;
    };
};