// FIRE SUPPORT TEAM VEHICLE
// Vehicle setup
/*
 Supported vehicles: Marshall [M/P], Marid [M/P], Gorgon
Gorgons with the passed side as WEST will be automatically textured as NATO Gorgons

In object init field (AFTER assignGear call):
[this, west] call njt_fnc_fistv_init;

// REQUIRED MISSION VARIABLES: 
njt_supportCentre [unit]
 njt_var_supportChannel [custom channel ID]
 njt_param_fistv_supportCount [number]
 njt_param_supportCooldown [number]
 
 NOTE: the FISTV vehicle or class is not automatically added to FA3 Radio. You have to do that yourself in the FA3 Radio configuration.
*/

params ["_vehicle","_side"];

if isServer then {
	private _fistvCount = missionNamespace getVariable ["njt_var_fistv_count",0];
	missionNamespace setVariable ["njt_var_fistv_count",_fistvCount + 1,true];

	_vehicle animate ["HideTurret",1]; 
	
	private _turret = objNull;
	
	switch (toLowerANSI typeOf _vehicle) do {
	
		case "b_apc_wheeled_01_cannon_f" : {
			_vehicle removeWeaponTurret ["autocannon_40mm_CTWS", [0]]; 
			_vehicle removeWeaponTurret ["LMG_coax", [0]];
			_vehicle lockTurret [[0,0],true];
			_vehicle lockTurret [[0],true];
			
			_turret = createVehicle ["B_Static_Designator_01_F",[0,0,0]];
			_turret attachTo [_vehicle,[0,-1.4,0.31],"turret_base"];
			private _group = _side createVehicleCrew _turret;
			_group setGroupIDGlobal [format ["AMV-7 FISTV Observer %1", _fistvCount]];

			private _t1 = createVehicle ["Land_SewerCover_02_F",[0,0,0]];
			_t1 attachTo [_vehicle,[0,-1.5,-0.15],"turret_base"];
			private _t2 = createVehicle ["Land_PortableCabinet_01_closed_sand_F",[0,0,0]];
			_t2 attachTo [_vehicle,[0.6,-2.4,-0.03],"turret_base"];
			_t2 setDir 4;
			private _t3 = createVehicle ["Land_PortableServer_01_sand_F",[0,0,0]];
			_t3 attachTo [_vehicle,[-0.34,-2.5,-0.03],"turret_base"];
			private _t4 = createVehicle ["Land_BatteryPack_01_closed_sand_F",[0,0,0]];
			_t4 attachTo [_vehicle,[-0.5,-3.12,-0.04],"turret_base"];
			private _t5 = createVehicle ["Land_BatteryPack_01_closed_sand_F",[0,0,0]];
			_t5 attachTo [_vehicle,[-0.17,-3.12,-0.04],"turret_base"];
			private _t6 = createVehicle ["Land_PortableCabinet_01_closed_sand_F",[0,0,0]];
			_t6 attachTo [_vehicle,[0.6,-3,-0.03],"turret_base"];
			_t6 setDir -3;
			private _t7 = createVehicle ["Land_PortableLight_02_folded_sand_F",[0,0,0]];
			_t7 attachTo [_vehicle,[-0.43,-3.68,-0.1],"turret_base"];
			_t7 setVectorDirAndUp [[0,-0.02,-1],[-1,1,1]];
			
			private _w1 = createVehicle ["Land_PortableWeatherStation_01_sand_F",[0,0,0]];
			_w1 attachTo [_vehicle,[0,-3.7,0.9],"turret_base"];
		};
		case "b_t_apc_wheeled_01_cannon_f" : {
			_vehicle removeWeaponTurret ["autocannon_40mm_CTWS", [0]]; 
			_vehicle removeWeaponTurret ["LMG_coax", [0]];
			_vehicle lockTurret [[0,0],true];
			_vehicle lockTurret [[0],true];
			
			_turret = createVehicle ["B_W_Static_Designator_01_F",[0,0,0]];
			_turret attachTo [_vehicle,[0,-1.4,0.31],"turret_base"];
			private _group = _side createVehicleCrew _turret;
			_group setGroupIDGlobal [format ["AMV-7 FISTV Observer %1", _fistvCount]];

			private _t1 = createVehicle ["Land_SewerCover_02_F",[0,0,0]];
			_t1 attachTo [_vehicle,[0,-1.5,-0.15],"turret_base"];
			private _t2 = createVehicle ["Land_PortableCabinet_01_closed_olive_F",[0,0,0]];
			_t2 attachTo [_vehicle,[0.6,-2.4,-0.03],"turret_base"];
			_t2 setDir 4;
			private _t3 = createVehicle ["Land_PortableServer_01_olive_F",[0,0,0]];
			_t3 attachTo [_vehicle,[-0.34,-2.5,-0.03],"turret_base"];
			private _t4 = createVehicle ["Land_BatteryPack_01_closed_olive_F",[0,0,0]];
			_t4 attachTo [_vehicle,[-0.5,-3.12,-0.04],"turret_base"];
			private _t5 = createVehicle ["Land_BatteryPack_01_closed_olive_F",[0,0,0]];
			_t5 attachTo [_vehicle,[-0.17,-3.12,-0.04],"turret_base"];
			private _t6 = createVehicle ["Land_PortableCabinet_01_closed_olive_F",[0,0,0]];
			_t6 attachTo [_vehicle,[0.6,-3,-0.03],"turret_base"];
			_t6 setDir -3;
			private _t7 = createVehicle ["Land_PortableLight_02_folded_olive_F",[0,0,0]];
			_t7 attachTo [_vehicle,[-0.43,-3.68,-0.1],"turret_base"];
			_t7 setVectorDirAndUp [[0,-0.02,-1],[-1,1,1]];
			
			private _w1 = createVehicle ["Land_PortableWeatherStation_01_olive_F",[0,0,0]];
			_w1 attachTo [_vehicle,[0,-3.7,0.9],"turret_base"];
		};
		case "o_apc_wheeled_02_rcws_v2_f" : {
			_vehicle removeWeaponTurret ["HMG_127_APC", [0]]; 
			_vehicle removeWeaponTurret ["GMG_40mm", [0]];
			_vehicle lockTurret [[0],true];
			
			private _turret = createVehicle ["O_Static_Designator_01_F",[0,0,0]]; 
			_turret attachTo [_vehicle,[0.23,-1.63,0.5]];
			private _group = _side createVehicleCrew _turret;
			_group setGroupIDGlobal [format ["MSE-3 FISTV Observer %1", _fistvCount]];

			private _t1 = createVehicle ["Land_SewerCover_02_F",[0,0,0]]; 
			_t1 attachTo [_vehicle,[0.23,-1.73,0]]; 
			private _t2 = createVehicle ["Land_PortableCabinet_01_closed_black_F",[0,0,0]]; 
			_t2 attachTo [_vehicle,[0.65,-2.6,0.04]]; 
			_t2 setDir 100; 
			private _t3 = createVehicle ["Land_PortableServer_01_black_F",[0,0,0]]; 
			_t3 attachTo [_vehicle,[-0.34,-2.6,0.05]]; 
			private _t4 = createVehicle ["Land_BatteryPack_01_closed_black_F",[0,0,0]]; 
			_t4 attachTo [_vehicle,[-0.5,-3.22,0.04]]; 
			private _t5 = createVehicle ["Land_BatteryPack_01_closed_black_F",[0,0,0]]; 
			_t5 attachTo [_vehicle,[-0.17,-3.22,0.04]]; 
			private _t6 = createVehicle ["Land_PortableCabinet_01_closed_black_F",[0,0,0]]; 
			_t6 attachTo [_vehicle,[0.75,-3.6,0.05]]; 
			_t6 setDir 85; 
			private _t7 = createVehicle ["Land_PortableLight_02_folded_black_F",[0,0,0]]; 
			_t7 attachTo [_vehicle,[-0.23,-3.7,-0.03]]; 
			_t7 setVectorDirAndUp [[0,-0.02,-1],[-1,1,1]]; 

			private _w1 = createVehicle ["Land_PortableWeatherStation_01_olive_F",[0,0,0]]; 
			_w1 attachTo [_vehicle,[0.23,-3.55,1]]; 
		};
		case "o_t_apc_wheeled_02_rcws_v2_f" : {
			_vehicle removeWeaponTurret ["HMG_127_APC", [0]]; 
			_vehicle removeWeaponTurret ["GMG_40mm", [0]];
			_vehicle lockTurret [[0],true];
			
			private _turret = createVehicle ["B_W_Static_Designator_01_F",[0,0,0]]; 
			_turret attachTo [_vehicle,[0.23,-1.63,0.5]];
			private _group = _side createVehicleCrew _turret;
			_group setGroupIDGlobal [format ["MSE-3 FISTV Observer %1", _fistvCount]];

			private _t1 = createVehicle ["Land_SewerCover_02_F",[0,0,0]]; 
			_t1 attachTo [_vehicle,[0.23,-1.73,0]]; 
			private _t2 = createVehicle ["Land_PortableCabinet_01_closed_olive_F",[0,0,0]]; 
			_t2 attachTo [_vehicle,[0.65,-2.6,0.04]]; 
			_t2 setDir 100; 
			private _t3 = createVehicle ["Land_PortableServer_01_olive_F",[0,0,0]]; 
			_t3 attachTo [_vehicle,[-0.34,-2.6,0.05]]; 
			private _t4 = createVehicle ["Land_BatteryPack_01_closed_olive_F",[0,0,0]]; 
			_t4 attachTo [_vehicle,[-0.5,-3.22,0.04]]; 
			private _t5 = createVehicle ["Land_BatteryPack_01_closed_olive_F",[0,0,0]]; 
			_t5 attachTo [_vehicle,[-0.17,-3.22,0.04]]; 
			private _t6 = createVehicle ["Land_PortableCabinet_01_closed_olive_F",[0,0,0]]; 
			_t6 attachTo [_vehicle,[0.75,-3.6,0.05]]; 
			_t6 setDir 85; 
			private _t7 = createVehicle ["Land_PortableLight_02_folded_olive_F",[0,0,0]]; 
			_t7 attachTo [_vehicle,[-0.23,-3.7,-0.03]]; 
			_t7 setVectorDirAndUp [[0,-0.02,-1],[-1,1,1]]; 

			private _w1 = createVehicle ["Land_PortableWeatherStation_01_olive_F",[0,0,0]]; 
			_w1 attachTo [_vehicle,[0.23,-3.55,1]];
		};
		case "i_apc_wheeled_03_cannon_f" : {
			if (_side == west) then {
				_vehicle removeWeaponTurret ["autocannon_30mm_CTWS", [0]];
				_vehicle removeWeaponTurret ["LMG_coax_ext", [0]];
				_vehicle removeWeaponTurret ["missiles_titan", [0]];
				_vehicle lockTurret [[0],true];
				_vehicle lockTurret [[0,0],true];
				
				_vehicle setObjectTextureGlobal [0, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa"];  
				_vehicle setObjectTextureGlobal [1, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa"];  
				_vehicle setObjectTextureGlobal [3, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa"];
			
				private _turret = createVehicle ["B_Static_Designator_01_F",[0,0,0]]; 
				_turret attachTo [_vehicle,[0.41,-1.06,0.2]]; 
				private _group = _side createVehicleCrew _turret;
				_group setGroupIDGlobal [format ["AFV-12 FISTV Observer %1", _fistvCount]];
				
				private _t1 = createVehicle ["Land_SewerCover_02_F",[0,0,0]]; 
				_t1 attachTo [_vehicle,[0.41,-1.16,-0.30]]; 
				private _t2 = createVehicle ["Land_PortableCabinet_01_closed_sand_F",[0,0,0]]; 
				_t2 attachTo [_vehicle,[0.85,-2.4,-0.15]];
				_t2 setDir -3; 
				private _t3 = createVehicle ["Land_PortableServer_01_sand_F",[0,0,0]]; 
				_t3 attachTo [_vehicle,[-0.24,-2.4,-0.15]]; 
				private _t4 = createVehicle ["Land_BatteryPack_01_closed_sand_F",[0,0,0]]; 
				_t4 attachTo [_vehicle,[-0.4,-3.02,-0.15]]; 
				private _t5 = createVehicle ["Land_BatteryPack_01_closed_sand_F",[0,0,0]]; 
				_t5 attachTo [_vehicle,[-0.07,-3.02,-0.15]]; 
				private _t6 = createVehicle ["Land_PortableCabinet_01_closed_sand_F",[0,0,0]]; 
				_t6 attachTo [_vehicle,[0.77,-3.6,-0.15]]; 
				_t6 setDir 5; 
				private _t7 = createVehicle ["Land_PortableLight_02_folded_sand_F",[0,0,0]]; 
				_t7 attachTo [_vehicle,[0,-3.7,-0.18]]; 
				_t7 setVectorDirAndUp [[0,-0.02,-1],[-1,1,1]]; 

				private _w1 = createVehicle ["Land_PortableWeatherStation_01_sand_F",[0,0,0]]; 
				_w1 attachTo [_vehicle,[0.43,-3.55,0.8]];
			} else {
				_vehicle removeWeaponTurret ["autocannon_30mm_CTWS", [0]];
				_vehicle removeWeaponTurret ["LMG_coax_ext", [0]];
				_vehicle removeWeaponTurret ["missiles_titan", [0]];
				_vehicle lockTurret [[0],true];
				_vehicle lockTurret [[0,0],true];
				
				private _turret = createVehicle ["B_W_Static_Designator_01_F",[0,0,0]]; 
				_turret attachTo [_vehicle,[0.41,-1.06,0.2]];
				private _group = _side createVehicleCrew _turret;
				_group setGroupIDGlobal [format ["AFV-12 FISTV Observer %1", _fistvCount]];
				
				private _t1 = createVehicle ["Land_SewerCover_02_F",[0,0,0]]; 
				_t1 attachTo [_vehicle,[0.41,-1.16,-0.30]]; 
				private _t2 = createVehicle ["Land_PortableCabinet_01_closed_olive_F",[0,0,0]]; 
				_t2 attachTo [_vehicle,[0.85,-2.4,-0.15]];
				_t2 setDir -3; 
				private _t3 = createVehicle ["Land_PortableServer_01_black_F",[0,0,0]]; 
				_t3 attachTo [_vehicle,[-0.24,-2.4,-0.15]]; 
				private _t4 = createVehicle ["Land_BatteryPack_01_closed_black_F",[0,0,0]]; 
				_t4 attachTo [_vehicle,[-0.4,-3.02,-0.15]]; 
				private _t5 = createVehicle ["Land_BatteryPack_01_closed_black_F",[0,0,0]]; 
				_t5 attachTo [_vehicle,[-0.07,-3.02,-0.15]]; 
				private _t6 = createVehicle ["Land_PortableCabinet_01_closed_black_F",[0,0,0]]; 
				_t6 attachTo [_vehicle,[0.77,-3.6,-0.15]]; 
				_t6 setDir 5; 
				private _t7 = createVehicle ["Land_PortableLight_02_folded_olive_F",[0,0,0]]; 
				_t7 attachTo [_vehicle,[0,-3.7,-0.18]]; 
				_t7 setVectorDirAndUp [[0,-0.02,-1],[-1,1,1]]; 

				private _w1 = createVehicle ["Land_PortableWeatherStation_01_olive_F",[0,0,0]]; 
				_w1 attachTo [_vehicle,[0.43,-3.55,0.8]];
			};
			default {
				systemChat format ["WARNING: NJT FISTV init ran on an incompatible vehicle! It won't work properly! %1",typeOf _vehicle];
			};
		};
	};
	
	[_turret,false] remoteExec ["allowDamage",0,true];
	_turret enableWeaponDisassembly false;
	_vehicle setVariable ["njt_var_fistv_turret",_turret,true];
	
	private _terminal = ["O_UavTerminal","B_UavTerminal","I_UavTerminal","C_UavTerminal"] select (_side call BIS_fnc_sideID);
	_vehicle addItemCargoGlobal [_terminal,1];
};
if (alive _vehicle) then {

	_vehicle addEventHandler ["Killed",{
		params ["_unit"];
		if (local _unit) then {
			{
				deleteVehicle _x;
			} forEach (attachedObjects _unit);
		};
	}];
	
	[
		_vehicle,
		"Call fire support on laser",
		"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa",
		"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa",
		"(objectParent _this == _target) && {!(missionNamespace getVariable ['njt_var_fistv_hardcooldown',false])}",
		"(objectParent _caller == _target) && {!(missionNamespace getVariable ['njt_var_fistv_hardcooldown',false])}",
		{},
		{playSound3D ["A3\Sounds_F_Orange\MissionSFX\Orange_Action_Wheel.wss", objNull, false, getPosASL _caller, 1, 0.9 + 0.2 * _frame / 24]},
		{
			[_target,false] spawn njt_fnc_fistv_support;
			showCommandingMenu "RscGroupRootMenu";
			showCommandingMenu "";
		},
		{},
		[],
		4,
		0,
		false,
		false,
		false
	] call bis_fnc_holdActionAdd;
	
	[
		_vehicle,
		"Call smoke support on laser",
		"a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa",
		"a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa",
		"(objectParent _this == _target) && {!(missionNamespace getVariable ['njt_var_fistv_hardcooldown',false])}",
		"(objectParent _caller == _target) && {!(missionNamespace getVariable ['njt_var_fistv_hardcooldown',false])}",
		{},
		{playSound3D ["A3\Sounds_F_Orange\MissionSFX\Orange_Action_Wheel.wss", objNull, false, getPosASL _caller, 1, 0.9 + 0.2 * _frame / 24]},
		{
			[_target,true] spawn njt_fnc_fistv_support;
			showCommandingMenu "RscGroupRootMenu";
			showCommandingMenu "";
		},
		{},
		[],
		4,
		0,
		false,
		false,
		false
	] call bis_fnc_holdActionAdd;
};
0 spawn {
	waitUntil {!isNil "njt_var_supportChannel"};
	call njt_fnc_fistv_briefing;
	njt_supportCentre setName ["- FDC","-","FDC"];
	if (isServer) then {
		njt_var_supportChannel radioChannelAdd [njt_supportCentre];
		group njt_supportCentre setGroupIDGlobal [selectRandom ["DEALER", "SKYLANCE", "COMET", "SANDBOX", "PALACE", "JANUS", "SPOTLIGHT", "ARGO", "OVERLORD"]];
	};
};