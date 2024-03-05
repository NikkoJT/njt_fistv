// FIRE SUPPORT TEAM VEHICLE
// Artillery support on laser target

params ["_target","_isSmoke"];

private _turret = _target getVariable ["njt_var_fistv_turret",objNull];
private _laserTarget = laserTarget _turret;
private _lastSupport = missionNamespace getVariable ["njt_var_fistv_lastSupport",0];
private _timeNow = [serverTime,time] select isMultiplayer;
private _timeDiff = _timeNow - _lastSupport;
private _supportCount = missionNamespace getVariable ["njt_var_fistv_supportCount",njt_param_fistv_supportCount];

if ((_supportCount < 1) && !_isSmoke) exitWith {
	["radiobleep"] remoteExec ["playSound",(radioChannelInfo njt_var_supportChannel) select 3];
	[njt_supportcentre, [njt_var_supportChannel,"Message to observer: battery unavailable. Expect no further support. Out."]] remoteExec ["customChat"];
};

if (_timeDiff < njt_param_fistv_supportCooldown && !_isSmoke) exitWith {
	["radiobleep"] remoteExec ["playSound",(radioChannelInfo njt_var_supportChannel) select 3];
	[njt_supportcentre, [njt_var_supportChannel,format ["Message to observer: battery unavailable. Readiness ETA %1 seconds, over.",round (njt_param_fistv_supportCooldown - _timeDiff)]]] remoteExec ["customChat"];
};

if (isNull _laserTarget) exitWith {
	["radiobleep"] remoteExec ["playSound",(radioChannelInfo njt_var_supportChannel) select 3];
	[njt_supportcentre, [njt_var_supportChannel,"Message to observer: no laser target identified. Fire mission denied, over."]] remoteExec ["customChat"];
};

missionNamespace setVariable ["njt_var_fistv_hardCooldown",true,true];

missionNamespace setVariable ["njt_var_fistv_lastSupport", _timeNow, true];
if !_isSmoke then {
	_supportCount = _supportCount - 1;
	missionNamespace setVariable ["njt_var_fistv_supportCount",_supportCount, true];
};

private _startPosition = getPosATL _laserTarget;

sleep 1;

["radiobleep"] remoteExec ["playSound",(radioChannelInfo njt_var_supportChannel) select 3];
[njt_supportcentre, [njt_var_supportChannel,format [
	"Message to observer: fire mission confirmed. Grid: %1. Five rounds %2. You have %3 HE shots remaining.",
	mapGridPosition _startPosition,
	["HE, fire for effect","smoke out"] select _isSmoke,
	_supportCount
]]] remoteExec ["customChat"];

sleep 8;

["radiobleep"] remoteExec ["playSound",(radioChannelInfo njt_var_supportChannel) select 3];
[njt_supportcentre, [njt_var_supportChannel,"Rounds complete. Splash in 20 seconds."]] remoteExec ["customChat"];

sleep 20;

["radiobleep"] remoteExec ["playSound",(radioChannelInfo njt_var_supportChannel) select 3];
[njt_supportcentre, [njt_var_supportChannel,"Splash, out."]] remoteExec ["customChat"];

_laserTarget = laserTarget _turret;
if (!(isNull _laserTarget) && ((_laserTarget distance2D _startPosition) < 100)) then {
	_startPosition = getPosATL _laserTarget;
};

sleep 2;

[_startPosition,["Sh_82mm_AMOS","Smoke_120mm_AMOS_White"] select _isSmoke,50,5,[3,4],{false},2,400,200] spawn BIS_fnc_fireSupportVirtual;

missionNamespace setVariable ["njt_var_fistv_hardCooldown",false,true];