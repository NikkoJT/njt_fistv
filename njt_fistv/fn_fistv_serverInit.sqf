if !isServer exitWith{};
if !(isNil "njt_supportCentre") exitWith {};

njt_var_supportChannel = 1;
publicVariable "njt_var_supportChannel";

njt_supportCentreGroup = createGroup west;
njt_supportCentre = njt_supportCentreGroup createUnit ["B_Officer_F",[0,0,0],[],-1,"NONE"];
njt_supportCentre disableAI "ALL";
njt_supportCentre allowDamage false;
njt_supportCentre hideObjectGlobal true;

njt_var_supportChannel radioChannelAdd [njt_supportCentre];
njt_supportCentreGroup setGroupIDGlobal [selectRandom ["DEALER", "SKYLANCE", "COMET", "SANDBOX", "PALACE", "JANUS", "SPOTLIGHT", "ARGO", "OVERLORD","PHAROAH","PROMETHEUS","FESTIVAL","SHOGUN"]];
publicVariable "njt_supportCentre";
sleep 0.5;
[njt_supportCentre,["- FDC","-","FDC"]] remoteExec ["setName",0,true];