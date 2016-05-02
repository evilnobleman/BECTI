if (CTI_Log_Level >= CTI_Log_Information) then { ["INFORMATION", "FILE: Client\Init\Init_Client_Headless.sqf", "Waiting for the Headless Client stabilization before sending the register request"] call CTI_CO_FNC_Log };

while {isNull player} do {
	sleep 5;
	if (CTI_Log_Level >= CTI_Log_Information) then { ["INFORMATION", "FILE: Client\Init\Init_Client_Headless.sqf", format["Waiting for Headless Client player object to be non-null: %1", player]] call CTI_CO_FNC_Log };
};

//--- PVF
if (CTI_Log_Level >= CTI_Log_Information) then { ["INFORMATION", "FILE: Client\Init\Init_Client_Headless.sqf", "Attempting to register this Headless Client on the server..."] call CTI_CO_FNC_Log };
["SERVER", "Request_HCRegister", player] call CTI_CO_FNC_NetSend;

with missionNamespace do {
	CTI_PVF_Client_OnDefenseDelegationLocalityChanged = {
		private ["_group", "_sideID"];
		
		_group = _this select 0;
		_sideID = _this select 1;
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_Client_OnDefenseDelegationLocalityChanged", format["Attempting to find the units which could lack initialization on this HC for group [%1]", _group]] call CTI_CO_FNC_Log;
		};
		
		//--- Find the units which could miss the Killed EH
		{
			if (alive _x && isNil {_x getVariable "cti_hc_managed"}) then {
				if (CTI_Log_Level >= CTI_Log_Debug) then {
					["DEBUG", "FUNCTION: CTI_PVF_Client_OnDefenseDelegationLocalityChanged", format["Unit [%1] (%2) was not initialized by this HC. Initializing it now", _x, typeOf _x]] call CTI_CO_FNC_Log;
				};
				
				_x addEventHandler ["killed", format["[_this select 0, _this select 1, %1] spawn CTI_CO_FNC_OnUnitKilled", _sideID]];
				_x setVariable ["cti_hc_managed", true];
			};
		} forEach units _group;
	};

	CTI_PVF_Client_OnDefenseDelegationReceived = {
		private ["_ai", "_ai_args", "_static"];
		
		_static = _this select 0;
		_ai_args = _this select 1;
		
		_gunner = gunner _static;
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_Client_OnDefenseDelegationReceived", format["A Delegation request was received from the server for the static [%1] (%2) with AI arguments [%3]", _static, typeOf _static, _ai_args]] call CTI_CO_FNC_Log;
		};
		
		diag_log format ["[CTI_PVF_Client_OnDefenseDelegationReceived - benny DEBUG - START] - Defense->%1, is local?->%2 | assignedGunner->%3, is local?->%4 | gunner ->%5 is local?->%6", _static, local _static, assignedGunner _static, local(assignedGunner _static), gunner _static, local gunner _static];
		
		//--- Was there an AI in there previously?
		if !(isNull _gunner) then {
			if (CTI_Log_Level >= CTI_Log_Debug) then {
				["DEBUG", "FUNCTION: CTI_PVF_Client_OnDefenseDelegationReceived", format["Defense [%1] (%2) has an assigned gunner (%3), attempting to unassign him", _static, typeOf _static, assignedGunner _static]] call CTI_CO_FNC_Log;
				diag_log format ["[CTI_PVF_Client_OnDefenseDelegationReceived - benny DEBUG - BEFORE UNASSIGN] - Defense->%1, is local?->%2 | assignedGunner->%3, is local?->%4 | gunner ->%5 is local?->%6", _static, local _static, assignedGunner _static, local(assignedGunner _static), gunner _static, local gunner _static];
			};
			unassignVehicle (assignedGunner _static);
			diag_log format ["[CTI_PVF_Client_OnDefenseDelegationReceived - benny DEBUG - AFTER UNASSIGN] - Defense->%1, is local?->%2 | assignedGunner->%3, is local?->%4 | gunner ->%5 is local?->%6", _static, local _static, assignedGunner _static, local(assignedGunner _static), gunner _static, local gunner _static];
			deleteVehicle _gunner;
			diag_log format ["[CTI_PVF_Client_OnDefenseDelegationReceived - benny DEBUG - AFTER DELETE] - Defense->%1, is local?->%2 | assignedGunner->%3, is local?->%4 | gunner ->%5 is local?->%6", _static, local _static, assignedGunner _static, local(assignedGunner _static), gunner _static, local gunner _static];
			deleteVehicle (gunner _static);
		};
		
		//--- Create the unit
		_ai = (_ai_args) call CTI_CO_FNC_CreateUnit;
		
		//--- Mark the unit as initialized localy, if the locality changed we don't want to have 2 KEH.
		_ai setVariable ["cti_hc_managed", true];
		_ai reveal _static;
		
		//--- Assign him to the defense
		[_ai] allowGetIn true;
		_ai assignAsGunner _static;
		[_ai] orderGetIn true;
		_ai moveInGunner _static;
		
		diag_log format ["[CTI_PVF_Client_OnDefenseDelegationReceived - benny DEBUG - END] - Defense->%1, is local?->%2 | assignedGunner->%3, is local?->%4 | gunner ->%5 is local?->%6", _static, local _static, assignedGunner _static, local(assignedGunner _static), gunner _static, local gunner _static];
	};
	
	CTI_PVF_Client_OnRegisterAnswer = {
		if (_this) then {
			if (CTI_Log_Level >= CTI_Log_Information) then {["INFORMATION", "FUNCTION: CTI_PVF_Client_OnRegisterAnswer", "The Headless Client has been registered"] call CTI_CO_FNC_Log};
		} else {
			if (CTI_Log_Level >= CTI_Log_Error) then {["ERROR", "FUNCTION: CTI_PVF_Client_OnRegisterAnswer", "The Headless Client could not be registered"] call CTI_CO_FNC_Log};
		};
	};
	
	CTI_PVF_Client_OnTownDelegationReceived = {
		private ["_groups", "_hc_tvar", "_positions", "_side", "_teams", "_town", "_town_vehicles"];
		
		_town = _this select 0;
		_side = _this select 1;
		_teams = _this select 2;
		_groups = _this select 3;
		_positions = _this select 4;
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_Client_OnTownDelegationReceived", format["A Delegation request was received from the server for [%1] teams in town [%2] on [%3]", count _teams, _town getVariable "cti_town_name", _side]] call CTI_CO_FNC_Log;
		};
		
		_town_vehicles = [_town, _side, _teams, _groups, _positions] call CTI_CO_FNC_CreateTownUnits;
		
		if (count _town_vehicles > 0) then {
			["SERVER", "Request_TownAddVehicles", [_town, _side, _town_vehicles]] call CTI_CO_FNC_NetSend;
		};
		
		_hc_tvar = if (_side == resistance) then {"cti_hc_delegated_groups_resistance"} else {"cti_hc_delegated_groups_occupation"};
		
		{
			//--- Register each groups on the town for deletion
			if (isNil {_town getVariable _hc_tvar}) then {_town setVariable [_hc_tvar, [_x]]} else {_town setVariable [_hc_tvar, (_town getVariable _hc_tvar) + [_x]]};
		// commented in for delegation removal via pvf
			/*_x spawn {
				while {count units _this > 0} do {sleep 5}; 
				deleteGroup _this;
			};*/
		} forEach _groups; //--- Delete the group client-sided.
	};
	
	CTI_PVF_Client_OnTownDelegationRemoval = {
		private ["_hc_tvar", "_side", "_town"];
		
		_town = _this select 0;
		_side = _this select 1;
		
		_hc_tvar = if (_side == resistance) then {"cti_hc_delegated_groups_resistance"} else {"cti_hc_delegated_groups_occupation"};
		
		//--- Triggered only if we have units over here
		if !(isNil {_town getVariable _hc_tvar}) then {
			if (CTI_Log_Level >= CTI_Log_Information) then {
				["INFORMATION", "FUNCTION: CTI_PVF_Client_OnTownDelegationRemoval", format["A Delegation removal request was received from the server for [%1] teams present in town [%2] on side [%3]", count(_town getVariable _hc_tvar), _town getVariable "cti_town_name", _side]] call CTI_CO_FNC_Log;
			};
		
			{
				["DEBUG", "FUNCTION: CTI_PVF_Client_OnTownDelegationRemoval", format["Town [%1] group [%2] units will be removed", _town getVariable "cti_town_name", _x]] call CTI_CO_FNC_Log;
				if !(isNil '_x') then {
					["DEBUG", "FUNCTION: CTI_PVF_Client_OnTownDelegationRemoval", format["Town [%1] group [%2] is not nil", _town getVariable "cti_town_name", _x]] call CTI_CO_FNC_Log;
					if !(isNull _x) then {
						["DEBUG", "FUNCTION: CTI_PVF_Client_OnTownDelegationRemoval", format["Town [%1] group [%2] is not null ([%3] units), is local? [%4]", _town getVariable "cti_town_name", _x, count units _x, local _x]] call CTI_CO_FNC_Log;
						{
							["DEBUG", "FUNCTION: CTI_PVF_Client_OnTownDelegationRemoval", format["Town [%1] deleting unit [%2] from group [%3], local? [%4]", _town getVariable "cti_town_name", _x, group _x, local _x]] call CTI_CO_FNC_Log;
							deleteVehicle _x;
							["DEBUG", "FUNCTION: CTI_PVF_Client_OnTownDelegationRemoval", format["Town [%1] is unit removed? unit [%2]", _town getVariable "cti_town_name", _x]] call CTI_CO_FNC_Log;
						} forEach units _x;
						["DEBUG", "FUNCTION: CTI_PVF_Client_OnTownDelegationRemoval", format["Town [%1] group [%2] is about to be removed, units count [%3]", _town getVariable "cti_town_name", _x, count units _x]] call CTI_CO_FNC_Log;
						deleteGroup _x;
						["DEBUG", "FUNCTION: CTI_PVF_Client_OnTownDelegationRemoval", format["Town [%1] group [%2] was deleted?", _town getVariable "cti_town_name", _x]] call CTI_CO_FNC_Log;
					};
				};
			} forEach (_town getVariable _hc_tvar);
			
			//--- Destroy the variable at the end
			_town setVariable [_hc_tvar, nil];
		};
	};
};
