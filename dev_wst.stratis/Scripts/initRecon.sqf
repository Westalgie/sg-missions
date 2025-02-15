params ["_isBoat"];

if (_isBoat) then {
	deleteVehicle spnCar;
} else {
	deleteVehicle spnBoat;
};
