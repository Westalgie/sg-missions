params ["_trgs", "_unitSide"];

_list = [];
{
    _thisTrgList = +(list _x);
    {
        if ((side _x == _unitSide) && (alive _x)) then {
            _list pushBack _x;
        };
    } forEach _thisTrgList;
} forEach _trgs;

_resultList = _list arrayIntersect _list;

_resultList;