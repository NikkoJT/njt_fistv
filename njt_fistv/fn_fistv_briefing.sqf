// FIRE SUPPORT TEAM VEHICLE
// Briefing generator

if (!hasInterface) exitWith {}; // Exit if not a player.
if (missionNamespace getVariable ["njt_var_fistv_briefingDone",false]) exitWith {};

_fistv = player createDiaryRecord ["diary", ["Fire Support Team Vehicle",format ["
<br/>
A Fire Support Team Vehicle is available in this mission. FISTVs are dedicated reconnaissance and observer vehicles, capable of calling in fire support.
<br/><br/>
<font size='18'>OPERATION</font>
<br/>
The FISTV is fitted with a laser designator turret and a long-range radio. When support is called, it will be targeted at the FISTV's laser designator target. If the laser is not illuminated, support cannot be called.
<br/><br/>
If the laser is turned off after calling or moved more than 100 metres from the initial call-in point, the support will arrive on the initial call-in point. If the laser is turned on and within 100 metres of the initial call-in point when the support arrives, it will arrive on the current laser target position.
<br/><br/>
Two types of support are available: high explosive, and smoke. There are a total of %1 HE call-ins available. There is a %2-second cooldown between HE call-ins, starting when the fire mission is confirmed. There is no limit on smoke call-ins. 
<br/><br/>
<font size='18'>INTERACTION</font>
<br/>
A player inside the FISTV can use the action menu to call for support. The observer turret can be accessed using a UAV terminal, which is provided in the vehicle inventory. (If the vehicle has a built-in recon mast or camera with laser designator, this is used without a UAV terminal.)
<br/><br/>
The fire direction centre will communicate with the observer using long-range radio channel %3.
",njt_param_fistv_supportCount,njt_param_fistv_supportCooldown,njt_var_supportChannel]]];

// Set a variable so this won't be generated again by subsequent inits
njt_var_fistv_briefingDone = true;