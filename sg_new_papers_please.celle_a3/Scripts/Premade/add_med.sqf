if (!isServer) exitWith {};

{
	(uniformContainer _x) addItemCargoGlobal ["ACE_fieldDressing", 4];
	(uniformContainer _x) addItemCargoGlobal ["ACE_elasticBandage", 4];
	(uniformContainer _x) addItemCargoGlobal ["ACE_packingBandage", 2];
	(uniformContainer _x) addItemCargoGlobal ["ACE_quikclot", 2];
	(uniformContainer _x) addItemCargoGlobal ["ACE_tourniquet", 2];
	(uniformContainer _x) addItemCargoGlobal ["ACE_morphine", 2];
	(uniformContainer _x) addItemCargoGlobal ["ACE_epinephrine", 2];
	(uniformContainer _x) addItemCargoGlobal ["ACE_EarPlugs", 1];
	(uniformContainer _x) addItemCargoGlobal ["ACE_splint", 1];

	if (_x getVariable "ace_medical_medicClass" > 0) then {
			clearItemCargoGlobal (backpackContainer _x);
			clearMagazineCargoGlobal (backpackContainer _x);
			clearWeaponCargoGlobal (backpackContainer _x);
	(backpackContainer _x) addItemCargoGlobal ["ACE_fieldDressing",10]; // обычная повязка
	(backpackContainer _x) addItemCargoGlobal ["ACE_elasticBandage",10]; // давящая повязка
	(backpackContainer _x) addItemCargoGlobal ["ACE_packingBandage",10]; // тампонирующая повязка
	(backpackContainer _x) addItemCargoGlobal ["ACE_quikclot",10]; // первичный перевязочный пакет
	(backpackContainer _x) addItemCargoGlobal ["ACE_splint",5]; // шина  
	(backpackContainer _x) addItemCargoGlobal ["ACE_epinephrine",10]; // адреналин
	(backpackContainer _x) addItemCargoGlobal ["ACE_morphine",10]; // морфин
	(backpackContainer _x) addItemCargoGlobal ["ACE_adenosine",10]; // аденозин
	(backpackContainer _x) addItemCargoGlobal ["ACE_salineIV_500",5]; // физраствор 500 мл
	(backpackContainer _x) addItemCargoGlobal ["ACE_tourniquet",5]; // жгут
	(backpackContainer _x) addItemCargoGlobal ["ACE_surgicalKit",1]; // хирнабор
	(backpackContainer _x) addItemCargoGlobal ["ACE_suture",10]; // швы для хирнабора (расходник)
	(backpackContainer _x) addItemCargoGlobal ["ACE_personalAidKit",5]; // аптечка
	};
} forEach playableUnits;