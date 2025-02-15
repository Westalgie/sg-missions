[] spawn {
	_counter = 1;
	while { _counter > 0 } do {
		speaker1 say ["CustomAlarmSound", 1000];
		speaker2 say ["CustomAlarmSound", 1000];
		_counter = _counter - 1;
		sleep 44;
	};
};