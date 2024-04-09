// FIRE SUPPORT TEAM VEHICLE
// Vehicle setup
/*
 Supported vehicles: Marshall [M/P], Marid [M/P], Gorgon, Strider (unarmed only), AH-9, MH-9, AH-99, WY-55, AH-11F
Gorgons and Striders with the passed side as WEST will be automatically textured as NATO Gorgons or Striders.
Hellcats with the passed side as EAST will be automatically textured in black.
WY-55s with the passed side as WEST will be automatically textured in NATO olive.

In object init field (AFTER assignGear call):
[this, west] call njt_fnc_fistv_init;

// REQUIRED MISSION VARIABLES: 
 njt_var_supportChannel [custom channel ID] (DEFINED IN fn_fistv_initServer.sqf)
 njt_param_fistv_supportCount [number]
 njt_param_supportCooldown [number]
 
 NOTE: the FISTV vehicle or class is not automatically added to FA3 Radio. You have to do that yourself in the FA3 Radio configuration.
*/

params ["_vehicle","_side"];

if isServer then {
	private _fistvCount = missionNamespace getVariable ["njt_var_fistv_count",0];
	missionNamespace setVariable ["njt_var_fistv_count",_fistvCount + 1,true];
	
	private _turret = _vehicle;
	
	switch (toLowerANSI typeOf _vehicle) do {
	
		// MARSHALL (Mediterranean)
		case "b_apc_wheeled_01_cannon_f" : {
			_vehicle animate ["HideTurret",1]; 
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
		// MARSHALL (Pacific)
		case "b_t_apc_wheeled_01_cannon_f" : {
			_vehicle animate ["HideTurret",1]; 
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
		// MARID (Mediterranean)
		case "o_apc_wheeled_02_rcws_v2_f" : {
			_vehicle animate ["HideTurret",1]; 
			_vehicle removeWeaponTurret ["HMG_127_APC", [0]]; 
			_vehicle removeWeaponTurret ["GMG_40mm", [0]];
			_vehicle lockTurret [[0],true];
			
			_turret = createVehicle ["O_Static_Designator_02_F",[0,0,0]]; 
			_turret attachTo [_vehicle,[0.31,-1.71,0.5]];
			private _group = _side createVehicleCrew _turret;
			_group setGroupIDGlobal [format ["MSE-3 FISTV Observer %1", _fistvCount]];

			private _t1 = createVehicle ["Land_SewerCover_02_F",[0,0,0]]; 
			_t1 attachTo [_vehicle,[0.23,-1.73,0]]; 
			private _t2 = createVehicle ["Land_PortableCabinet_01_closed_black_F",[0,0,0]]; 
			_t2 attachTo [_vehicle,[0.65,-2.6,0.04]]; 
			_t2 setDir 100; 
			private _t3 = createVehicle ["Land_PortableServer_01_black_F",[0,0,0]]; 
			_t3 attachTo [_vehicle,[-0.34,-2.6,0.04]]; 
			private _t4 = createVehicle ["Land_BatteryPack_01_closed_black_F",[0,0,0]]; 
			_t4 attachTo [_vehicle,[-0.5,-3.22,0.01]]; 
			private _t5 = createVehicle ["Land_BatteryPack_01_closed_black_F",[0,0,0]]; 
			_t5 attachTo [_vehicle,[-0.17,-3.22,0.01]]; 
			private _t6 = createVehicle ["Land_PortableCabinet_01_closed_black_F",[0,0,0]]; 
			_t6 attachTo [_vehicle,[0.75,-3.6,0.05]]; 
			_t6 setDir 85; 
			private _t7 = createVehicle ["Land_PortableLight_02_folded_black_F",[0,0,0]]; 
			_t7 attachTo [_vehicle,[-0.23,-3.8,-0.03]]; 
			_t7 setVectorDirAndUp [[0,-0.02,-1],[-1,1,1]]; 
			private _w1 = createVehicle ["Land_PortableWeatherStation_01_olive_F",[0,0,0]]; 
			_w1 attachTo [_vehicle,[0.23,-3.55,1]]; 
		};
		// MARID (Pacific)
		case "o_t_apc_wheeled_02_rcws_v2_ghex_f" : {
			_vehicle animate ["HideTurret",1]; 
			_vehicle removeWeaponTurret ["HMG_127_APC", [0]]; 
			_vehicle removeWeaponTurret ["GMG_40mm", [0]];
			_vehicle lockTurret [[0],true];
			
			_turret = createVehicle ["B_W_Static_Designator_01_F",[0,0,0]]; 
			_turret attachTo [_vehicle,[0.23,-1.63,0.5]];
			private _group = _side createVehicleCrew _turret;
			_group setGroupIDGlobal [format ["MSE-3 FISTV Observer %1", _fistvCount]];

			private _t1 = createVehicle ["Land_SewerCover_02_F",[0,0,0]]; 
			_t1 attachTo [_vehicle,[0.23,-1.73,0]]; 
			private _t2 = createVehicle ["Land_PortableCabinet_01_closed_olive_F",[0,0,0]]; 
			_t2 attachTo [_vehicle,[0.65,-2.6,0.04]]; 
			_t2 setDir 100; 
			private _t3 = createVehicle ["Land_PortableServer_01_olive_F",[0,0,0]]; 
			_t3 attachTo [_vehicle,[-0.34,-2.6,0.03]]; 
			private _t4 = createVehicle ["Land_BatteryPack_01_closed_olive_F",[0,0,0]]; 
			_t4 attachTo [_vehicle,[-0.5,-3.22,0.01]]; 
			private _t5 = createVehicle ["Land_BatteryPack_01_closed_olive_F",[0,0,0]]; 
			_t5 attachTo [_vehicle,[-0.17,-3.22,0.01]]; 
			private _t6 = createVehicle ["Land_PortableCabinet_01_closed_olive_F",[0,0,0]]; 
			_t6 attachTo [_vehicle,[0.75,-3.6,0.05]]; 
			_t6 setDir 85; 
			private _t7 = createVehicle ["Land_PortableLight_02_folded_olive_F",[0,0,0]]; 
			_t7 attachTo [_vehicle,[-0.23,-3.8,-0.03]]; 
			_t7 setVectorDirAndUp [[0,-0.02,-1],[-1,1,1]]; 
			private _w1 = createVehicle ["Land_PortableWeatherStation_01_olive_F",[0,0,0]]; 
			_w1 attachTo [_vehicle,[0.23,-3.55,1]];
		};
		// MARID (WS HMG, Pacific)
		case "o_t_apc_wheeled_02_hmg_lxws" : {
			private _t2 = createVehicle ["Land_PortableCabinet_01_closed_olive_F",[0,0,0]]; 
			_t2 attachTo [_vehicle,[0.65,-2.7,-0.02]]; 
			_t2 setDir 100; 
			private _t3 = createVehicle ["Land_PortableServer_01_olive_F",[0,0,0]]; 
			_t3 attachTo [_vehicle,[-0.34,-2.7,-0.02]]; 
			private _t4 = createVehicle ["Land_BatteryPack_01_closed_olive_F",[0,0,0]]; 
			_t4 attachTo [_vehicle,[-0.5,-3.32,-0.03]]; 
			private _t5 = createVehicle ["Land_BatteryPack_01_closed_olive_F",[0,0,0]]; 
			_t5 attachTo [_vehicle,[-0.17,-3.32,-0.03]]; 
			private _t6 = createVehicle ["Land_PortableCabinet_01_closed_olive_F",[0,0,0]]; 
			_t6 attachTo [_vehicle,[0.75,-3.7,-0.02]]; 
			_t6 setDir 85; 
			private _t7 = createVehicle ["Land_PortableLight_02_folded_olive_F",[0,0,0]]; 
			_t7 attachTo [_vehicle,[-0.23,-3.85,-0.07]]; 
			_t7 setVectorDirAndUp [[0,-0.02,-1],[-1,1,1]]; 
			private _w1 = createVehicle ["Land_PortableWeatherStation_01_olive_F",[0,0,0]]; 
			_w1 attachTo [_vehicle,[0.23,-3.55,0.94]];
		};
		// MARID (WS HMG, Mediterranean and other factions)
		case "o_sfia_apc_wheeled_02_hmg_lxws";
		case "b_una_apc_wheeled_02_hmg_lxws";
		case "o_gen_apc_wheeled_02_hmg_lxws";
		case "b_gen_apc_wheeled_02_hmg_lxws";
		case "b_ion_apc_wheeled_02_hmg_lxws";
		case "o_apc_wheeled_02_hmg_lxws" : {
			private _t2 = createVehicle ["Land_PortableCabinet_01_closed_black_F",[0,0,0]]; 
			_t2 attachTo [_vehicle,[0.65,-2.7,-0.02]]; 
			_t2 setDir 100; 
			private _t3 = createVehicle ["Land_PortableServer_01_black_F",[0,0,0]]; 
			_t3 attachTo [_vehicle,[-0.34,-2.7,-0.02]]; 
			private _t4 = createVehicle ["Land_BatteryPack_01_closed_black_F",[0,0,0]]; 
			_t4 attachTo [_vehicle,[-0.5,-3.32,-0.03]]; 
			private _t5 = createVehicle ["Land_BatteryPack_01_closed_black_F",[0,0,0]]; 
			_t5 attachTo [_vehicle,[-0.17,-3.32,-0.3]]; 
			private _t6 = createVehicle ["Land_PortableCabinet_01_closed_black_F",[0,0,0]]; 
			_t6 attachTo [_vehicle,[0.75,-3.7,-0.02]]; 
			_t6 setDir 85; 
			private _t7 = createVehicle ["Land_PortableLight_02_folded_black_F",[0,0,0]]; 
			_t7 attachTo [_vehicle,[-0.23,-3.85,-0.07]]; 
			_t7 setVectorDirAndUp [[0,-0.02,-1],[-1,1,1]]; 
			private _w1 = createVehicle ["Land_PortableWeatherStation_01_olive_F",[0,0,0]]; 
			_w1 attachTo [_vehicle,[0.23,-3.55,0.94]]; 
		};
		// MARID (WS Unarmed, Mediterranean and other factions)
		case "o_sfia_apc_wheeled_02_unarmed_lxws";
		case "b_una_apc_wheeled_02_unarmed_lxws";
		case "o_apc_wheeled_02_unarmed_lxws" : {
			private _t2 = createVehicle ["Land_PortableCabinet_01_closed_black_F",[0,0,0]]; 
			_t2 attachTo [_vehicle,[0.65,-2.6,0.04]]; 
			_t2 setDir 100; 
			private _t3 = createVehicle ["Land_PortableServer_01_black_F",[0,0,0]]; 
			_t3 attachTo [_vehicle,[-0.34,-2.6,0.04]]; 
			private _t4 = createVehicle ["Land_BatteryPack_01_closed_black_F",[0,0,0]]; 
			_t4 attachTo [_vehicle,[-0.5,-3.22,0.02]]; 
			private _t5 = createVehicle ["Land_BatteryPack_01_closed_black_F",[0,0,0]]; 
			_t5 attachTo [_vehicle,[-0.17,-3.22,0.02]]; 
			private _t6 = createVehicle ["Land_PortableCabinet_01_closed_black_F",[0,0,0]]; 
			_t6 attachTo [_vehicle,[0.75,-3.6,0.05]]; 
			_t6 setDir 85; 
			private _t7 = createVehicle ["Land_PortableLight_02_folded_black_F",[0,0,0]]; 
			_t7 attachTo [_vehicle,[-0.23,-3.8,-0.03]]; 
			_t7 setVectorDirAndUp [[0,-0.02,-1],[-1,1,1]]; 
			private _w1 = createVehicle ["Land_PortableWeatherStation_01_olive_F",[0,0,0]]; 
			_w1 attachTo [_vehicle,[0.23,-3.55,1]]; 
		};
		// MARID (WS Unarmed, Pacific)
		case "o_t_apc_wheeled_02_unarmed_lxws" : {
			private _t2 = createVehicle ["Land_PortableCabinet_01_closed_olive_F",[0,0,0]]; 
			_t2 attachTo [_vehicle,[0.65,-2.6,0.04]]; 
			_t2 setDir 100; 
			private _t3 = createVehicle ["Land_PortableServer_01_olive_F",[0,0,0]]; 
			_t3 attachTo [_vehicle,[-0.34,-2.6,0.04]]; 
			private _t4 = createVehicle ["Land_BatteryPack_01_closed_olive_F",[0,0,0]]; 
			_t4 attachTo [_vehicle,[-0.5,-3.22,0.02]]; 
			private _t5 = createVehicle ["Land_BatteryPack_01_closed_olive_F",[0,0,0]]; 
			_t5 attachTo [_vehicle,[-0.17,-3.22,0.02]]; 
			private _t6 = createVehicle ["Land_PortableCabinet_01_closed_olive_F",[0,0,0]]; 
			_t6 attachTo [_vehicle,[0.75,-3.6,0.05]]; 
			_t6 setDir 85; 
			private _t7 = createVehicle ["Land_PortableLight_02_folded_olive_F",[0,0,0]]; 
			_t7 attachTo [_vehicle,[-0.23,-3.8,-0.03]]; 
			_t7 setVectorDirAndUp [[0,-0.02,-1],[-1,1,1]]; 
			private _w1 = createVehicle ["Land_PortableWeatherStation_01_olive_F",[0,0,0]]; 
			_w1 attachTo [_vehicle,[0.23,-3.55,1]];
		};
		// GORGON (NATO / AAF)
		case "i_apc_wheeled_03_cannon_f" : {
			_vehicle animate ["HideTurret",1]; 
			_vehicle removeWeaponTurret ["autocannon_30mm_CTWS", [0]];
			_vehicle removeWeaponTurret ["LMG_coax_ext", [0]];
			_vehicle removeWeaponTurret ["missiles_titan", [0]];
			_vehicle lockTurret [[0],true];
			_vehicle lockTurret [[0,0],true];
			if (_side == west) then {
				
				_vehicle setObjectTextureGlobal [0, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa"];  
				_vehicle setObjectTextureGlobal [1, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa"];  
				_vehicle setObjectTextureGlobal [3, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa"];
			
				_turret = createVehicle ["B_Static_Designator_01_F",[0,0,0]]; 
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
		};
		// STRIDER (NATO / AAF)
		case "i_mrap_03_f" : {
			if (_side == west) then {
				_vehicle setObjectTextureGlobal [0, "A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa"];  
				private _t3 = createVehicle ["Land_PortableServer_01_sand_F",[0,0,0]]; 
				_t3 attachTo [_vehicle,[0,-0.65,0.55]]; 
				private _t4 = createVehicle ["Land_BatteryPack_01_closed_sand_F",[0,0,0]]; 
				_t4 attachTo [_vehicle,[0.8,-0.9,0.54]];
				private _t5 = createVehicle ["Land_BatteryPack_01_closed_sand_F",[0,0,0]]; 
				_t5 attachTo [_vehicle,[0.47,-0.9,0.54]];
				private _t6 = createVehicle ["Land_PortableCabinet_01_closed_sand_F",[0,0,0]]; 
				_t6 attachTo [_vehicle,[1.41,-2,0.07]];
				_t6 setVectorDirAndUp [[-0.3,-0.1,1],[1,-0.05,1]];
				private _t7 = createVehicle ["Land_PortableLight_02_folded_sand_F",[0,0,0]]; 
				_t7 attachTo [_vehicle,[-1.36,-2.5,-0.03]];  
				_t7 setVectorDirAndUp [[1,-0.02,-0.27],[0,-0.1,1]]; 
				private _w1 = createVehicle ["Land_PortableWeatherStation_01_sand_F",[0,0,0]]; 
				_w1 attachTo [_vehicle,[0,-1.45,1.3]];
			} else {
				private _t3 = createVehicle ["Land_PortableServer_01_olive_F",[0,0,0]]; 
				_t3 attachTo [_vehicle,[0,-0.65,0.55]]; 
				private _t4 = createVehicle ["Land_BatteryPack_01_closed_olive_F",[0,0,0]]; 
				_t4 attachTo [_vehicle,[0.8,-0.9,0.54]];
				private _t5 = createVehicle ["Land_BatteryPack_01_closed_olive_F",[0,0,0]]; 
				_t5 attachTo [_vehicle,[0.47,-0.9,0.54]];
				private _t6 = createVehicle ["Land_PortableCabinet_01_closed_olive_F",[0,0,0]]; 
				_t6 attachTo [_vehicle,[1.41,-2,0.07]];
				_t6 setVectorDirAndUp [[-0.3,-0.1,1],[1,-0.05,1]];
				private _t7 = createVehicle ["Land_PortableLight_02_folded_olive_F",[0,0,0]]; 
				_t7 attachTo [_vehicle,[-1.36,-2.5,-0.03]];  
				_t7 setVectorDirAndUp [[1,-0.02,-0.27],[0,-0.1,1]]; 
				private _w1 = createVehicle ["Land_PortableWeatherStation_01_olive_F",[0,0,0]]; 
				_w1 attachTo [_vehicle,[0,-1.45,1.3]];
			};
		};
		// HUMMINGBIRD
		case "b_d_heli_light_01_lxws";
		case "b_heli_light_01_f" :
		{
			_turret = createVehicle ["B_W_Static_Designator_01_F",[0,0,0]];
			_turret attachTo [_vehicle,[-0.963379,-0.476074,-0.463726]];
			private _group = _side createVehicleCrew _turret;
			_group setGroupIDGlobal [format ["OH-9 Observer %1", _fistvCount]];

			private _t1 = createVehicle ["Land_PortableServer_01_olive_F",[0,0,0]],
			_t1 attachTo [_vehicle,[-0.955566,-0.401367,-1.05528]];
			_t1 setVectorDirAndUp [[0.000,1.000,-0.000],[0.000,-0.000,1.000]];
			private _t2 = createVehicle ["Land_BatteryPack_01_closed_sand_F",[0,0,0]],
			_t2 attachTo [_vehicle,[-0.958984,0.208008,-1.05409]];
			_t2 setVectorDirAndUp [[-1.000,-0.002,-0.000],[0.000,0.004,-1.000]];
			private _t3 = createVehicle ["Land_BatteryPack_01_closed_sand_F",[0,0,0]],
			_t3 attachTo [_vehicle,[-0.958984,0.491211,-1.05462]];
			_t3 setVectorDirAndUp [[-1.000,-0.002,-0.000],[0.000,0.004,-1.000]];
			private _t4 = createVehicle ["Land_MultiScreenComputer_01_closed_sand_F",[0,0,0]],
			_t4 attachTo [_vehicle,[0.670898,-0.269531,-0.95883]];
			_t4 setVectorDirAndUp [[-0.828,0.041,0.559],[0.558,-0.037,0.829]];
			private _t5 = createVehicle ["Land_PortableLight_02_folded_sand_F",[0,0,0]],
			_t5 attachTo [_vehicle,[0.95752,0.952637,-1.00675]];
			_t5 setVectorDirAndUp [[0.000,0.008,1.000],[-0.000,-1.000,0.008]];
			private _t6 = createVehicle ["Land_PortableLight_02_folded_sand_F",[0,0,0]],
			_t6 attachTo [_vehicle,[0.95752,0.294922,-1.00722]];
			_t6 setVectorDirAndUp [[0.000,0.008,1.000],[-0.000,-1.000,0.008]];
		};
		// PAWNEE
		case "b_d_heli_light_01_dynamicloadout_lxws";
		case "b_heli_light_01_dynamicloadout_f" :
		{
			_turret = createVehicle ["B_W_Static_Designator_01_F",[0,0,0]];
			_turret attachTo [_vehicle,[-1.143,0.635,0.038]];
			private _group = _side createVehicleCrew _turret;
			_group setGroupIDGlobal [format ["AH-9 Scout Observer %1", _fistvCount]];
			
			private _t1 = createVehicle ["Land_PortableServer_01_olive_F",[0,0,0]],
			_t1 attachTo [_vehicle,[-1.160,0.565,-0.556]];
			_t1 setVectorDirAndUp [[-0.025,1.000,-0.007],[0.024,0.008,1.000]];
			private _t2 = createVehicle ["Land_BatteryPack_01_closed_sand_F",[0,0,0]],
			_t2 attachTo [_vehicle,[0.403,0.536,-0.563]];
			_t2 setVectorDirAndUp [[0.076,0.997,-0.010],[0.024,0.008,1.000]];
			private _t3 = createVehicle ["Land_BatteryPack_01_closed_sand_F",[0,0,0]],
			_t3 attachTo [_vehicle,[0.118,0.556,-0.557]];
			_t3 setVectorDirAndUp [[0.076,0.997,-0.010],[0.024,0.008,1.000]];
			private _t4 = createVehicle ["Land_MultiScreenComputer_01_closed_sand_F",[0,0,0]],
			_t4 attachTo [_vehicle,[-0.393,0.547,-0.476]];
			_t4 setVectorDirAndUp [[0.349,-0.937,-0.001],[0.024,0.008,1.000]];
			private _t5 = createVehicle ["Land_PortableLight_02_folded_sand_F",[0,0,0]],
			_t5 attachTo [_vehicle,[1.197,0.541,-0.632]];
			_t5 setVectorDirAndUp [[0.005,-0.000,-1.000],[0.000,-1.000,0.000]];
			private _t6 = createVehicle ["Land_PortableLight_02_folded_sand_F",[0,0,0]],
			_t6 attachTo [_vehicle,[0.761,0.535,-0.629]];
			_t6 setVectorDirAndUp [[-0.018,-0.000,-1.000],[0.000,-1.000,0.000]];
		};
		// AH-11F
		case "b_heli_light_03_unarmed_rf";
		case "b_heli_light_03_dynamicloadout_rf";
		case "i_e_heli_light_03_dynamicloadout_rf";
		case "i_e_heli_light_03_unarmed_rf" :
		{
			if (_side == east) then {
				[_vehicle,["Black",1]] call BIS_fnc_initVehicle;
			};
		};
		// WY-55
		case "b_heli_light_03_unarmed_f";
		case "b_heli_light_03_dynamicloadout_f";
		case "i_e_heli_light_03_dynamicloadout_f";
		case "i_e_heli_light_03_unarmed_f" :
		{
			if (_side == west) then {
				_vehicle setObjectTextureGlobal [0,"\lxRF\air_rf\Heli_Light_03\data\Heli_Light_03_base_olive_CO.paa"];
			};
			if (_side == east) then {
				[_vehicle,["Black",1]] call BIS_fnc_initVehicle;
			};
			_vehicle addMagazineTurret ["LaserBatteries",[0]];
			_vehicle addWeaponTurret ["LaserDesignator_Mounted",[0]];
		};
		// Blackfoot
		case "b_d_heli_attack_01_dynamicloadout_lxws";
		case "b_heli_attack_01_dynamicloadout_f" :
		{
		
		};
		default {
			systemChat format ["WARNING: NJT FISTV init ran on an incompatible vehicle! It won't work properly! %1",typeOf _vehicle];
		};
	};
	
	if (_turret != _vehicle) then {
		[_turret,false] remoteExec ["allowDamage",0,true];
		_turret enableWeaponDisassembly false;
		private _terminal = ["O_UavTerminal","B_UavTerminal","I_UavTerminal","C_UavTerminal"] select (_side call BIS_fnc_sideID);
		_vehicle addItemCargoGlobal [_terminal,1];
	};
	_vehicle setVariable ["njt_var_fistv_turret",_turret,true];

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
};