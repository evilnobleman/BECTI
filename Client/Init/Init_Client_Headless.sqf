if (CTI_Log_Level >= CTI_Log_Information) then { ["INFORMATION", "FILE: Client\Init\Init_Client_Headless.sqf", "Waiting for the Headless Client stabilization before sending the register request"] call CTI_CO_FNC_Log };

while {isNull player} do {
	sleep 5;
	if (CTI_Log_Level >= CTI_Log_Information) then { ["INFORMATION", "FILE: Client\Init\Init_Client_Headless.sqf", format["Waiting for Headless Client player object to be non-null: %1", player]] call CTI_CO_FNC_Log };
};

//--- PVF
if (CTI_Log_Level >= CTI_Log_Information) then { ["INFORMATION", "FILE: Client\Init\Init_Client_Headless.sqf", "Attempting to register this Headless Client on the server..."] call CTI_CO_FNC_Log };
(player) remoteExec ["CTI_PVF_SRV_RequestHCRegister", CTI_PV_SERVER];

with missionNamespace do {
	CTI_PVF_HC_OnDefenseDelegationLocalityChanged = {
		private ["_group", "_sideID"];
		
		_group = _this select 0;
		_sideID = _this select 1;
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_HC_OnDefenseDelegationLocalityChanged", format["Attempting to find the units which could lack initialization on this HC for group [%1]", _group]] call CTI_CO_FNC_Log;
		};
		
		//--- Find the units which could miss the Killed EH
		{
			if (alive _x && isNil {_x getVariable "cti_hc_managed"}) then {
				if (CTI_Log_Level >= CTI_Log_Debug) then {
					["DEBUG", "FUNCTION: CTI_PVF_HC_OnDefenseDelegationLocalityChanged", format["Unit [%1] (%2) was not initialized by this HC. Initializing it now", _x, typeOf _x]] call CTI_CO_FNC_Log;
				};
				
				_x addEventHandler ["killed", format["[_this select 0, _this select 1, %1] spawn CTI_CO_FNC_OnUnitKilled", _sideID]];
				_x setVariable ["cti_hc_managed", true];
			};
		} forEach units _group;
	};

	CTI_PVF_HC_OnDefenseDelegationReceived = {
		private ["_ai", "_ai_args", "_static"];
		
		_static = _this select 0;
		_ai_args = _this select 1;
		
		_gunner = gunner _static;
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_HC_OnDefenseDelegationReceived", format["A Delegation request was received from the server for the static [%1] (%2) with AI arguments [%3], local [%4]", _static, typeOf _static, _ai_args, local _static]] call CTI_CO_FNC_Log;
		};
		
		// diag_log format ["[CTI_PVF_HC_OnDefenseDelegationReceived - benny DEBUG - START] - Defense->%1, is local?->%2 | assignedGunner->%3, is local?->%4 | gunner ->%5 is local?->%6", _static, local _static, assignedGunner _static, local(assignedGunner _static), gunner _static, local gunner _static];
		
		//--- Was there an AI in there previously?
		if !(isNull _gunner) then {
			if (CTI_Log_Level >= CTI_Log_Debug) then {
				["DEBUG", "FUNCTION: CTI_PVF_HC_OnDefenseDelegationReceived", format["Defense [%1] (%2) has an assigned gunner (%3), attempting to unassign him", _static, typeOf _static, assignedGunner _static]] call CTI_CO_FNC_Log;
				// diag_log format ["[CTI_PVF_HC_OnDefenseDelegationReceived - benny DEBUG - BEFORE unassignVehicle] - Defense->%1, is local?->%2 | assignedGunner->%3, is local?->%4 | gunner ->%5 is local?->%6", _static, local _static, assignedGunner _static, local(assignedGunner _static), gunner _static, local gunner _static];
			};
			unassignVehicle (assignedGunner _static);
			// diag_log format ["[CTI_PVF_HC_OnDefenseDelegationReceived - benny DEBUG - AFTER unassignVehicle] - Defense->%1, is local?->%2 | assignedGunner->%3, is local?->%4 | gunner ->%5 is local?->%6", _static, local _static, assignedGunner _static, local(assignedGunner _static), gunner _static, local gunner _static];
			_static deleteVehicleCrew _gunner;
			// diag_log format ["[CTI_PVF_HC_OnDefenseDelegationReceived - benny DEBUG - AFTER deleteVehicleCrew] - Defense->%1, is local?->%2 | assignedGunner->%3, is local?->%4 | gunner ->%5 is local?->%6", _static, local _static, assignedGunner _static, local(assignedGunner _static), gunner _static, local gunner _static];
			deleteVehicle _gunner;
			// diag_log format ["[CTI_PVF_HC_OnDefenseDelegationReceived - benny DEBUG - AFTER deleteVehicle] - Defense->%1, is local?->%2 | assignedGunner->%3, is local?->%4 | gunner ->%5 is local?->%6", _static, local _static, assignedGunner _static, local(assignedGunner _static), gunner _static, local gunner _static];
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
		
		//--- Update the gunner's properties
		_ai setBehaviour "AWARE";
		_ai setCombatMode "RED";
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_HC_OnDefenseDelegationReceived", format["An AI [%1] has been created on the HC to man static [%2 (%3)]", _ai, _static, typeOf _static]] call CTI_CO_FNC_Log;
		};
		
		// diag_log format ["[CTI_PVF_HC_OnDefenseDelegationReceived - benny DEBUG - END] - Defense->%1, is local?->%2 | assignedGunner->%3, is local?->%4 | gunner ->%5 is local?->%6", _static, local _static, assignedGunner _static, local(assignedGunner _static), gunner _static, local gunner _static];
	};
	
	CTI_PVF_HC_OnRegisterAnswer = {
		if (_this) then {
			if (CTI_Log_Level >= CTI_Log_Information) then {["INFORMATION", "FUNCTION: CTI_PVF_HC_OnRegisterAnswer", "The Headless Client has been registered"] call CTI_CO_FNC_Log};
		} else {
			if (CTI_Log_Level >= CTI_Log_Error) then {["ERROR", "FUNCTION: CTI_PVF_HC_OnRegisterAnswer", "The Headless Client could not be registered"] call CTI_CO_FNC_Log};
		};
	};
	
	CTI_PVF_HC_OnTownDelegationReceived = {
		private ["_groups", "_hc_tvar", "_positions", "_side", "_sleep_thread", "_teams", "_town", "_town_vehicles"];
		
		_town = _this select 0;
		_side = _this select 1;
		_teams = _this select 2;
		_groups = _this select 3;
		_positions = _this select 4;
		_sleep_thread = _this select 5;//--- Debug: add a delay while HC are fucked
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_HC_OnTownDelegationReceived", format["A Delegation request was received from the server for [%1] teams in town [%2] on [%3]", count _teams, _town getVariable "cti_town_name", _side]] call CTI_CO_FNC_Log;
		};
		
		_hc_tvar = ["cti_hc_delegated_groups_occupation", "cti_hc_delegated_groups_resistance"] select (_side isEqualTo resistance);
		
		//--- Register each groups on the town for deletion
		{
			_town setVariable [_hc_tvar, ((_town getVariable [_hc_tvar, []]) pushBack _x)];
		} forEach _groups;
		
		// sleep _sleep_thread;
		
		//--- Create the desired units
		[_town, _side, _teams, _groups, _positions] spawn CTI_CO_FNC_CreateTownUnits;
	};
	
	CTI_PVF_HC_OnTownDelegationRemoval = {
		private ["_hc_tvar", "_side", "_town"];
		
		_town = _this select 0;
		_side = _this select 1;
		
		_hc_tvar = ["cti_hc_delegated_groups_occupation", "cti_hc_delegated_groups_resistance"] select (_side isEqualTo resistance);
		
		//--- Triggered only if we have units over here
		if !(isNil {_town getVariable _hc_tvar}) then {
			if (CTI_Log_Level >= CTI_Log_Information) then {
				["INFORMATION", "FUNCTION: CTI_PVF_HC_OnTownDelegationRemoval", format["A Delegation removal request was received from the server for [%1] teams present in town [%2] on side [%3]", count(_town getVariable _hc_tvar), _town getVariable "cti_town_name", _side]] call CTI_CO_FNC_Log;
			};
		
			{
				["DEBUG", "FUNCTION: CTI_PVF_HC_OnTownDelegationRemoval", format["Town [%1] group [%2] units will be removed", _town getVariable "cti_town_name", _x]] call CTI_CO_FNC_Log;
				if !(isNil '_x') then {
					["DEBUG", "FUNCTION: CTI_PVF_HC_OnTownDelegationRemoval", format["Town [%1] group [%2] is not nil", _town getVariable "cti_town_name", _x]] call CTI_CO_FNC_Log;
					if !(isNull _x) then {
						["DEBUG", "FUNCTION: CTI_PVF_HC_OnTownDelegationRemoval", format["Town [%1] group [%2] is not null ([%3] units), is local? [%4]", _town getVariable "cti_town_name", _x, count units _x, local _x]] call CTI_CO_FNC_Log;
						{
							["DEBUG", "FUNCTION: CTI_PVF_HC_OnTownDelegationRemoval", format["Town [%1] deleting unit [%2] from group [%3], local? [%4]", _town getVariable "cti_town_name", _x, group _x, local _x]] call CTI_CO_FNC_Log;
							deleteVehicle _x;
							["DEBUG", "FUNCTION: CTI_PVF_HC_OnTownDelegationRemoval", format["Town [%1] is unit removed? unit [%2]", _town getVariable "cti_town_name", _x]] call CTI_CO_FNC_Log;
						} forEach units _x;
					};
				};
			} forEach (_town getVariable _hc_tvar);
			
			//--- Destroy the variable at the end
			_town setVariable [_hc_tvar, nil];
		};
		
		//--- Wave System update, flush the current variable
		_hc_tvar = ["cti_town_occupation_groups", "cti_town_resistance_groups"] select (_side isEqualTo resistance);
		_town setVariable [_hc_tvar, []];
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_HC_OnTownDelegationRemoval", format["Unregistered town [%1] groups for side [%2]", _town getVariable "cti_town_name", _side]] call CTI_CO_FNC_Log;
		};
	};

	//--- The Headless Client receives a town groups update
	CTI_PVF_HC_UpdateTownGroups = {
		private ["_groups", "_hc_tvar", "_side", "_town"];
		
		_town = _this select 0;
		_side = _this select 1;
		_groups = _this select 2;
		
		_hc_tvar = ["cti_town_occupation_groups", "cti_town_resistance_groups"] select (_side isEqualTo resistance);
		
		_town setVariable [_hc_tvar, (_town getVariable [_hc_tvar, []]) + _groups];
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_HC_UpdateTownGroups", format["Registered [%1] Town Groups [%2] for town [%3] on side [%4]", count(_groups), _groups, _town getVariable "cti_town_name", _side]] call CTI_CO_FNC_Log;
		};
	};
	
	//--- The Headless Client receives a vehicle refuel request
	CTI_PVF_CLT_RequestVehicleRefuel = {
		private ["_fuel", "_vehicle"];
		_vehicle = _this select 0;
		_fuel = _this select 1;
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_CLT_RequestVehicleRefuel", format["Performing a refuel operation on [%1] (%2) with a fuel value of [%3]", _vehicle, typeOf _vehicle, _fuel]] call CTI_CO_FNC_Log;
		};
		
		_vehicle setFuel _fuel;
	};
	
	//--- The Headless Client receives a vehicle lock request
	CTI_PVF_CLT_RequestVehicleLock = {
		private ["_locked", "_vehicle"];
		_vehicle = _this select 0;
		_locked = _this select 1;
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_CLT_RequestVehicleLock", format["Performing a lock operation on [%1] (%2) with a lock value of [%3]", _vehicle, typeOf _vehicle, _locked]] call CTI_CO_FNC_Log;
		};
		
		_vehicle lock _locked;
	};
	
	//--- The Headless Client receives a vehicle part(s) repair request
	CTI_PVF_CLT_RequestVehicleHitPointsRepair = {
		private ["_damages", "_locked", "_repair", "_vehicle"];
		_vehicle = _this select 0;
		_hitPoints = _this select 1;
		_repair = _this select 2;
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_CLT_RequestVehicleHitPointsRepair", format["Performing a part repair operation on [%1] (%2) with a repair value of [%3]", _vehicle, typeOf _vehicle, _repair]] call CTI_CO_FNC_Log;
		};
		
		{
			_damages = _vehicle getHit _x;
			
			if !(isNil '_damages') then {
				if (_damages > 0) then {
					_repair = [_damages - _repair, 0] select (_damages - _repair < 0);
					_vehicle setHit [_x, _repair];
				};
			};
		} forEach _hitPoints;
	};
	
	//--- The Headless client receives a vehicle rearm request
	CTI_PVF_CLT_RequestVehicleRearm = {
		private ["_amount", "_vehicle"];
		_vehicle = _this select 0;
		_amount = _this select 1;
		
		if (CTI_Log_Level >= CTI_Log_Information) then {
			["INFORMATION", "FUNCTION: CTI_PVF_CLT_RequestVehicleRearm", format["Performing a rearm operation on [%1] (%2) with a rearm value of [%3]", _vehicle, typeOf _vehicle, _amount]] call CTI_CO_FNC_Log;
		};
		
		// _vehicle setVehicleAmmoDef _amount;
		_vehicle setVehicleAmmo _amount;
	};
};
