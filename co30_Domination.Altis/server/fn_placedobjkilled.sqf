// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_placedobjkilled.sqf"
#include "..\x_setup.sqf"

params ["_obj"];

__TRACE_1("","_obj")

private _val = _obj getVariable "d_owner";
__TRACE_1("","_val")
if (!isNil "_val") then {
	private _ar = d_placed_objs_store getVariable (getPlayerUID _val);
	if (!isNil "_ar") then {
		__TRACE_1("","_ar")
		private _fidx = _ar findIf {_x # 0 == _obj};
		__TRACE_1("","_fidx")
		if (_fidx > -1) then {
			deleteMarker (_ar # _fidx # 1);
			_ar deleteAt _fidx;
		};
	};
	_val remoteExecCall ["d_fnc_PlacedObjAn", [0, -2] select isDedicated];
};

private _content = _obj getVariable ["d_objcont", []];
if !(_content isEqualTo []) then {
	{
		deleteVehicle _x;
	} forEach _content;
};
deleteVehicle _obj;